package com.camplus.Tests.UnitTest;

import com.camplus.entity.Course;
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
import java.util.ArrayList;
import java.util.Date;

import static org.junit.Assert.assertEquals;

/**
 * Created by fowafolo
 * Date: 16/6/8
 * Time: 16:57
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
    public void searchCourse() throws Exception {
        String courseName="";
        String teacherName="";
        ArrayList<Course> courses = new ArrayList<Course>();

        /**
         * 已知杜老师的课程数量为7,软件关键字的课数量为15,课程总数量为102,杜老师教的有软件关键字课程的数量为7
         */

        /**
         * 两个参数均不输入
         */
        courses = courseService.getCoursesByCourseNameAndTeacherName(courseName,teacherName);
        assertEquals(102,courses.size());

        /**
         * 两个参数均不输入
         */
        teacherName="杜庆峰";
        courseName="";
        courses = courseService.getCoursesByCourseNameAndTeacherName(courseName,teacherName);
        assertEquals(7,courses.size());

        /**
         * 两个参数均不输入
         */
        teacherName="";
        courseName="软件";
        courses = courseService.getCoursesByCourseNameAndTeacherName(courseName,teacherName);
        assertEquals(15,courses.size());

        /**
         * 两个参数均正常输入
         */
        courseName="软件";
        teacherName="杜庆峰";
        courses = courseService.getCoursesByCourseNameAndTeacherName(courseName,teacherName);
        assertEquals(7,courses.size());
    }

    @Test
    public void showDetail() throws Exception {
        String courseId = "";
        Course course = new Course();
        ArrayList<CourseMessage> courseArr=new ArrayList<CourseMessage>();



        /**
         * 课程id为空无需检测,编译器报错
         */

        /**
         * 课程id不存在
         */
        course = courseService.getCourseById(courseId);
        courseArr=courseMsgService.getCourseMsgbyIdAndIndex(courseId, 0);
        System.out.println(courseArr.get(0).getCourseMessTitle());
        assertEquals(0, courseArr.size());


        /**
         * 课程id存在
         */
        courseId = "42019201";
        course = courseService.getCourseById(courseId);
        courseArr=courseMsgService.getCourseMsgbyIdAndIndex(courseId, 0);
        System.out.println(courseArr.get(0).getCourseMessTitle());
        assertEquals(3, courseArr.size());
    }

    @Test
    public void commitMessage() throws Exception {
        String msgtitle="Test";
        String msgcontent="哈哈哈";

        CourseMessage cm=new CourseMessage();
        String userId = "1111111";
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