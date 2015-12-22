package com.camplus.DAO;

import com.camplus.entity.Course;

import java.util.ArrayList;

/**
 * Created by fowafolo on 15/5/18.
 */
public interface CourseDiscussDAO extends GeneralDAO<Course> {

    public ArrayList<Course> getCoursesByCourseNameAndTeacherName(String courseName,String teacherName);
}
