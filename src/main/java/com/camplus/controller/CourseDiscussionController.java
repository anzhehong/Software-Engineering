package com.camplus.controller;

import com.camplus.entity.Course;
import com.camplus.entity.CourseMessage;
import com.camplus.entity.User;
import com.camplus.service.CourseMsgService;
import com.camplus.service.CourseService;
import com.camplus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
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
    @Autowired
    UserService userService;

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

        ArrayList<MessageResult> messageResults = new ArrayList<MessageResult>();
        for (int i = 0; i < courseArr.size(); i ++)
        {
            MessageResult temp = new MessageResult();
            temp.setCourseMessage(courseArr.get(i));
            temp.setMessageGiverImageId(userService.getById(courseArr.get(i).getCourseMessGiverId()).getUserAvator());
            messageResults.add(temp);
        }

        courseInfo.addAttribute("result",messageResults);

        session.setAttribute("courseId", courseId);
        courseInfo.addAttribute("courseId",course.getCourseId());
        return "CourseDiscussion/showDiscussionBoard";
    }
    public class MessageResult {
        private CourseMessage courseMessage;
        private String messageGiverImageId;

        public CourseMessage getCourseMessage() {
            return courseMessage;
        }

        public void setCourseMessage(CourseMessage courseMessage) {
            this.courseMessage = courseMessage;
        }

        public String getMessageGiverImageId() {
            return messageGiverImageId;
        }

        public void setMessageGiverImageId(String messageGiverImageId) {
            this.messageGiverImageId = messageGiverImageId;
        }
    }

    @RequestMapping("/commitMsg")
    public void commitMessage(String msgtitle, String msgcontent, HttpSession session, Model courseInfo){
        CourseMessage cm=new CourseMessage();
        User user=(User)session.getAttribute("userSession");
        cm.setCourseMessId(user.getUserId() + new Date().getTime());
        cm.setCourseId((String) session.getAttribute("courseId"));
        cm.setCourseMessAgree(0);
        cm.setCourseMessDissagree(0);
        cm.setCourseMessGiverId(user.getUserId());
        cm.setCourseMessContent(msgcontent);
        cm.setCourseMessTitle(msgtitle);
        cm.setCourseMessGiverTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        courseMsgService.commitMessage(cm);


   //     return "CourseDiscussion/showDiscussionBoard?";
    }

}
