package com.camplus.DAO;

import com.camplus.entity.GalleryImage;

import java.util.List;

/**
 * Created by mark on 5/26/15.
 */
public interface GalleryDAO extends GeneralDAO<GalleryImage> {
    public List<GalleryImage> getImageByUID(String uid);
}
