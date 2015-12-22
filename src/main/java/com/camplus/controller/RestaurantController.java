package com.camplus.controller;

import com.camplus.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by mark on 5/26/15.
 */

@Controller
@RequestMapping("/restaurant")
public class RestaurantController {

    @Autowired
    private RestaurantService service;


    //list all restaurants
    @RequestMapping("")
    public String restaurant(Model model){

        //add all restaurant in a list to view
        model.addAttribute("restaurants", service.queryAll());
        return "Information/restaurantHome";
    }

    //get dishes by restaurant name
    @RequestMapping(value = "/get/{restaurantId}", method = RequestMethod.GET)
    public String getDishes(@PathVariable String restaurantId, Model model){

        //add restaurant info to view
        model.addAttribute("restaurant", service.queryById(restaurantId));

        //add dishes to the view
        model.addAttribute("dishes", service.getDishesByRestaurantId(restaurantId));
        return "Information/restaurantDetail";
    }

    //get dishes by name
    @RequestMapping("/search")
    public String searchDishName(String dishName, Model model){
        System.out.println(dishName);
        model.addAttribute("restaurants", service.getRestaurantByDishName(dishName));
        model.addAttribute("keyWords",dishName);
        return "Information/restaurantSearchDish";
    }
}
