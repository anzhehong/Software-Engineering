package com.camplus.Tests.IntegrationTest;

import com.camplus.entity.CarpoolOrder;
import com.camplus.entity.CommenPlace;
import com.camplus.service.CarpoolService;
import com.camplus.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by fowafolo
 * Date: 16/6/19
 * Time: 08:59
 */

@RunWith(SpringJUnit4ClassRunner.class) // 整合
@ContextConfiguration(locations = {"/WEB-INF/applicationContext.xml"})
public class CarpoolControllerTest {

    @Autowired
    CarpoolService carpoolService;
    @Autowired
    UserService userService;


    @Test
    public void selectMenu() throws Exception {
        String departure = null;
        String destination = null;
        String indexmove = "";
        String hour = "";
        String minute = "";
        String datepicker = "";
        String number = "";

        /**
         * IT_TC_001_001_001
         * 出发或到达地点未选择，即为默认值时，显示从四平路校区到嘉定校区的拼车订单信息。
         */
//        //1
////        hour="13";
////        minute="00";
//        datepicker=null;
//        number="1";
//        handleSelectMenu(departure,destination,hour,minute,datepicker,number);
//
//        //2
        departure="虹桥火车站";
        hour="13";
        minute="00";
        datepicker=null;
        number="1";
        handleSelectMenu(departure,destination,hour,minute,datepicker,number);
//
//        //3
        departure=null;
        destination="虹桥火车站";
        hour="13";
        minute="00";
//        datepicker="2015-10-01 02:10:00";
        datepicker=null;
        number="1";
        handleSelectMenu(departure,destination,hour,minute,datepicker,number);
//
//        /**
//         * IT_TC_001_001_002
//         * 出发时间未选择，即为默认值时，显示符合另外要求的所有时间的拼车订单信息。
//         */
//        //1
//        departure="四平路校区";
//        destination="虹桥火车站";
//        hour="";
//        minute="";
//        datepicker="2016-06-20 21:00:00";
//        number="1";
//        handleSelectMenu(departure,destination,hour,minute,datepicker,number);

        /**
         * IT_TC_001_001_003
         * 出发人数未选择，即为默认值时，显示符合另外要求的一人的拼车订单信息。
         */
        //1
//        departure="四平路校区";
//        destination="虹桥火车站";
//        hour="13";
//        minute="00";
//        datepicker="2016-06-28 21:00:00";
//        number="1";
//        handleSelectMenu(departure,destination,hour,minute,datepicker,number);
    }

    private void handleSelectMenu(String departure, String destination,
                                  String hour, String minute,
                                  String datepicker, String number) {

        ArrayList<CommenPlace> cp=(ArrayList<CommenPlace>)carpoolService.getAllPlace();
        System.out.println(datepicker);

        PriorityQueue<CarpoolOrder> cop;
        boolean bContainer;
        if(departure==null&&destination==null){
            cop=carpoolService.getAllOrder();
            System.out.println("----------------Test-------------------");
            System.out.println("未设置出发地和目的地,默认为四平校区到嘉定校区");
            System.out.println(cop.size());
            System.out.println("---------------------------------------");
        }else{
            if (datepicker == null || datepicker.equals(""))
            {
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                String date = df.format(new Date());
                datepicker = date;
            }else {
                String[] strings = datepicker.split(" ");
                String[] hourminute = strings[1].split(":");
                String[] yearmonthday = strings[0].split("-");
                hour = hourminute[0];
                minute = hourminute[1];
            }
            cop=carpoolService.getAllbyAll(destination,departure,datepicker,hour,minute,number);
            System.out.println("----------------Test-------------------");
            System.out.println(cop.size());
            System.out.println("---------------------------------------");
        }
    }

    @Test
    public void getDetail() throws Exception {
        /**
         * IT_TC_001_003_001
         * 根据某拼车信息的ID号可以查看其详细信息。
         */
        String orderId="13529581435078598379";
        String ownerId="1352834";

        handleGetDetail(orderId, ownerId);
    }

    private void handleGetDetail(String orderId,String ownerId){
        CarpoolOrder order=carpoolService.getDetailbyId(orderId);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("orderinfo",order);
        boolean cancelButton = false;
        String userId = "1352834";
        if (order.getCarpoolSubscriber().equals(userId))
            cancelButton = true;
        String phoneNum = userService.getById(ownerId).getUserMobile();
        result.put("cancelButton",cancelButton);
        result.put("phoneNum",phoneNum);

        System.out.println("----------------Test-------------------");
        System.out.println(result);
        System.out.println("---------------------------------------");
    }

    @Test()
    public void createNew() throws Exception {
        String cartype="";
        String Cdestination="";
        String Cdeparture="";
        String requirement="";
        String Cnumber="";
        String Cdate="";

        /**
         * IT_TC_001_002_001
         * 除备注信息外，任意参数为空时，无法成功创建拼车订单
         */
        //1
        cartype="";
        Cdeparture="嘉定校区";
        Cdestination="四平路校区";
        requirement="不要男生";
        Cdate="2016-06-28 13:00:00";
        Cnumber="1";
        handleCreateNew(cartype,Cdestination,Cdeparture,requirement,Cnumber,Cdate);

        //2
        cartype="大众";
        Cdeparture="";
        Cdestination="四平路校区";
        requirement="不要男生";
        Cdate="2016-06-28 13:00:00";
        Cnumber="1";
        handleCreateNew(cartype,Cdestination,Cdeparture,requirement,Cnumber,Cdate);

        //3
        cartype="大众";
        Cdeparture="嘉定校区";
        Cdestination="";
        requirement="不要男生";
        Cdate="2016-06-28 13:00:00";
        Cnumber="1";
        handleCreateNew(cartype,Cdestination,Cdeparture,requirement,Cnumber,Cdate);

        //3
        cartype="大众";
        Cdeparture="嘉定校区";
        Cdestination="";
        requirement="不要男生";
        Cdate="2016-06-28 13:00:00";
        Cnumber="1";
        handleCreateNew(cartype,Cdestination,Cdeparture,requirement,Cnumber,Cdate);

        //4
        cartype="大众";
        Cdeparture="嘉定校区";
        Cdestination="四平路校区";
        requirement="不要男生";
        Cdate="2016-06-28 13:00:00";
        Cnumber="1";
        handleCreateNew(cartype,Cdestination,Cdeparture,requirement,Cnumber,Cdate);

        //5
        cartype="大众";
        Cdeparture="嘉定校区";
        Cdestination="四平路校区";
        requirement="不要男生";
        Cdate="";
        Cnumber="1";
        handleCreateNew(cartype,Cdestination,Cdeparture,requirement,Cnumber,Cdate);

        /**
         * IT_TC_001_002_002
         * 参数符合要求时，成功创建新的拼车信息
         */
        //1
        cartype="大众";
        Cdeparture="嘉定校区";
        Cdestination="四平路校区";
        requirement="不要男生";
        Cdate="2016-06-28 13:00:00";
        Cnumber="1";
        handleCreateNew(cartype,Cdestination,Cdeparture,requirement,Cnumber,Cdate);
    }

    private void handleCreateNew(String cartype, String Cdestination, String Cdeparture,
                                 String requirement, String Cnumber, String Cdate) {
        ArrayList<CommenPlace> arrcp = (ArrayList<CommenPlace>) carpoolService.getAllPlace();

        CarpoolOrder co=new CarpoolOrder();
        co.setCarpoolCarType(cartype);
        co.setCarpoolDestination(Cdestination);
        co.setCarpoolOriginPlace(Cdeparture);
        co.setCarpoolSubscriber("1352834");
        co.setCarpoolSpecialRequirement(requirement);
        co.setCarpoolNumberOfStudent(Integer.parseInt(Cnumber));

        int imonth=0, iday=0, iyear=0, ihour=0, iminute = 0;

        if (Cdate.equals("") || Cdate.equals(null))
        {
            //TODO: 默认一天 以后
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            String date = df.format(new Date());
            Cdate = date;
            String[] strings = Cdate.split(" ");
            String[] hourminute = strings[1].split(":");
            String[] yearmonthday = strings[0].split("-");
            iyear = Integer.parseInt(yearmonthday[0])-1900;
            imonth = Integer.parseInt(yearmonthday[1]);
            iday = Integer.parseInt(yearmonthday[2])+1;
            ihour = Integer.parseInt(hourminute[0]);
            iminute = Integer.parseInt(hourminute[1]);
        }else {
            String[] strings = Cdate.split(" ");
            String[] hourminute = strings[1].split(":");
            String[] yearmonthday = strings[0].split("-");
            iyear = Integer.parseInt(yearmonthday[0])-1900;
            imonth = Integer.parseInt(yearmonthday[1]);
            iday = Integer.parseInt(yearmonthday[2]);
            ihour = Integer.parseInt(hourminute[0]);
            iminute = Integer.parseInt(hourminute[1]);
        }


//        Date d=new Date(iyear-1900, imonth, iday, Integer.parseInt(Chour), Integer.parseInt(Cminute));
        Date d=new Date(iyear,imonth,iday,ihour,iminute);
        co.setCarpoolDepartureTime(d);
        co.setCarpoolId("1352834"+new java.util.Date().getTime());
        System.out.println("----------------Test-------------------");
        carpoolService.commit(co);
        System.out.println("successfully create");
        System.out.println("---------------------------------------");
    }

}