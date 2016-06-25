package com.camplus.Util;

/**
 * Created by fowafolo
 * Date: 16/6/8
 * Time: 15:14
 */
public class Constant {

    static public String checkSuccessfullyMsg="登录成功";
    static public String checkInvalidUserIdMsg="用户ID不存在";
    static public String checkInvalidPasswordMsg="密码不正确";
    static public String checkNullInfoMsg="信息不能为空";

    static public String editInfoFormHint="请完成下列表格";
    static public String editInfoContactHint="请重新输入你的联系方式";
    static public String editInfoPasswordHint="请输入你的新密码";
    static public String editInfoRePasswordHint="请确认你的新密码";
    static public String editInfoPasswordNotSameHint="您两次输入的密码不一致，请重新确认";
    static public String editInfoPasswordNotLongEnoughHint="密码需要在6-12位之间";
    static public String editInfoSuccessfullyHint="修改成功";

    /**
     * MainController
     */
    static public int InvalidUserIdFlag = 0;
    static public int InvalidPasswordFlag = 1;
    static public int NullInfoMsgFlag = 4;

}
