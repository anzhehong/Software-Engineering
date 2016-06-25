package com.camplus;

import com.camplus.Util.SendMail;
import com.camplus.Util.SendMailImp;
import com.camplus.entity.MailMessage;

import java.io.IOException;

/**
 * @author Caihanyuan
 * @time 2012-8-31 下午02:45:23
 */
public class Test {
    public static void main(String[] args) {
        MailMessage message = new MailMessage();
        message.setTo("anzhehong@126.com");
        message.setFrom("anzhehong@126.com");
        message.setSubject("这个是一个邮件发送测试");
        message.setUser("anzhehong");
        message.setContent("Hello,this is a mail send test\n你好这是一个邮件发送测试");
        message.setDatato("anzhehong@126.com");
        message.setDatafrom("anzhehong@qq.com");
        message.setPassword("661518");

        SendMail send = SendMailImp.getInstance(SendMailImp.WANGYI126).setMessage(message);
        try {
            send.sendMail();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }
}