package com.camplus.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by fowafolo on 15/5/18.
 */

@Entity
@Table
public class Course {

    @Id
    private String courseId;

    private String courseName;
    private int courseLearnTime;
    private double courseCredit;
    private String courseExamPattern;
    private String courseTeacherName;
    private String courseTeacherProfessTitle;
    private String coursePlace;
    private String courseNote;
    private String courseDescription;

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getCourseLearnTime() {
        return courseLearnTime;
    }

    public void setCourseLearnTime(int courseLearnTime) {
        this.courseLearnTime = courseLearnTime;
    }

    public double getCourseCredit() {
        return courseCredit;
    }

    public void setCourseCredit(double courseCredit) {
        this.courseCredit = courseCredit;
    }

    public String getCourseExamPattern() {
        return courseExamPattern;
    }

    public void setCourseExamPattern(String courseExamPattern) {
        this.courseExamPattern = courseExamPattern;
    }

    public String getCourseTeacherName() {
        return courseTeacherName;
    }

    public void setCourseTeacherName(String courseTeacherName) {
        this.courseTeacherName = courseTeacherName;
    }

    public String getCourseTeacherProfessTitle() {
        return courseTeacherProfessTitle;
    }

    public void setCourseTeacherProfessTitle(String courseTeacherProfessTitle) {
        this.courseTeacherProfessTitle = courseTeacherProfessTitle;
    }

    public String getCoursePlace() {
        return coursePlace;
    }

    public void setCoursePlace(String coursePlace) {
        this.coursePlace = coursePlace;
    }

    public String getCourseNote() {
        return courseNote;
    }

    public void setCourseNote(String courseNote) {
        this.courseNote = courseNote;
    }

    public String getCourseDescription() {
        return courseDescription;
    }

    public void setCourseDescription(String courseDescription) {
        this.courseDescription = courseDescription;
    }
}
