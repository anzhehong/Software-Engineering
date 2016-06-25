package com.camplus.Tests.UnitTest;

import com.camplus.Util.JavaMD5Util;
import com.camplus.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by fowafolo
 * Date: 16/6/25
 * Time: 08:56
 */

@RunWith(SpringJUnit4ClassRunner.class) // 整合
@ContextConfiguration(locations = {"/WEB-INF/applicationContext.xml"})
public class UserDAOTest {

    @Autowired
    private UserService userService;

    @Test
    public void checkUserIdentity() throws Exception {
        System.out.println("result1: " + userService.checkIdentity("1352834", "123"));
        System.out.println("result2: " + userService.checkIdentity("1352834", JavaMD5Util.MD5("123")));
    }

}