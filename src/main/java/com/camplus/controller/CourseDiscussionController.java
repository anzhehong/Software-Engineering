package com.camplus.controller;

import com.camplus.entity.Course;
import com.camplus.entity.CourseMessage;
import com.camplus.entity.User;
import com.camplus.service.CourseMsgService;
import com.camplus.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by fowafolo on 15/5/18.
 */

@Controller
@RequestMapping("/courseDiscussion")
public class CourseDiscussionController {

    @Autowired
    CourseService courseService;
    @Autowired
    CourseMsgService courseMsgService;

    @RequestMapping("/search")
    public String searchCourse(String teacherName, String courseName, Model courseInfo){

        ArrayList<Course> courses = new ArrayList<Course>();
        courses = courseService.getCoursesByCourseNameAndTeacherName(courseName,teacherName);
        courseInfo.addAttribute("course",courses);
        return "CourseDiscussion/courseSearch";
    }


    @RequestMapping("/showDetail")
    public String showDetail(HttpSession session,String courseId, Model courseInfo){
        session.setAttribute("courseId",courseId);
        Course course = new Course();
        ArrayList<CourseMessage> courseArr=new ArrayList<CourseMessage>();
        course = courseService.getCourseById(courseId);
        courseArr=courseMsgService.getCourseMsgbyIdAndIndex(courseId, 0);
        courseInfo.addAttribute("course", course);
        System.out.println(courseArr.size());
        courseInfo.addAttribute("message",courseArr);
        session.setAttribute("courseId", courseId);
        courseInfo.addAttribute("courseId",course.getCourseId());
        return "CourseDiscussion/showDiscussionBoard";
    }

    @RequestMapping("/commitMsg")
    public String commitMessage(String msgtitle,String msgcontent,HttpSession session,Model msginfo){
        CourseMessage cm=new CourseMessage();
        User user=(User)session.getAttribute("userSession");
        cm.setCourseMessId(user.getUserId()+new Date().getTime());
        cm.setCourseId((String)session.getAttribute("courseId"));
        cm.setCourseMessAgree(0);
        cm.setCourseMessDissagree(0);
        cm.setCourseMessGiverId(user.getUserId());
        cm.setCourseMessContent(msgcontent);
        cm.setCourseMessTitle(msgtitle);
        cm.setCourseMessGiverTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        courseMsgService.commitMessage(cm);
        msginfo.addAttribute("userName",user.getUserName());
        return "CourseDiscussion/commitSuccess";
    }

}
