package com.camplus.service;

import com.camplus.DAO.CarpoolDAO;
import com.camplus.DAO.CarpoolOrderDAO;
import com.camplus.entity.CarpoolOrder;
import com.camplus.entity.CommenPlace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;

/**
 * Created by jinmin on 5/26/15.
 */
@Service
@Transactional
public class CarpoolServiceImp implements CarpoolService{
    @Autowired
    private CarpoolDAO carpoolDAO;

    @Autowired
    private CarpoolOrderDAO carpoolOrderDAO;

    public void commit(CarpoolOrder co){
        carpoolOrderDAO.insert(co);
    }

    public List<CarpoolOrder> getAllbyDestAndDept(String destination,String departure){
        return carpoolOrderDAO.querybyDestAndDept(destination,departure);
    }

    public List<CommenPlace> getAllPlace(){
        return carpoolDAO.getAllPlace();
    }

    public PriorityQueue<CarpoolOrder> getAllOrder(){
        Date date=new Date();
        PriorityQueue<CarpoolOrder> sorted=new PriorityQueue<CarpoolOrder>(new OrderResolver(date.getYear(),date.getMonth(),date.getDay(),date.getHours(),date.getMinutes()));
        Iterator<CarpoolOrder> iter=(carpoolOrderDAO.queryAll()).iterator();
        while(iter.hasNext()){
            CarpoolOrder co=iter.next();
            sorted.add(co);
            System.out.println(co.getCarpoolDepartureTime());
        }
        return sorted;
    }

    public CarpoolOrder getDetailbyId(String id){ return carpoolOrderDAO.queryById(id);}

    public void cancelOrderbyId(String orderId){
        carpoolOrderDAO.cancel(orderId);
    }

    public PriorityQueue<CarpoolOrder> getAllbyAll(String dest,String dept,String date,String hour,String minute,String number){

        List<CarpoolOrder> cos=carpoolOrderDAO.querybyDestAndDept(dest, dept);
        Iterator<CarpoolOrder> iter=cos.iterator();
        Scanner sc=new Scanner(date);
        sc.useDelimiter("/");
        Integer goyear=Integer.parseInt(sc.next().trim());
        Integer gomonth=Integer.parseInt(sc.next().trim());
        Integer goday=Integer.parseInt(sc.next().trim());
        Integer gohour=Integer.parseInt(hour);
        Integer gominute=Integer.parseInt(minute);
        OrderResolver or=new OrderResolver(goyear,gomonth,goday,gohour,gominute);
        PriorityQueue<CarpoolOrder> filtered=new PriorityQueue<CarpoolOrder>(or);
        while(iter.hasNext()){
            CarpoolOrder co=iter.next();
            if(co.getCarpoolNumberOfStudent()<Integer.parseInt(number.trim()))continue;
            filtered.add(co);
        }
        return filtered;
    }



}

class OrderResolver implements Comparator<CarpoolOrder>{
    public OrderResolver(int y,int M,int d,int h,int m){
        date=new Date(y,M,d,h,m);
    }
    private Date date;
    public int compare(CarpoolOrder o1,CarpoolOrder o2){
        Date d1=o1.getCarpoolDepartureTime();
        Date d2=o2.getCarpoolDepartureTime();
        long diff1=Math.abs(d1.getTime() - date.getTime());
        long diff2=Math.abs(d2.getTime()-date.getTime());
        if(diff1<diff2)return -1;
        else if(diff1>diff2)return 1;
        else return 0;
    }
}