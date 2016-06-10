package com.camplus.Tests.UnitTest;

import com.camplus.controller.Constant;
import com.camplus.controller.SendMail;
import com.camplus.controller.SendMailImp;
import com.camplus.entity.JavaMD5Util;
import com.camplus.entity.MailMessage;
import com.camplus.service.UserService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertEquals;

/**
 * Created by fowafolo
 * Date: 16/6/8
 * Time: 14:41
 */

@RunWith(SpringJUnit4ClassRunner.class) // 整合
@ContextConfiguration(locations = {"/WEB-INF/applicationContext.xml"})
public class MainControllerTest {

    @Autowired
    private UserService userService;

    @Before
    public void setUp() throws Exception {

    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void home() throws Exception {
        String resultMsg = "";

        /**
         * 用户名密码正确
         */
        String userId = "1352834";
        String userPassword = "123";
        int flag = userService.checkIdentity(userId, JavaMD5Util.MD5(userPassword));
        resultMsg = homePrepare(flag, userId);
        assertEquals(Constant.checkSuccessfullyMsg, resultMsg);

        /**
         * 用户名不存在
         */
        String userId2 = "13528342222";
        String userPassword2 = "123";
        flag = userService.checkIdentity(userId2, JavaMD5Util.MD5(userPassword2));
        resultMsg = homePrepare(flag, userId2);
        assertEquals(Constant.checkInvalidUserIdMsg, resultMsg);

        /**
         * 用户名存在但是密码不正确
         */
        String userId3 = "1352834";
        String userPassword3 = "1234444444";
        flag = userService.checkIdentity(userId3, JavaMD5Util.MD5(userPassword3));
        resultMsg = homePrepare(flag, userId3);
        assertEquals(Constant.checkInvalidPasswordMsg, resultMsg);

        /**
         * 用户名或者密码为空
         */
        String userId4 = null;
        String userPassword4 = null;
        flag = userService.checkIdentity(userId4, JavaMD5Util.MD5(userPassword3));
        resultMsg = homePrepare(flag, userId4);
        assertEquals(Constant.checkNullInfoMsg, resultMsg);

        flag = userService.checkIdentity(userId3, JavaMD5Util.MD5(userPassword4));
        resultMsg = homePrepare(flag, userId3);
        assertEquals(Constant.checkNullInfoMsg, resultMsg);

        flag = userService.checkIdentity(userId4, JavaMD5Util.MD5(userPassword4));
        resultMsg = homePrepare(flag, userId4);
        assertEquals(Constant.checkNullInfoMsg, resultMsg);
    }

    private String homePrepare(int flag, String userId) {
        String resultMsg = "";
        if (flag==0){
            resultMsg = Constant.checkInvalidUserIdMsg;
        }else if (flag==1){
            resultMsg = Constant.checkInvalidPasswordMsg;
        }else {
            resultMsg = Constant.checkSuccessfullyMsg;
        }
        return resultMsg;
    }

    @Test
    public void check() throws Exception {
        /**
         * 用户名密码正确
         */
        String userId = "1352834";
        String userPassword = "123";
        checkHandle(userId, userPassword, 2);

        /**
         * 用户名不存在
         */
        String userId2 = "13528342222";
        String userPassword2 = "123";
        checkHandle(userId2, userPassword2, 0);

        /**
         * 用户名存在但是密码不正确
         */
        String userId3 = "1352834";
        String userPassword3 = "1234444444";
        checkHandle(userId3, userPassword3, 1);

        /**
         * 用户名或者密码为空
         */
        String userId4 = null;
        String userPassword4 = null;
        checkHandle(userId4, userPassword3, 4);
        checkHandle(userId3, userPassword4, 4);
        checkHandle(userId4, userPassword4, 4);

    }

    private void checkHandle(String userId, String userPassword, int expectedValue) {

        int flag;
        if (userPassword!=null)
            flag = userService.checkIdentity(userId, JavaMD5Util.MD5(userPassword));
        else flag = 4;
        assertEquals(expectedValue, flag);
    }

    @Test
    public void register() throws Exception {

    }

    @Test
    public void getInstance() throws Exception {
        String messageToSend="Test Email Function";

        /**
         * 邮件类型为空不用测,因为int类型不传会报错
         */
        /**
         * 邮件类型不存在也不用测,因为编译器会报错
         */

        /**
         * 输入的邮件类型正确,能够正确打开Socket流
         */
        SendMail send = SendMailImp.getInstance(SendMailImp.WANGYI126).setMessage(getMailMessage(messageToSend));

    }

    @Test
    public void sendMail() throws Exception {
        String messageToSend="Test Email Function";

        MailMessage message = getMailMessage(messageToSend);
        SendMail send;

        /**
         * 未设置收件人,其它正确
         */

        message.setTo("");
        message.setDatato("");
        send=SendMailImp.getInstance(SendMailImp.WANGYI126).setMessage(message);
//        assert (send.sendMail());
        message = getMailMessage(messageToSend);

        /**
         * 未设置发件人,其它正确
         */
        message.setFrom("");
        message.setDatafrom("");
        send=SendMailImp.getInstance(SendMailImp.WANGYI126).setMessage(message);
//        assert (send.sendMail());
        message = getMailMessage(messageToSend);

        /**
         * 未设置内容,其它正确
         */
        message.setContent("");
        send=SendMailImp.getInstance(SendMailImp.WANGYI126).setMessage(message);
//        assert (send.sendMail());
        message = getMailMessage(messageToSend);

        /**
         * 未设置主题,其他正确
         */
        message.setSubject("");
        send=SendMailImp.getInstance(SendMailImp.WANGYI126).setMessage(message);
//        assert (send.sendMail());
        message = getMailMessage(messageToSend);

        /**
         * Message属性全部设置正确
         */
        send=SendMailImp.getInstance(SendMailImp.WANGYI126).setMessage(message);
//        send.sendMail();
        assert (send.sendMail());
    }

    private MailMessage getMailMessage(String messageToSend) {
        MailMessage message = new MailMessage();
        message.setTo("anzhehong@126.com");
        message.setFrom("anzhehong@126.com");

        String subject = "Camplus用户" +"的来信";
        message.setSubject(subject);
        message.setUser("anzhehong");
        message.setContent(messageToSend);
        message.setDatato("anzhehong@126.com");
        message.setDatafrom("anzhehong@qq.com");
        message.setPassword("AzhSr19940402");

        return message;
    }

}