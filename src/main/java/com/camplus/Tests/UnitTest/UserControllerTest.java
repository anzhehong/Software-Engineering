package com.camplus.Tests.UnitTest;

import com.camplus.Util.Validator;
import com.camplus.controller.Constant;
import com.camplus.entity.JavaMD5Util;
import com.camplus.entity.User;
import com.camplus.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertEquals;

/**
 * Created by fowafolo
 * Date: 16/6/8
 * Time: 15:54
 */
@RunWith(SpringJUnit4ClassRunner.class) // 整合
@ContextConfiguration(locations = {"/WEB-INF/applicationContext.xml"})
public class UserControllerTest {

    @Autowired
    private UserService userService;

    @Test
    public void editInfo() throws Exception {

        String uid=null;
        String uname=null;
        String contact=null;
        String password=null;
        String repassword=null;
        String avatar=null;

        String result="";

        /**
         * 输入的任意参数为空
         */
        result = editInfoHandleNull(uid,uname,contact,password,repassword,avatar);
        assertEquals(result, Constant.editInfoFormHint);

        uid="123";
        result = editInfoHandleNull(uid,uname,contact,password,repassword,avatar);
        assertEquals(result, Constant.editInfoFormHint);

        uname="122";
        result = editInfoHandleNull(uid,uname,contact,password,repassword,avatar);
        assertEquals(result, Constant.editInfoFormHint);

        password="123";
        result = editInfoHandleNull(uid,uname,contact,password,repassword,avatar);
        assertEquals(result, Constant.editInfoFormHint);

        repassword="123";
        result = editInfoHandleNull(uid,uname,contact,password,repassword,avatar);
        assertEquals(result, Constant.editInfoFormHint);

        avatar="123";
        result = editInfoHandleNull(uid,uname,contact,password,repassword,avatar);
        assertEquals(result, Constant.editInfoFormHint);

        /**
         * 各个参数合法
         */
        uid="1352834";
        uname="安哲";
        contact="13133333333";
        password="123123123";
        repassword="123123123";
        avatar="";
        result=editInfoHandleOK(uid,uname,contact,password,repassword,avatar);
        assertEquals(result, Constant.editInfoSuccessfullyHint);

        /**
         * 电话号码符合规定
         */
        assertEquals(true, editInfoCheckPhoneValid(contact));

        contact = "113fff";
        /**
         * 电话号码符合不规定
         */
        assertEquals(false, editInfoCheckPhoneValid(contact));

        /**
         * 输入的新密码长度不在6-12位之间
         */
        password="123";
        result = editInfoHandlePasswordNotLongEnough(password);
        assertEquals(result, Constant.editInfoSuccessfullyHint);
        password="123123123123123";
        result = editInfoHandlePasswordNotLongEnough(password);
        assertEquals(result, Constant.editInfoSuccessfullyHint);
        password="1231231";
        result = editInfoHandlePasswordNotLongEnough(password);
        assertEquals(result, Constant.editInfoSuccessfullyHint);

    }

    private String editInfoHandleOK(String uid, String uname, String contact, String password, String repassword, String avatar) {
        User nuser = new User();
        nuser.setUserId(uid);
        nuser.setUserName(uname);
        nuser.setUserPassword(JavaMD5Util.MD5(password));
        nuser.setUserExperience(0);
        nuser.setUserLevel(0);
//            String avatorStr = String.valueOf(avatar);
        String avatorStr = avatar;
        nuser.setUserAvator(avatorStr);
        userService.updateUser(nuser);
        return Constant.editInfoSuccessfullyHint;
    }

    private String editInfoHandleNull(String uid, String uname, String contact, String password, String repassword, String avatar) {
        String resultMsg = "";
        if (uname == null) {
            resultMsg=Constant.editInfoFormHint;
            return resultMsg;
        } else if (contact == null) {
            resultMsg=Constant.editInfoFormHint;
            return resultMsg;
        } else if (password == null) {
            resultMsg=Constant.editInfoFormHint;
            return resultMsg;
        } else if (repassword == null) {
            resultMsg=Constant.editInfoFormHint;
            return resultMsg;
        } else if (!password.equals(repassword)) {
            resultMsg=Constant.editInfoFormHint;
            return resultMsg;
        } else {
            return Constant.editInfoSuccessfullyHint;
        }
    }

    private String editInfoHandlePasswordNotLongEnough(String password) {
        String resultMsg = "";
        if (password.length()>5 && password.length()<13)
            resultMsg = Constant.editInfoSuccessfullyHint;
        else resultMsg = Constant.editInfoPasswordNotLongEnoughHint;

        return resultMsg;
    }

    private boolean editInfoCheckPhoneValid(String contact) {
        boolean flag = false;
        flag = Validator.isMobile(contact);
        return flag;
    }

}