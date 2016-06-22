package com.camplus.controller;

import com.camplus.entity.JavaMD5Util;
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

/**
 * 这里要注意的是Autowire这个annotation，它是为了告诉spring，这个对象没有实例化，需要注入一个UserService的实例.
 */
@Autowired
private UserService userService;

    /**
     * 登录.
     * @param userId 用户ID
     * @param userPassword 用户密码
     * @param user 用户实体
     * @param session HTTPSession
     * @return 返回登录结果
     */
    @RequestMapping("index")
    public final String home(final String userId, final String userPassword,
                             final Model user, final HttpSession session) {
        int flag = userService.checkIdentity(userId,
                JavaMD5Util.MD5(userPassword));
        System.out.println(flag);
        if (flag == Constant.InvalidUserIdFlag) {
            user.addAttribute("message", Constant.checkInvalidUserIdMsg);
            return "loginFail";
        } else if (flag == Constant.InvalidPasswordFlag) {
            user.addAttribute("message", Constant.checkInvalidPasswordMsg);
            return "loginFail";
        } else if (flag == Constant.NullInfoMsgFlag) {
            user.addAttribute("message", Constant.checkNullInfoMsg);
            return "loginFail";
        } else {
            user.addAttribute("message", Constant.checkSuccessfullyMsg);
            String userName = userService.getById(userId).getUserName();
            user.addAttribute("userName", userName);
            session.setAttribute("userSession", userService.getById(userId));
            return "index";
        }
    }

    /**
     * 检查用户是否存在.
     * @param userId 用户ID
     * @return 是否存在的布尔值
     */
    @RequestMapping("/checkUserIdExist")
    @ResponseBody
    public final boolean check(final String userId) {
        /**
         * FIX: 真的没必要嘛?
         */
//        if (userService.getById(userId) != null) {
//            return false;
//        } else {
//            return true;
//        }
        return false;
    }

    /**
     * 返回所有用户姓名.
     * @return 集合
     */
    @RequestMapping("/json")
    @ResponseBody
    public final List<User> json() {
        return userService.getAllUserNames();
    }

    /**
     * 返回登录界面.
     * @return 登录界面
     */
    @RequestMapping("/login")
    public final String login() {
        return "login";
    }

    /**
     * 注销.
     * @param session HTTPSession
     * @return 登录界面
     */
    @RequestMapping("/logout")
    public final String logout(final HttpSession session) {
        session.invalidate();
        return "login";
    }

    /**
     * 注册.
     * @return 注册界面.
     */
    @RequestMapping("/register")
    public final String register() {
        return "register";
    }

    /**
     * 注册结果.
     * @param userName 用户名
     * @param userId 用户ID
     * @param userPassword 用户密码
     * @param userRegister 传入下一页面的Model
     * @return 登录界面
     */
    @RequestMapping("/registerReturn")
    public final String registerReturn(final String userName,
                                       final String userId,
                                       final String userPassword,
                                       final Model userRegister) {
        User user = new User();
        user.setUserName(userName);
        user.setUserPassword(JavaMD5Util.MD5(userPassword));
        user.setUserId(userId);
        user.setUserExperience(0);
        user.setUserLevel(1);
        userRegister.addAttribute("userName", userName);
        userRegister.addAttribute("userId", userId);
        userService.userRegister(user);

        return "login";
    }

    /**
     * 返回课程搜索界面.
     * @return 课程搜索界面
     */
    @RequestMapping("/course")
    public final String course() {
        return "CourseDiscussion/courseSearch";
    }

    /**
     * 返回拼车界面.
     * @return 拼车界面
     */
    @RequestMapping("/carpool")
    public final String carpool() {
        return "Carpool/carpoolHome";
    }

//     @RequestMapping("/gallery")
//    public String gallery(){
//        return "Gallery/galleryHome";
//    }

    /**
     * 默认信息界面.
     * @return 点餐界面
     */
    @RequestMapping("/information")
    public final String information() {
//        return "Information/informationHome";
        return "Information/restaurantHome";
    }

    /**
     * 发送邮件.
     * @param messageToSend 内容
     * @param session HTTPSession
     * @return 主界面
     * @throws UnsupportedEncodingException 不支持编码的异常
     */
    @RequestMapping("/sendMail")
    public final String sendMail(final String messageToSend,
                                 final HttpSession session)
            throws UnsupportedEncodingException {
        System.out.println(messageToSend);
        MailMessage message = new MailMessage();
        message.setTo("anzhehong@126.com");
        message.setFrom("anzhehong@126.com");
        User user = (User) session.getAttribute("userSession");
        String userName = userService.getById(user.getUserId()).getUserName();

        String subject = "Camplus用户'" + userName + "'的来信";
        message.setSubject(subject);
        message.setUser("anzhehong");
        String s = new String(messageToSend.getBytes(), "utf-8");
        message.setContent(messageToSend);
        message.setDatato("anzhehong@126.com");
        message.setDatafrom("anzhehong@qq.com");
        message.setPassword("AzhSr19940402");


        SendMail send = SendMailImp.
                getInstance(SendMailImp.WANGYI126).setMessage(message);
        try {
            send.sendMail();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            return "index";
        }
    }

}
