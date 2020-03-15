package com.dao;

import com.entity.RoleEntity;
import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    boolean addUser(User user);

    User findUser(String id);

    List<User> getAll();

    RoleEntity getRoles(String userId);

    void updateRole(User user, String roleId);

    User findUserByUsernameAndPassword(@Param("username") String userName, @Param("password") String password);

    void deleteRolesByUserId(String userId);

    void insertUserRole(@Param("userId") String userId, @Param("roleId") String roleId);

}
