package com.camplus.DAO;

import com.camplus.entity.GalleryComment;

import java.util.List;

/**
 * Created by mark on 5/26/15.
 */
public interface GalleryCommentDAO extends GeneralDAO<GalleryComment> {
    public List<GalleryComment> getAllbyGID(String gid);
}
