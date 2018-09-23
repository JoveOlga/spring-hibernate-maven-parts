package com.olgaruban.service;

import com.olgaruban.dao.PatrDao;
import com.olgaruban.model.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PartServiceImpl implements PartService {

    @Autowired
    PatrDao patrDao;

    public void savePart(Part part) {
        patrDao.savePart(part);
    }

    public void deletePart(long id) {
        patrDao.deletePart(id);
    }

    public Part getPart(long id) {
        return patrDao.getPart(id);
    }

    public List<Part> getList(int page, int pageSize , String filter) {
        return patrDao.getList(page, pageSize, filter);
    }

    public List<Part> getListByName(int page, int pageSize, String needle) {
        return patrDao.getListByName(page, pageSize, needle);
    }

    public int getPageCount(int pageSize, String filter) {
        return patrDao.getPageCount(pageSize, filter);
    }

    public int getPageCountByName(int pageSize, String needle) {
        return patrDao.getPageCountByName(pageSize, needle);
    }

    public int getAvailableSets() {
        return patrDao.getAvailableSets();
    }


}
