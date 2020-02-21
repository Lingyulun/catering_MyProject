package com.service.Impl;

import com.dao.UserRoleDao;
import com.entity.User;
import com.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Service
public class UserRoleServiceImpl implements UserRoleService {
    @Autowired
    private UserRoleDao userRoleDao;
    @Override
    public List<User> UserRolegetAll() {
        return userRoleDao.UserRolegetAll();
    }
}
