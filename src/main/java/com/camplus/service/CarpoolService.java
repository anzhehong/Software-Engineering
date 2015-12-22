package com.camplus.service;

import com.camplus.entity.CarpoolOrder;
import com.camplus.entity.CommenPlace;

import java.util.List;
import java.util.PriorityQueue;

/**
 * Created by jinmin on 5/26/15.
 */
public interface CarpoolService {
    public List<CarpoolOrder> getAllbyDestAndDept(String destination,String departure);
    public List<CommenPlace> getAllPlace();
    public PriorityQueue<CarpoolOrder> getAllOrder();
    public CarpoolOrder getDetailbyId(String id);
    public void commit(CarpoolOrder co);
    public void cancelOrderbyId(String orderId);
    public PriorityQueue<CarpoolOrder> getAllbyAll(String dest,String dept,String date,String hour,String minute,String number);
}
