package com.camplus.service;

import com.camplus.DAO.UserDAO;
import com.camplus.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by fowafolo on 15/5/11.
 */
@Service("userService")
@Transactional  //Transactional，就是指明每个方法是一个事务。
public class UserServiceImp implements UserService {

    @Autowired  //自动实例化
    private UserDAO userDAO;

    public void saveUsers(List<User> users) {
        for (User user:users)
            userDAO.insert(user);
    }

    public List<User> getAllUserNames() {
//        List<String> users = new ArrayList<String>();
//        users.add("MarK");
//        users.add("Ken");
//        users.add("Fowafolo");
//        users.add("Chole");
        return userDAO.queryAll();
    }

    public int checkIdentity(String userId, String userPassword) {
        return userDAO.checkUserIdentity(userId, userPassword);
    }
    public void userRegister(User user){
        userDAO.insert(user);
    }
    public User getById(String id) {
        return userDAO.queryById(id);
    }

    @Override
    public void updateUser(User user) {
        userDAO.update(user);
    }
}

