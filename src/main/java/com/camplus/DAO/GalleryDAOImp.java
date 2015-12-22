package com.camplus.DAO;

import com.camplus.entity.CarpoolOrder;
import com.camplus.entity.GalleryImage;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.Iterator;
import java.util.List;

/**
 * Created by mark on 5/26/15.
 */

@Repository
public class GalleryDAOImp extends GeneralDAOImp<GalleryImage> implements GalleryDAO {

    public GalleryDAOImp() {
        super(GalleryImage.class);
    }


    public List<GalleryImage> getImageByUID(String uid) {
        String hql = "from GalleryImage where galleryUserId = :m";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("m", uid);
        return query.list();
    }
}
