package com.camplus.DAO;

import com.camplus.entity.Dish;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by mark on 5/26/15.
 */
@Repository
public class DishDAOImp extends GeneralDAOImp<Dish> implements DishDAO {


    //
    public DishDAOImp() {
        super(Dish.class);
    }


    //get dishes by restaurantId
    @Override
    public List<Dish> queryByRestaurantId(String restaurantId) {
        String hql = "from Dish where dishRestaurantId = :m";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("m", restaurantId);
        return query.list();
    }

    @Override
    public List<Dish> queryByDishName(String dishName) {
        String hql = "from Dish where dishName like :m";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString("m", "%"+dishName+"%");
        return query.list();
    }
}
