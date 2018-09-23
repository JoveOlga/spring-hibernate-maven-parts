package com.olgaruban.service;

import com.olgaruban.model.Part;

import java.util.List;

public interface PartService {
    /**
     * Create or Update
     * @param part
     */
    void savePart(Part part);

    /**
     * Delete part
     * @param id
     */
    void deletePart(long id);

    /**
     * Read part by id
     * @param id
     * @return
     */
    Part getPart(long id);

    /**
     * Read list of parts
     * @param page
     * @param pageSize
     * @param filter
     * @return
     */
    List<Part> getList(int page, int pageSize, String filter);

    /**
     * Read list of parts
     * @param page
     * @param pageSize
     * @param needle
     * @return
     */
    List<Part> getListByName(int page, int pageSize, String needle);

    /**
     * Get the number of pages
     * @param pageSize
     * @param filter
     * @return
     */
    int getPageCount(int pageSize, String filter);

    /**
     * Get the number of pages
     * @param pageSize
     * @param needle
     * @return
     */
    int getPageCountByName(int pageSize, String needle);

    /**
     * Get the available sets
     * @return
     */
    int getAvailableSets();

}
