package com.camplus.DAO;

import com.camplus.entity.CarpoolOrder;
import com.camplus.entity.GalleryComment;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by mark on 5/26/15.
 */
@Repository
public class GalleryCommentDAOImp extends GeneralDAOImp<GalleryComment> implements GalleryCommentDAO  {

    public GalleryCommentDAOImp() {
        super(GalleryComment.class);
    }

    @Override
    public List<GalleryComment> getAllbyGID(String gid) {
        String hql = "from GalleryComment as c where c.galleryImgId = :cN";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("cN",gid);
        return query.list();
    }
}
