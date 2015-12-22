package com.camplus.DAO;

import com.camplus.entity.User;

/**
 * Created by fowafolo on 15/5/11.
 */

public interface UserDAO extends GeneralDAO<User>{
//    public void save(User user);
//    public List<User> findAll();
    public int checkUserIdentity(String userId, String userPassword);
}
