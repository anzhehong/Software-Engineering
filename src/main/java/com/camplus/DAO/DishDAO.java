package com.camplus.DAO;

import com.camplus.entity.Dish;

import java.util.List;

/**
 * Created by mark on 5/26/15.
 */
public interface DishDAO extends GeneralDAO<Dish>{

    List<Dish> queryByRestaurantId(String restaurantId);
    List<Dish> queryByDishName(String dishName);
}
