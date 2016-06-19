package com.camplus.Tests.IntegrationTest;

import com.camplus.service.RestaurantService;
import javafx.util.Pair;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by fowafolo
 * Date: 16/6/19
 * Time: 10:45
 */

@RunWith(SpringJUnit4ClassRunner.class) // 整合
@ContextConfiguration(locations = {"/WEB-INF/applicationContext.xml"})
public class RestaurantControllerTest {

    @Autowired
    private RestaurantService service;

    @Test
    public void getDishes() throws Exception {
        /**
         * IT_TD_003_001_001
         * 根据某餐馆的ID可以返回该餐馆的所有菜品
         */
    }

    @Test
    public void searchDishName() throws Exception {
        /**
         * IT_TD_003_002_001
         * 根据菜品名返回结果
         */
        //1
        String dishName = "鱼香";
        handleSearchName(dishName);

        //2
        dishName = "饭";
        handleSearchName(dishName);

        //3
        dishName = "不存在";
        handleSearchName(dishName);
    }

    private void handleSearchName(String dishName) {
        java.util.List<Pair> result = service.getRestaurantByDishName(dishName);
        System.out.println("------------Test---------------");
        System.out.println(result.size());
        System.out.println("-------------------------------");
    }

}