package com.camplus.DAO;

import com.camplus.entity.Course;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by fowafolo on 15/5/18.
 */

@Repository
public class CourseDiscussDAOImp extends GeneralDAOImp<Course> implements CourseDiscussDAO {

    public CourseDiscussDAOImp(){
        super(Course.class);
    }

    public ArrayList<Course> getCoursesByCourseNameAndTeacherName(String courseName,String teacherName){
        String hql = "from Course as c where c.courseName like :cN And c.courseTeacherName like :tN";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("cN","%"+courseName+"%");
        query.setString("tN","%"+teacherName+"%");
        return (ArrayList<Course>) query.list();
    }

}
