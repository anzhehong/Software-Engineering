package com.camplus.controller;

import com.camplus.entity.User;
import com.camplus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by fowafolo on 15/5/12.
 */


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

//    @RequestMapping("/login")
//    public String login(String userId,String userPassword,Model user,HttpSession session){
//        int flag = userService.checkIdentity(userId,userPassword);
//        if (flag==0){
//            user.addAttribute("message","用户名不存在！");
//            return "loginFail";
//        }else if (flag==1){
//            user.addAttribute("message","密码错误");
//            return "loginFail";
//        }else {
//            user.addAttribute("message","登录成功！");
//            String userName = userService.getById(userId).getUserName();
//            user.addAttribute("userName",userName);
//            session.setAttribute("userSession",userService.getById(userId));
//            return "index";
//        }
//    }


    @RequestMapping("/checkUserPassword")
    @ResponseBody
    public boolean checkUserPassword(String userId, String userPassword) {
        User user = userService.getById(userId);
        System.out.println(user);
        if (user.getUserPassword().equals(userPassword)) {
            return true;
        } else {
            return false;
        }
    }


    //    @RequestMapping("/register")
//    public String register(String userName,String userId,String userPassword,Model userRegister){
//        User user = new User();
//        user.setUserName(userName);
//        user.setUserPassword(userPassword);
//        user.setUserId(userId);
//        user.setUserExperience(0);
//        user.setUserLevel(1);
//        userRegister.addAttribute("userName",userName);
//        userRegister.addAttribute("userId",userId);
//        userService.userRegister(user);
//
//        return "login";
//    }
    @RequestMapping("/checkUserIdExist")
    @ResponseBody
    public boolean check(String userId) {
        User user = userService.getById(userId);
        if (user != null) {
            return true;
        } else {
            return false;
        }
    }

    @RequestMapping("/editInfo")
    public String editInfo(HttpSession session, Model model, String uid, String uname, String contact, String password, String repassword, String avatar) {
        User user = (User) session.getAttribute("userSession");
        model.addAttribute("studentnum", user.getUserId());

//
//
        if (uname == null) {
            model.addAttribute("givenMessage", "请完成下列表格！");
            return "selfInfo";
        } else if (contact == null) {
            model.addAttribute("givenMessage", "请重新输入你的联系方式！");
            return "selfInfo";
        } else if (password == null) {
            model.addAttribute("givenMessage", "请输入你的新密码！");
            return "selfInfo";
        } else if (repassword == null) {
            model.addAttribute("givenMessage", "请确认你的新密码！");
            return "selfInfo";
        } else if (!password.equals(repassword)) {
            model.addAttribute("givenMessage", "您两次输入的密码不一致，请重新确认！");
            return "selfInfo";
        } else {
            User nuser = new User();
            nuser.setUserId(uid);
            nuser.setUserName(uname);
            nuser.setUserPassword(password);
            nuser.setUserExperience(0);
            nuser.setUserLevel(0);
//            String avatorStr = String.valueOf(avatar);
            String avatorStr = avatar;
            nuser.setUserAvator(avatorStr);
            userService.updateUser(nuser);
            return "index";
        }


    }

    @RequestMapping("/editInfoChanged")
    public String editInfoChanged(HttpSession session, Model model, String uid, String uname, String contact, String password, String repassword, String avatar) {
        User user = (User) session.getAttribute("userSession");
        model.addAttribute("studentnum", user.getUserId());


        User tempUser = userService.getById(user.getUserId());
        if (uid != null && uid != "") {
            tempUser.setUserId(uid);
        }else tempUser.setUserId(user.getUserId());
        if (uname != null && uname != "")
        {
            tempUser.setUserName(uname);
        }else tempUser.setUserName(user.getUserName());
        if (password != null && password != "")
        {
            tempUser.setUserPassword(password);
        }else tempUser.setUserPassword(user.getUserPassword());
        if (avatar != null && avatar != "")
        {
            tempUser.setUserAvator(avatar);
        }else tempUser.setUserAvator(user.getUserAvator());
        if (contact != null && contact != "")
        {
            tempUser.setUserMobile(contact);
        }else tempUser.setUserMobile(user.getUserMobile());
        userService.updateUser(tempUser);
        return "index";
    }
}