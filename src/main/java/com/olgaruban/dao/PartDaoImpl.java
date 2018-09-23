package com.olgaruban.dao;

import com.olgaruban.model.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@Repository
public class PartDaoImpl implements PatrDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void savePart(Part part) {
        getSession().merge(part);
    }

    @Transactional
    public void deletePart(long id) {
        Part part = getPart(id);
        if (part != null) {
            getSession().delete(part);
        }
    }

    @Transactional
    public Part getPart(long id) {
        return (Part) getSession().get(Part.class, id);
    }

    @Transactional
    public List<Part> getList(int page, int pageSize, String filter) {
        List<Part> parts = Collections.emptyList();
        int lastPageNumber = getPageCount(pageSize, filter);
        if (page > lastPageNumber)
            page = lastPageNumber;
        String queryStr = "From Part";
        if ("required".equals(filter)) {
            queryStr = "From Part p where p.necessity = true";
        }
        if ("optional".equals(filter)) {
            queryStr = "From Part p where p.necessity = false";
        }
        Query query = getSession().createQuery(queryStr);
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        parts = query.list();
        return parts;
    }

    @Transactional
    public List<Part> getListByName(int page, int pageSize, String needle) {
        List<Part> parts = Collections.emptyList();
        Query query = getSession().createQuery("From Part p where p.name like :name");
        query.setParameter("name", needle + "%");
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        parts = query.list();
        return parts;
    }

    @Transactional
    public int getPageCount(int pageSize, String filter) {
        String queryStr = "Select count (p.id) from Part p";
        if ("required".equals(filter)) {
            queryStr = "Select count (p.id) from Part p where p.necessity = true";
        }
        if ("optional".equals(filter)) {
            queryStr = "Select count (p.id) from Part p where p.necessity = false";
        }
        Query countQuery = getSession().createQuery(queryStr);
        Long countResults = (Long) countQuery.uniqueResult();
        return (int) (Math.ceil((double)countResults / pageSize));
    }

    @Transactional
    public int getPageCountByName(int pageSize, String needle) {
        Query countQuery = getSession().createQuery("Select count (p.id) from Part p where p.name like :name");
        countQuery.setParameter("name", needle + "%");
        Long countResults = (Long) countQuery.uniqueResult();
        return (int) (Math.ceil((double)countResults / pageSize));
    }

    @Transactional
    public int getAvailableSets() {
        Query countQuery = getSession().createQuery("Select min(p.quantity) from Part p where p.necessity = :necessity")
                .setParameter("necessity", true);
        Integer countResults = (Integer) countQuery.uniqueResult();
        return countResults;
    }

    private Session getSession() {
        Session session = sessionFactory.getCurrentSession();
        if (session == null) {
            session = sessionFactory.openSession();
        }
        return session;
    }
}
