package com.camplus.DAO;

import com.camplus.entity.User;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by fowafolo on 15/5/11.
 */



@Repository
//@Transactional  //告诉Spring这里是个事务
public class UserDAOImp extends GeneralDAOImp<User> implements UserDAO {

//    @Autowired
//    private SessionFactory sessionFactory;
//
//    public UserDAOImp(Class<User> classes) {
//        super(classes);
//    }
//
//    public void save(User user) {
//        sessionFactory.getCurrentSession().save(user);
//    }
//    public List<User> findAll() {
//        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
//        return criteria.list();
//    }
//
    public int checkUserIdentity(String userId, String userPassword) {

        if (userId == null || userPassword == null) {
            return 4;
        }
        String hql = "from User where userId= ? ";
        Query query = super.sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,userId);
        ArrayList<User> users = (ArrayList<User>) query.list();
        if (users.size()==0){
            return 0;   //返回：用户id不存在
        }else {
            if (users.get(0).getUserPassword().equals(userPassword)){
                return 2;   //返回：用户密码正确
            }else {
                return 1;   //密码错误
            }
        }
    }
    public UserDAOImp(){
        super(User.class);
    }
}
