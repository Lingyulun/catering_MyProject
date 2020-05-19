package com.service.Impl;

import com.dao.UserDao;
import com.dao.UserDao;
import com.entity.User;
import com.entity.RoleEntity;
import com.entity.User;
import com.service.UserSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Service
public class UserServiceImpl implements UserSerivce {

   /* @Autowired
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
        userDao.deleteRolesByUserId(user.getMId());
        userDao.insertUserRole(user.getMId(),roleId);
    }

    @Override
    public User findUser(String userName, String password) {
        return userDao.findUserByUsernameAndPassword(userName, password);
    }*/


    @Autowired
    private UserDao UserDao;



    @Override
    public List<User> LoginAll(String mUsername, String password) {
        return UserDao.LoginAll(mUsername, password);
    }

    @Override
    public List<User> getAllUser(int pageNum,int pageSize) {
        return UserDao.getAllManager(pageNum, pageSize);
    }

    @Override
    public List<User> getmNameUser(String mName,int pageNum,int pageSize) {
        return UserDao.getmNameManager(mName, pageNum, pageSize);
    }

    @Override
    public User addUser(User user) {
        return UserDao.addManager(user);
    }

    @Override
    public User getUserUpdateId(int mId) {
        return UserDao.getManagerUpdateId(mId);
    }

    @Override
    public User updateUser(User user) {
        return UserDao.updateManager(user);
    }

    @Override
    public void delUser(int mId) {
        UserDao.delManager(mId);
    }

    @Override
    public int delBatchesUser(Integer[] sids) {
        return UserDao.delBatchesManager(sids);
    }


}
