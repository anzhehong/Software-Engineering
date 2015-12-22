package com.camplus.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * Created by fowafolo on 15/5/19.
 */

@Entity
@Table
public class CourseMessage {

    @Id
    private String courseMessId;

    private String courseId;
    private String courseMessGiverId;
    private String courseMessGiverTime;
    private String courseMessContent;
    private String courseMessTitle;
    private int courseMessAgree;
    private int courseMessDissagree;

    public String getCourseMessId() {
        return courseMessId;
    }

    public void setCourseMessId(String courseMessId) {
        this.courseMessId = courseMessId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseMessGiverId() {
        return courseMessGiverId;
    }

    public void setCourseMessGiverId(String courseMessGiverId) {
        this.courseMessGiverId = courseMessGiverId;
    }

    public String getCourseMessGiverTime() {
        return courseMessGiverTime;
    }

    public void setCourseMessGiverTime(String courseMessGiverTime) {
        this.courseMessGiverTime = courseMessGiverTime;
    }

    public String getCourseMessContent() {
        return courseMessContent;
    }

    public void setCourseMessContent(String courseMessContent) {
        this.courseMessContent = courseMessContent;
    }

    public String getCourseMessTitle() {
        return courseMessTitle;
    }

    public void setCourseMessTitle(String courseMessTitle) {
        this.courseMessTitle = courseMessTitle;
    }

    public int getCourseMessAgree() {
        return courseMessAgree;
    }

    public void setCourseMessAgree(int courseMessAgree) {
        this.courseMessAgree = courseMessAgree;
    }

    public int getCourseMessDissagree() {
        return courseMessDissagree;
    }

    public void setCourseMessDissagree(int courseMessDissagree) {
        this.courseMessDissagree = courseMessDissagree;
    }
}
