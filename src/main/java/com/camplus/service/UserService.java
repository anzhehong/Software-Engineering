package com.camplus.service;

import com.camplus.entity.User;

import java.util.List;

/**
 * Created by fowafolo on 15/5/11.
 */
public interface UserService {
    public void saveUsers(List<User> users);
    public List<User> getAllUserNames();

    public int checkIdentity(String userId,String userPassword);
    public void userRegister(User user);
    public User getById(String id);
    public void updateUser(User user);
}

