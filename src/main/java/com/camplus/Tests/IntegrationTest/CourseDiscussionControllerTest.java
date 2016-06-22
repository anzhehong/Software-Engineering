package com.camplus.Tests.IntegrationTest;

import com.camplus.entity.CourseMessage;
import com.camplus.service.CourseMsgService;
import com.camplus.service.CourseService;
import com.camplus.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by fowafolo
 * Date: 16/6/22
 * Time: 19:14
 */


@RunWith(SpringJUnit4ClassRunner.class) // 整合
@ContextConfiguration(locations = {"/WEB-INF/applicationContext.xml"})
public class CourseDiscussionControllerTest {

    @Autowired
    CourseService courseService;
    @Autowired
    CourseMsgService courseMsgService;
    @Autowired
    UserService userService;

    @Test
    public void commitMessage() throws Exception {
        String msgtitle="Test";
//        String msgcontent="哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" +
//                "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" +
//                "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" +
//                "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" +
//                "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" +
//                "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" +
//                "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" +
//                "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" +
//                "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" +
//                "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈我超过一百了!!!";
        String msgcontent="哈哈哈哈哈哈哈哈哈哈";

        CourseMessage cm=new CourseMessage();
        String userId = "1352834";
        cm.setCourseMessId(userId + new Date().getTime());
        cm.setCourseId("42002401");
        cm.setCourseMessAgree(0);
        cm.setCourseMessDissagree(0);
        cm.setCourseMessGiverId(userId);
        cm.setCourseMessContent(msgcontent);
        cm.setCourseMessTitle(msgtitle);
        cm.setCourseMessGiverTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        courseMsgService.commitMessage(cm);
    }

}