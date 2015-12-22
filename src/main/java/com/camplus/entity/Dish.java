package com.camplus.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by fowafolo on 15/5/19.
 */

@Entity
@Table
public class Dish {

    @Id
    private String dishId;

    private String dishRestaurantId;
    private String dishImageId;
    private String dishName;
    private double dishScore;
    private String dishInfo;
    private double dishPrice;

    public String getDishId() {
        return dishId;
    }

    public void setDishId(String dishId) {
        this.dishId = dishId;
    }

    public String getDishRestaurantId() {
        return dishRestaurantId;
    }

    public void setDishRestaurantId(String dishRestaurantId) {
        this.dishRestaurantId = dishRestaurantId;
    }

    public String getDishImageId() {
        return dishImageId;
    }

    public void setDishImageId(String dishImageId) {
        this.dishImageId = dishImageId;
    }

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public double getDishScore() {
        return dishScore;
    }

    public void setDishScore(double dishScore) {
        this.dishScore = dishScore;
    }

    public String getDishInfo() {
        return dishInfo;
    }

    public void setDishInfo(String dishInfo) {
        this.dishInfo = dishInfo;
    }

    public double getDishPrice() {
        return dishPrice;
    }

    public void setDishPrice(double dishPrice) {
        this.dishPrice = dishPrice;
    }
}
