package com.camplus.DAO;

import com.camplus.entity.CourseMessage;
import com.camplus.entity.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import sun.rmi.transport.Connection;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.sql.*;
import javax.naming.*;

/**
 * Created by jinmin on 5/25/15.
 */


@Repository
public class CourseMsgDAOImp extends GeneralDAOImp<CourseMessage> implements CourseMsgDAO{
    public CourseMsgDAOImp(){
        super(CourseMessage.class);
    }

    public ArrayList<CourseMessage> getCourseMsgsbycourseIdAndIndex(String courseId,int index) {
        ArrayList<CourseMessage> arrCrsMsg;
        String hql = "from CourseMessage as cm where cm.courseId = ? order by cm.courseMessGiverTime";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, courseId);
        arrCrsMsg = (ArrayList<CourseMessage>) query.list();
        System.out.println(arrCrsMsg.size());
        return arrCrsMsg;
    }

}
