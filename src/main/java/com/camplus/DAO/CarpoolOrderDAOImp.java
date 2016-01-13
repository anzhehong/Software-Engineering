package com.camplus.DAO;

import com.camplus.entity.CarpoolOrder;
import com.camplus.entity.Course;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by jinmin on 5/26/15.
 */

@Repository
public class CarpoolOrderDAOImp extends GeneralDAOImp<CarpoolOrder> implements CarpoolOrderDAO{
    public CarpoolOrderDAOImp(){ super(CarpoolOrder.class); }
    public List<CarpoolOrder> querybyDestAndDept(String dest,String dept){
        String hql = "from CarpoolOrder as c where c.carpoolDestination = :cN And c.carpoolOriginPlace = :tN";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("cN",dest);
        query.setString("tN",dept);
        return (ArrayList<CarpoolOrder>) query.list();
    }

    public CarpoolOrder querybyId(String id){
        String hql = "from CarpoolOrder as c where c.carpoolId = :cN";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("cN", id);
        return (CarpoolOrder)query.list();
    }

    public ArrayList<CarpoolOrder> getAllOrders() {
        String hql = "from CarpoolOrder";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        return (ArrayList<CarpoolOrder>) query.list();
//        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(entityClass);
    }

    public void cancel(String orderId) {
        String hql = "from CarpoolOrder where carpoolId = :m";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("m", orderId);
        Iterator<CarpoolOrder> iter = query.list().iterator();
        while (iter.hasNext()) {
            super.delete(iter.next());
        }
    }



}
