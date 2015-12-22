package com.camplus.service;

import com.camplus.DAO.DishDAO;
import com.camplus.DAO.RestaurantDAO;
import com.camplus.entity.Dish;
import com.camplus.entity.Restaurant;
import javafx.util.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by mark on 5/26/15.
 */

@Service("restaurantService")
@Transactional
public class RestaurantServiceImp implements RestaurantService {

    @Autowired
    private RestaurantDAO restaurantDAO;
    @Autowired
    private DishDAO dishDAO;

    @Override
    public List<Restaurant> queryAll() {
        return restaurantDAO.queryAll();
    }

    @Override
    public Restaurant queryById(String id) {
        return restaurantDAO.queryById(id);
    }

    @Override
    public List<Dish> getDishesByRestaurantId(String restaurantId) {
        return dishDAO.queryByRestaurantId(restaurantId);
    }

    @Override
    public List<Pair> getRestaurantByDishName(String dishName) {
        List<Dish> dishes = dishDAO.queryByDishName(dishName);
        List<Pair> result = new ArrayList<Pair>();
        for (int i = 0; i < dishes.size(); ++i){
            Dish d = dishes.get(i);
            Restaurant r = restaurantDAO.queryById(d.getDishRestaurantId());
            Pair<Dish, Restaurant> pair = new Pair<Dish, Restaurant>(d,r);
            result.add(pair);
        }
        return result;
    }
}
