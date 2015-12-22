package com.camplus.DAO;

import com.camplus.entity.CourseMessage;

import java.util.ArrayList;

/**
 * Created by jinmin on 5/25/15.
 */
public interface CourseMsgDAO extends GeneralDAO<CourseMessage>{
    public ArrayList<CourseMessage> getCourseMsgsbycourseIdAndIndex(String courseId,int index);
    /*public void insertMessage(HttpSession session,String courseId,String msgtitle,String msgcontent);*/
}
