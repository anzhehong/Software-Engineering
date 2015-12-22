package com.camplus.DAO;

import com.camplus.entity.CarpoolOrder;

import java.util.List;

/**
 * Created by jinmin on 5/26/15.
 */
public interface CarpoolOrderDAO extends GeneralDAO<CarpoolOrder>{
    public List<CarpoolOrder> querybyDestAndDept(String dest,String dept);
    public void cancel(String orderId);
    public CarpoolOrder querybyId(String id);
}
