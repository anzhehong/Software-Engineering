package com.camplus.controller;

import com.camplus.entity.MailMessage;
import sun.misc.BASE64Encoder;

import java.io.*;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.StringTokenizer;

/**
 * @author Caihanyuan
 * @time 2012-8-31 上午11:05:20
 */
public class SendMailImp implements SendMail {
    public static final int SINA = 0;
    public static final int QQ = 1;
    public static final int FOXMAIL = 2;
    public static final int WANGYI163 = 3;
    public static final int WANGYI126 = 8;
    public static final int YEAH = 4;
    public static final int HOTMAIL = 5;
    public static final int YAHOO = 6;
    public static final int GMAIL = 7;

    /** 用于向服务器发起连接 */
    private Socket socket = null;
    /** 与服务器连接后的输入流 */
    private BufferedReader input = null;
    /** 与服务器连接后的输出流 */
    private BufferedWriter output = null;
    /** 发送邮件服务器名称 */
    private String server = null;
    /** 发送端口号 */
    private int port;
    /** 邮件信息 */
    private MailMessage message;

    public MailMessage getMessage() {
        return message;
    }

    //设置邮件的信息内容，以方法链的方式实现
    public SendMailImp setMessage(MailMessage message) {
        this.message = message;
        return this;
    }

    public Socket getSocket() {
        return socket;
    }

    public void setSocket(Socket socket) {
        this.socket = socket;
    }

    public BufferedReader getInput() {
        return input;
    }

    public void setInput(BufferedReader input) {
        this.input = input;
    }

    public BufferedWriter getOutput() {
        return output;
    }

    public void setOutput(BufferedWriter output) {
        this.output = output;
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    /**
     * 根据邮箱类型，设置发送邮件服务器和端口号
     */
    public static SendMailImp getInstance(int sendMailType) {
        SendMailImp sendMailImp = new SendMailImp();
        switch (sendMailType) {
            case SINA:
                sendMailImp.setServer("smtp.sina.com");
                sendMailImp.setPort(25);
                break;
            case QQ:
                sendMailImp.setServer("smtp.qq.com");
                sendMailImp.setPort(25);
                break;
            case FOXMAIL:
                sendMailImp.setServer("smtp.qq.com");
                sendMailImp.setPort(25);
                break;
            case WANGYI126:
                sendMailImp.setServer("smtp.126.com");
                sendMailImp.setPort(25);
                break;
            case WANGYI163:
                sendMailImp.setServer("smtp.163.com");
                sendMailImp.setPort(25);
                break;
            case YEAH:
                sendMailImp.setServer("smtp.yeah.net");
                sendMailImp.setPort(25);
                break;
            case YAHOO:
                sendMailImp.setServer("smtp.mail.yahoo.com");
                sendMailImp.setPort(465);
                break;
            case GMAIL:
                sendMailImp.setServer("smtp.gmail.com");
                sendMailImp.setPort(465);
                break;
            case HOTMAIL:
                sendMailImp.setServer("smtp.live.com");
                sendMailImp.setPort(25);
                break;
            default:
                break;
        }

        try {
            // 与发送邮件服务器建立Socket连接,并得到输入输出流
            Socket socket = new Socket(sendMailImp.getServer(), sendMailImp
                    .getPort());
            BufferedReader input = new BufferedReader(new InputStreamReader(
                    socket.getInputStream()));
            BufferedWriter output = new BufferedWriter(new OutputStreamWriter(
                    socket.getOutputStream()));

            sendMailImp.setSocket(socket);
            sendMailImp.setInput(input);
            sendMailImp.setOutput(output);
            System.out.println("Socket set up!!!");
        }
        catch (UnknownHostException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        return sendMailImp;
    }

    public int sendToServer(String order) {
        try {
            this.getOutput().write(order);
            this.getOutput().newLine();
            this.getOutput().flush();

            System.out.println("已发送命令:" + order);
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        return getResult();
    }

    public int getResult() {
        String line = "";
        try {
            line = this.getInput().readLine();
            System.out.println("服务器返回状态：" + line);
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        // 从服务器返回消息中取得状态码,并转换成整数返回
        StringTokenizer get = new StringTokenizer(line, " ");
        return Integer.parseInt(get.nextToken());
    }

    public void regist() throws IOException {
        int result = getResult();
        // 连接上服务器后，服务器给出220应答
        if (result != 220)
            throw new IOException("连接服务器失败");

        result = sendToServer("HELO " + this.getServer());
        // HELO命令成功后，服务器返回250应答
        if (result != 250)
            throw new IOException("注册邮件服务器失败");
    }

    public void login() throws IOException {
        BASE64Encoder encode = new BASE64Encoder();

        int result = sendToServer("AUTH LOGIN");
        // 登陆服务成功，服务器返回334应答
        if (result != 334)
            throw new IOException("登陆服务失败");

        // 对邮箱用户名进行验证
        result = sendToServer(encode.encode(this.message.getUser().getBytes()));
        if (result != 334)
            throw new IOException("用户名错误");

        // 对邮箱密码进行验证
        result = sendToServer(encode.encode(message.getPassword().getBytes()));
        if (result != 235)
            throw new IOException("用户验证错误");
    }

    public void setMailFrom() throws IOException {
        int result = sendToServer("MAIL FROM:<" + this.getMessage().getFrom()
                + ">");
        if (result != 250)
            throw new IOException("邮件源地址错误");
    }

    public void setMailTo() throws IOException {
        int result = sendToServer("RCPT TO:<" + this.getMessage().getTo() + ">");
        if (result != 250)
            throw new IOException("邮件目的地址错误");
    }

    public void setData() throws IOException {
        int result = sendToServer("DATA");
        // 输入date回车后,若收到354应答后,继续输入邮件内容
        if (result != 354)
            throw new IOException("不能发送数据");

        this.getOutput().write("FROM:" + this.getMessage().getDatafrom());
        this.getOutput().newLine();
        this.getOutput().write("TO:" + this.getMessage().getDatato());
        this.getOutput().newLine();
        System.out.println(this.getMessage().getSubject());
        this.getOutput().write("SUBJECT:" + this.getMessage().getSubject());
        this.getOutput().newLine();
        this.getOutput().newLine();
        this.getOutput().write(this.getMessage().getContent());
        this.getOutput().newLine();

        // 句点加回车结束邮件内容输入
        result = sendToServer(".");
        if (result != 250)
            throw new IOException("发送数据错误");
    }

    public void quit() throws IOException {
        int result = sendToServer("QUIT");
        if (result != 221)
            throw new IOException("未能正确退出");

        this.getInput().close();
        this.getOutput().close();
    }

    public boolean sendMail() {
        boolean success = true;
        try {
            // 注册到发送邮件服务器
            regist();
            // 登陆到服务器
            login();
            // 设置邮件源地址
            setMailFrom();
            // 设置邮件目的地址
            setMailTo();
            // 设置邮件体
            setData();
            // 退出邮件
            quit();
        }
        catch (Exception e) {
            e.printStackTrace();
            success = false;
        }
        return success;
    }
}