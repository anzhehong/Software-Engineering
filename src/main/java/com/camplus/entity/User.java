package com.camplus.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by fowafolo on 15/5/11.
 */

@Entity
@Table
public class User implements Serializable{

//    @GeneratedValue 设置自增
    @Id
    private String userId;

    private String userName;
    private int userLevel;
    private int userExperience;
    private String userPassword;
    private String userMobile;
    private String userAvator;

    public User() {
    }

    public User(int userExperience, String userId, int userLevel, String userName, String userPassword) {
        this.userExperience = userExperience;
        this.userId = userId;
        this.userLevel = userLevel;
        this.userName = userName;
        this.userPassword = userPassword;
    }

    public String getUserAvator() {
        return userAvator;
    }

    public void setUserAvator(String userAvator) {
        this.userAvator = userAvator;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(int userLevel) {
        this.userLevel = userLevel;
    }

    public int getUserExperience() {
        return userExperience;
    }

    public void setUserExperience(int userExperience) {
        this.userExperience = userExperience;
    }

    public String getUserMobile() {
        return userMobile;
    }

    public void setUserMobile(String userMobile) {
        this.userMobile = userMobile;
    }
}
