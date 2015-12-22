package com.camplus.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by fowafolo on 15/5/19.
 */

@Entity
@Table
public class DishImage {

    @Id
    private String dishImageId;

    public String getDishImageId() {
        return dishImageId;
    }

    public void setDishImageId(String dishImageId) {
        this.dishImageId = dishImageId;
    }
}
