package com.camplus.service;

import com.camplus.entity.Course;

import java.util.ArrayList;

/**
 * Created by fowafolo on 15/5/18.
 */
public interface CourseService {

    public ArrayList<Course> getCoursesByCourseNameAndTeacherName(String courseName,String teacherName);
    public Course getCourseById(String courseId);
}
