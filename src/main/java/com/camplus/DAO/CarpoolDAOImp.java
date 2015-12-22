package com.camplus.DAO;

import com.camplus.entity.CarpoolOrder;
import com.camplus.entity.CommenPlace;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by jinmin on 5/26/15.
 */
@Repository
public class CarpoolDAOImp extends GeneralDAOImp<CommenPlace> implements CarpoolDAO{

    public CarpoolDAOImp(){ super(CommenPlace.class); }

    public ArrayList<CommenPlace> getCommonArray(){
        return new ArrayList<CommenPlace>();
    }

    /*public void cancel(String orderId){
        String hql = "from CarpoolOrder where carpoolId = :m";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("m", orderId);
        Iterator<CarpoolOrder> iter=query.list().iterator();
        while(iter.hasNext()) {
            super.delete(iter.next());
        }
    }*/

    public List<CommenPlace> getAllPlace(){
        return super.queryAll();
    }
}
