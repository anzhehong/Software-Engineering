package com.camplus.service;

import com.camplus.entity.CourseMessage;

import java.util.ArrayList;

/**
 * Created by jinmin on 5/25/15.
 */
public interface CourseMsgService {
    public ArrayList<CourseMessage> getCourseMsgbyIdAndIndex(String courseId,int index);
    public void commitMessage(CourseMessage cm);
}
