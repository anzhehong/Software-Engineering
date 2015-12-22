package com.camplus.controller;

import com.camplus.entity.CarpoolOrder;
import com.camplus.entity.CommenPlace;
import com.camplus.entity.User;
import com.camplus.service.CarpoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by fowafolo on 15/5/19.
 */


@Controller
@RequestMapping("/carpool")
public class CarpoolController {

    @Autowired
    CarpoolService carpoolService;


    @RequestMapping("/select")
    public String selectMenu(HttpServletRequest request,HttpSession session,Model model,String departure,String destination,String indexmove,String hour,String minute,String datepicker,String number){
        //carpoolService.getAllbyAll(destination,departure,datepicker,hour,minute,number);
        ArrayList<CommenPlace> cp=(ArrayList<CommenPlace>)carpoolService.getAllPlace();
        model.addAttribute("places",cp);
        PriorityQueue<CarpoolOrder> cop;
        boolean bContainer;
        if(departure==null&&destination==null){
            cop=carpoolService.getAllOrder();
        }else{
            if(datepicker==null||hour==null||number==null){
                Date date = new Date();
                hour = "" + date.getHours();
                minute = "" + date.getMinutes();
                datepicker = "" + date.getMonth() + "/" + date.getDay() + "/" + (date.getYear() + 1900);
                number = "" + 0;
            }
            cop=carpoolService.getAllbyAll(destination,departure,datepicker,hour,minute,number);
            request.setAttribute("departure",departure);
            request.setAttribute("destination",destination);
        }
        ///indeces
        int itemsperpage=10;
        int totalpage=cop.size();
        if(indexmove==null)indexmove="0";
        if(indexmove.equals("head")){
            session.setAttribute("index",new Integer(0));
        }else if(indexmove.equals("tail")){
            session.setAttribute("index",new Integer(totalpage/itemsperpage));
        }else if(indexmove.equals("prev")){
            Integer nowpage=(Integer)session.getAttribute("index");
            if(nowpage==null){
                session.setAttribute("index",new Integer(0));
            }else{
                if((nowpage)<0){
                    ///Doing Nothing
                }else{
                    if(nowpage<=0)nowpage=1;
                    session.setAttribute("index",new Integer(nowpage-1));
                }
            }
        }else if(indexmove.equals("next")){
            Integer nowpage=(Integer)session.getAttribute("index");
            if(nowpage==null){
                session.setAttribute("index",new Integer(0));
            }else{
                if((nowpage+1)>totalpage/itemsperpage){
                    ///Doing Nothing
                }else{
                    session.setAttribute("index",new Integer(nowpage+1));
                }
            }
        }else{
            String tmpIndex=new String(indexmove);
            for(int i=0;i<indexmove.length();i++){
                if(!Character.isDigit(tmpIndex.charAt(i)))indexmove="0";
            }
            Integer targetpage=Integer.parseInt(indexmove)-1;
            if(targetpage>=1&&targetpage<=totalpage/itemsperpage){
                session.setAttribute("index",targetpage);
            }else{
                session.setAttribute("index",new Integer(0));
            }
        }
        ///Page Counting
        Integer nowpage=(Integer)session.getAttribute("index");
        Iterator<CarpoolOrder> iter;
        iter=cop.iterator();
        int cnt=0;
        Vector<CarpoolOrder> vec=new Vector<CarpoolOrder>();
        while(iter.hasNext()){
            CarpoolOrder c=iter.next();
            System.out.println(c.getCarpoolDepartureTime());
            if(cnt>=(nowpage)*itemsperpage&&cnt<(nowpage+1)*itemsperpage){
                vec.add(c);
            }else if(cnt>=(nowpage+1)*itemsperpage)break;
            cnt++;
        }
        model.addAttribute("orders",vec);
        model.addAttribute("totalpage",""+(nowpage+1)+"/"+(totalpage/10+1));
        return "/Carpool/carpoolHome";
    }


    /*public String getCommonPlaces(HttpSession session,String departure,String destination,Model carpoolmodel,String indexmove) {
        if(session.getAttribute("index")==null){
            session.setAttribute("index",new Integer(0));
        }
        if(departure==null&&destination==null){
            ArrayList<CommenPlace> arrcp = (ArrayList<CommenPlace>) carpoolService.getAllPlace();
            ArrayList<CarpoolOrder> arrcpo = (ArrayList<CarpoolOrder>) carpoolService.getAllOrder();
            carpoolmodel.addAttribute("places", arrcp);
            carpoolmodel.addAttribute("places", arrcp);
            if(indexmove==null)indexmove="";
            Integer i=(Integer)session.getAttribute("index");
            if(i==null){
                i=0;
                session.setAttribute("index",i);
            }
            if(indexmove.equals("next")){
                if(i>=arrcpo.size()/5)i=arrcpo.size()/5-2;
                session.setAttribute("index",new Integer(++i));
            }else if(indexmove.equals("prev")){
                if(i<=0)i=1;
                session.setAttribute("index",new Integer(--i));
            }else if(indexmove.equals("head")){
                session.setAttribute("index",new Integer(0));
            }else if(indexmove.equals("tail")){
                session.setAttribute("index",new Integer(arrcpo.size()/5));
            }else{
                if(indexmove==null||indexmove.equals("")){
                    indexmove="1";
                }
                Integer tmp=Integer.parseInt(indexmove);
                if(tmp==null){
                    session.setAttribute("index",new Integer(0));
                }else{
                    session.setAttribute("index",tmp-1);
                }
            }//This Line Never Reach
            int cnt=0;
            i=((Integer)session.getAttribute("index"));
            ArrayList<CarpoolOrder> tobeshown=new ArrayList<CarpoolOrder>();
            Iterator<CarpoolOrder> iter=arrcpo.iterator();

            while(iter.hasNext()){  ///Magic : 5 for 5 items per page
                if(cnt>=i*5&&cnt<(i+1)*5){
                    tobeshown.add(iter.next());
                }else{
                    iter.next();
                }
                cnt++;
            }
            carpoolmodel.addAttribute("orders",tobeshown);
            return "/Carpool/carpoolHome";
        }else{
            if(indexmove==null)indexmove="0";
            ArrayList<CarpoolOrder> arrcpo = (ArrayList<CarpoolOrder>) carpoolService.getAllbyDestAndDept(destination,departure);
            ArrayList<CommenPlace> arrcp = (ArrayList<CommenPlace>) carpoolService.getAllPlace();
            carpoolmodel.addAttribute("places", arrcp);
            Integer i=(Integer)session.getAttribute("index");
            if(indexmove.equals("next")){
                if(i>=arrcpo.size()/5)i=arrcpo.size()/5-2;
                session.setAttribute("index",new Integer(++i));
            }else if(indexmove.equals("prev")){
                if(i<=0)i=1;
                session.setAttribute("index",new Integer(--i));
            }else if(indexmove.equals("head")){
                session.setAttribute("index",new Integer(0));
            }else if(indexmove.equals("tail")){
                session.setAttribute("index",new Integer(arrcpo.size()/5));
            }else{
                if(indexmove==null||indexmove.equals("")){
                    indexmove="1";
                }
                Integer tmp=Integer.parseInt(indexmove);
                if(tmp==null){
                    session.setAttribute("index",new Integer(0));
                }else{
                    session.setAttribute("index",tmp-1);
                }
            }//This Line Never Reach
            int cnt=0;
            ArrayList<CarpoolOrder> tobeshown=new ArrayList<CarpoolOrder>();
            Iterator<CarpoolOrder> iter=arrcpo.iterator();
            while(iter.hasNext()){  ///Magic : 5 for 5 items per page
                if(cnt>=i*5&&cnt<(i+1)*5){
                    tobeshown.add(iter.next());
                }else{
                    iter.next();
                }
                cnt++;
            }
            carpoolmodel.addAttribute("orders",tobeshown);
            return "/Carpool/carpoolHome";
        }
    }*/

    @RequestMapping("/detail")
    public String getDetail(String orderId,Model orderInfo){
        CarpoolOrder o=carpoolService.getDetailbyId(orderId);
        orderInfo.addAttribute("orderinfo",o);
        return "/Carpool/carpoolDetail";
    }

    @RequestMapping("/cancel")
    public String cancenDetail(String oid,String ownerId,HttpSession session,Model model){
        Scanner scor=new Scanner(oid);
        scor.useDelimiter(":");
        String p1=scor.next();
        String p2=scor.next().trim();
        Scanner scow=new Scanner(ownerId);
        scow.useDelimiter(":");
        String q1=scow.next();
        String q2=scow.next();
        if(((User)session.getAttribute("userSession")).getUserId().equals(q2)) {
            carpoolService.cancelOrderbyId(p2);
            model.addAttribute("givenMessage","Your Request Successfully Cancelled");
            return "/Carpool/carpoolNotification";
        }else{
            model.addAttribute("givenMessage","Your Request Failed : Permission Denied!");
            return "/Carpool/carpoolNotification";
        }
    }

    @RequestMapping("/new")
    public String createNew(HttpSession session,String cartype,String Cdestination,String Cdeparture,String requirement,String Cnumber,String Cdate,String Chour,String Cminute,Model model){
        ArrayList<CommenPlace> arrcp = (ArrayList<CommenPlace>) carpoolService.getAllPlace();
        model.addAttribute("places", arrcp);
        model.addAttribute("givenMessage","Successfully Commit Your Request!");
        User user=(User)session.getAttribute("userSession");
        CarpoolOrder co=new CarpoolOrder();
        co.setCarpoolCarType(cartype);
        co.setCarpoolDestination(Cdestination);
        co.setCarpoolOriginPlace(Cdeparture);
        co.setCarpoolSubscriber(user.getUserId());
        co.setCarpoolSpecialRequirement(requirement);
        co.setCarpoolNumberOfStudent(Integer.parseInt(Cnumber));
        Scanner sc=new Scanner(Cdate);
        sc.useDelimiter("/");
        int imonth=Integer.parseInt(sc.next().trim());
        int iday=Integer.parseInt(sc.next().trim());
        int iyear=Integer.parseInt(sc.next().trim());
        Date d=new Date(iyear-1900, imonth, iday, Integer.parseInt(Chour), Integer.parseInt(Cminute));
        co.setCarpoolDepartureTime(d);
        co.setCarpoolId(user.getUserId()+new java.util.Date().getTime());
        carpoolService.commit(co);
        return "/Carpool/carpoolNotification";
    }

}
