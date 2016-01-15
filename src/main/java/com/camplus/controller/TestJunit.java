package com.camplus.controller;

import com.camplus.entity.Course;
import com.camplus.service.CourseService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;

/**
 * Created by fowafolo
 * Date: 16/1/15
 * Time: 下午9:46
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/WEB-INF/applicationContext.xml"})
public class TestJunit {
    @Autowired
    private CourseService courseService;

    static String avatorId = null;
    static ArrayList<Course> courses = new ArrayList<Course>();

    @BeforeClass
    public static void getImageId() {
        avatorId = "3";
        System.out.println("Before Class");
    }

    @Test
    public void testAvator() {
        System.out.println("The avator is:" + avatorId);
        courses = courseService.getCoursesByCourseNameAndTeacherName("软件工程","");
        System.out.println("Course size with name 软件工程： "+ courses.size());

    }
}

