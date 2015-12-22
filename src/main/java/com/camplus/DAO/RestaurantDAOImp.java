package com.camplus.DAO;

import com.camplus.entity.Restaurant;
import org.springframework.stereotype.Repository;

/**
 * Created by mark on 5/26/15.
 */

@Repository
public class RestaurantDAOImp extends GeneralDAOImp<Restaurant> implements RestaurantDAO {

    public RestaurantDAOImp() {
        super(Restaurant.class);
    }
}
