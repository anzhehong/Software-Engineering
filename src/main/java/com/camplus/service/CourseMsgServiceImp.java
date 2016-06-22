package com.camplus.service;

import com.camplus.DAO.CourseMsgDAO;
import com.camplus.entity.CourseMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

/**
 * Created by jinmin on 5/25/15.
 */


@Service
@Transactional
public class CourseMsgServiceImp implements CourseMsgService{

    @Autowired
    private CourseMsgDAO courseMsgDAO;

    public ArrayList<CourseMessage> getCourseMsgbyIdAndIndex(String courseId,int index){
        ArrayList<CourseMessage> arr=courseMsgDAO.getCourseMsgsbycourseIdAndIndex(courseId, index);
        return arr;
    }

    public void commitMessage(CourseMessage cm) {
        if (cm.getCourseMessContent().length()<=10)
            courseMsgDAO.insert(cm);
        else
            ;
    }

}
