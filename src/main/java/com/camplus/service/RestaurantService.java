package com.camplus.service;


import com.camplus.entity.Dish;
import com.camplus.entity.Restaurant;
import javafx.util.Pair;

import java.util.List;

/**
 * Created by mark on 5/26/15.
 */
public interface RestaurantService {

    //get all restaurants
    List<Restaurant> queryAll();
    Restaurant queryById(String id);
    //search dish name
//    List<Restaurant> search

    //get dishes by restaurant id
    List<Dish> getDishesByRestaurantId(String restaurantId);

    //get restaurant by dish name
    List<Pair> getRestaurantByDishName(String dishName);
}
