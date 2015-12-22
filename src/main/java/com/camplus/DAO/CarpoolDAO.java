package com.camplus.DAO;

import com.camplus.entity.CarpoolOrder;
import com.camplus.entity.CommenPlace;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jinmin on 5/26/15.
 */
public interface CarpoolDAO extends GeneralDAO<CommenPlace>{
    public ArrayList<CommenPlace> getCommonArray();
    //public void cancel(String orderId);
    public List<CommenPlace> getAllPlace();
}
