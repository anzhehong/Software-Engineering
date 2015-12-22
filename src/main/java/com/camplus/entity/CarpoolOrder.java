package com.camplus.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by fowafolo on 15/5/19.
 */

@Entity
@Table
public class CarpoolOrder implements Serializable{

    @Id
    private String carpoolId;

    private String carpoolOriginPlace;
    private String carpoolDestination;
    //注意时间的类型转换
    private Date carpoolDepartureTime;
    private int carpoolNumberOfStudent;
    private String carpoolCarType;
    private String carpoolSpecialRequirement;
    private String carpoolSubscriber;

    public String getCarpoolId() {
        return carpoolId;
    }

    public void setCarpoolId(String carpoolId) {
        this.carpoolId = carpoolId;
    }

    public String getCarpoolOriginPlace() {
        return carpoolOriginPlace;
    }

    public void setCarpoolOriginPlace(String carpoolOriginPlace) {
        this.carpoolOriginPlace = carpoolOriginPlace;
    }

    public String getCarpoolDestination() {
        return carpoolDestination;
    }

    public void setCarpoolDestination(String carpoolDestination) {
        this.carpoolDestination = carpoolDestination;
    }

    public Date getCarpoolDepartureTime() {
        return carpoolDepartureTime;
    }

    public void setCarpoolDepartureTime(Date carpoolDepartureTime) {
        this.carpoolDepartureTime = carpoolDepartureTime;
    }

    public int getCarpoolNumberOfStudent() {
        return carpoolNumberOfStudent;
    }

    public void setCarpoolNumberOfStudent(int carpoolNumberOfStudent) {
        this.carpoolNumberOfStudent = carpoolNumberOfStudent;
    }

    public String getCarpoolCarType() {
        return carpoolCarType;
    }

    public void setCarpoolCarType(String carpoolCarType) {
        this.carpoolCarType = carpoolCarType;
    }

    public String getCarpoolSpecialRequirement() {
        return carpoolSpecialRequirement;
    }

    public void setCarpoolSpecialRequirement(String carpoolSpecialRequirement) {
        this.carpoolSpecialRequirement = carpoolSpecialRequirement;
    }

    public String getCarpoolSubscriber() {
        return carpoolSubscriber;
    }

    public void setCarpoolSubscriber(String carpoolSubscriber) {
        this.carpoolSubscriber = carpoolSubscriber;
    }
}
