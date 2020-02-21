package com.service.Impl;

import com.dao.UserDao;
import com.entity.RoleEntity;
import com.entity.User;
import com.service.UserSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserSerivce {

    @Autowired
    private UserDao userDao;
    @Override
    public boolean addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public User findUser(String id) {
        return userDao.findUser(id);
    }

    @Override
    public List<User> getAllUser() {
        return userDao.getAll();
    }

    @Override
    public RoleEntity getUserRole(String userId) {
        return userDao.getRoles(userId);
    }


    @Transactional(rollbackFor = RuntimeException.class)
    @Override
    public void updateRole(User user, String roleId) {
        userDao.deleteRolesByUserId(user.getId());
        userDao.insertUserRole(user.getId(),roleId);
    }

    @Override
    public User findUser(String userName, String password) {
        return userDao.findUserByUsernameAndPassword(userName, password);
    }



}
