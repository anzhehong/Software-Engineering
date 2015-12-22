package com.camplus.entity;

/**
 * @author Caihanyuan
 * @time 2012-8-30 下午11:10:27
 */
public class MailMessage {
    // 发件人
    private String from;
    // 收件人
    private String to;
    // 发件人，在邮件中显示
    private String datafrom;
    // 收件人，在邮件中显示
    private String datato;
    // 主题
    private String subject;
    // 内容
    private String content;
    // 日期
    private String date;
    // 发送邮箱用户名,邮箱名的前缀
    private String user;
    // 发送邮箱密码
    private String password;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getDatafrom() {
        return datafrom;
    }

    public void setDatafrom(String datafrom) {
        this.datafrom = datafrom;
    }

    public String getDatato() {
        return datato;
    }

    public void setDatato(String datato) {
        this.datato = datato;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}