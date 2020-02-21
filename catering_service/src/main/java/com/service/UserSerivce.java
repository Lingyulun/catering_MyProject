package com.service;

import com.entity.RoleEntity;
import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserSerivce {
    boolean addUser(User user);

    User findUser(String id);

    List<User> getAllUser();

    RoleEntity getUserRole(String userId);

    void updateRole(User user, String roleId);

    User findUser(String userName, String password);



}
