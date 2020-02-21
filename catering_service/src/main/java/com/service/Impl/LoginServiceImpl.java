package com.service.Impl;

import com.dao.LoginDao;
import com.entity.Manager;
import com.entity.User;
import com.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDao loginDao;
    @Override
    public List<User> LoginAll(String username, String password) {
        return loginDao.LoginAll(username,password);
    }

    @Override
    public void insertUser(User user) {
        loginDao.insertUser(user);
    }
}
