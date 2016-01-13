package com.camplus.controller;

import com.camplus.entity.MailMessage;
import com.camplus.entity.User;
import com.camplus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by fowafolo on 15/5/11.
 */


@Controller
@RequestMapping("/")
public class MainController {

//    这里要注意的是Autowire这个annotation，它是为了告诉spring，这个对象没有实例化，需要注入一个UserService的实例
@Autowired
private UserService userService;

    @RequestMapping("index")
    public String home(String userId,String userPassword,Model user,HttpSession session){
        int flag = userService.checkIdentity(userId,userPassword);
        System.out.println(flag);
        if (flag==0){
            user.addAttribute("message","用户名不存在！");
            return "loginFail";
        }else if (flag==1){
            user.addAttribute("message","密码错误");
            return "loginFail";
        }else {
            user.addAttribute("message","登录成功！");
            String userName = userService.getById(userId).getUserName();
            user.addAttribute("userName",userName);

            session.setAttribute("userSession",userService.getById(userId));
            return "index";
        }
    }
    @RequestMapping("/checkUserIdExist")
    @ResponseBody
    public boolean check(String userId){
        User user = userService.getById(userId);
        if(user != null){
            return false;
        }else{
            return true;
        }
    }



    @RequestMapping("/json")
    @ResponseBody
    public List<User> json(){
        return userService.getAllUserNames();
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "login";
    }

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/registerReturn")
    public String registerReturn(String userName,String userId,String userPassword,Model userRegister){
        User user = new User();
        user.setUserName(userName);
        user.setUserPassword(userPassword);
        user.setUserId(userId);
        user.setUserExperience(0);
        user.setUserLevel(1);
        userRegister.addAttribute("userName",userName);
        userRegister.addAttribute("userId",userId);
        userService.userRegister(user);

        return "login";
    }

    @RequestMapping("/course")
    public String course(){
        return "CourseDiscussion/courseSearch";
    }

    @RequestMapping("/carpool")
    public String carpool(){
        return "Carpool/carpoolHome";
    }

//     @RequestMapping("/gallery")
//    public String gallery(){
//        return "Gallery/galleryHome";
//    }

    @RequestMapping("/information")
    public String information(){
//        return "Information/informationHome";
        return "Information/restaurantHome";
    }

    @RequestMapping("/sendMail")
    public String sendMail(String messageToSend) throws UnsupportedEncodingException {
        MailMessage message = new MailMessage();
        message.setTo("anzhehong@126.com");
        message.setFrom("anzhehong@126.com");
        String subject = "Camplus用户来信";
        message.setSubject(subject);
        message.setUser("anzhehong");
        String s = new String(messageToSend.getBytes("GBK"), "ISO8859-1");
        message.setContent(messageToSend);
        message.setDatato("anzhehong@126.com");
        message.setDatafrom("anzhehong@qq.com");
        message.setPassword("AzhSr19940402");

        System.out.println(s);
        System.out.println(messageToSend);


        SendMail send = SendMailImp.getInstance(SendMailImp.WANGYI126).setMessage(message);
        try {
            send.sendMail();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            return "index";
        }
    }

}
