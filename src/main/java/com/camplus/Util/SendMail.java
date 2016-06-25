package com.camplus.Util;

import java.io.IOException;

/**
 * @author Caihanyuan
 * @time 2012-8-31 上午10:27:22
 */
public interface SendMail {

    /**
     * 向服务器发送命令
     *
     * @param order
     *            向服务器发送的命令行
     * @return 返回服务器状态
     * */
    public int sendToServer(String order);

    /**
     * 解析服务器返回的应答信息
     *
     * @return 返回服务器状态
     * */
    public int getResult();

    /** 与服务器发起会话 */
    public void regist() throws IOException;

    /** 登录到服务器 */
    public void login() throws IOException;

    /** 设置邮件源地址 */
    public void setMailFrom() throws IOException;

    /** 设置邮件目的地址 */
    public void setMailTo() throws IOException;

    /** 设置邮件内容 */
    public void setData() throws IOException;

    /** 退出邮箱服务 */
    public void quit() throws IOException;

    /** 发送邮件的主程序 */
    public boolean sendMail() throws IOException;

}