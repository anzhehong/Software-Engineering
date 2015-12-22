package com.camplus.controller;

import com.camplus.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by fowafolo on 15/5/19.
 */

@Controller
@RequestMapping("/information")

public class InformationController {

    @Autowired
    InformationService informationService;

    @RequestMapping("/restaurantHome")
    public String restaurantHome(){

        return "Information/restaurantHome";
    }

    @RequestMapping("/locationHome")
    public String locationHome(){

        return "Information/locationHome";
    }

    @RequestMapping("/busTimeHome")
    public String busTimeHome(){

        return "Information/busTimeHome";
    }
}
