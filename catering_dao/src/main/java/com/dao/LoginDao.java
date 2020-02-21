package com.dao;

import com.entity.Manager;
import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface LoginDao {
    List<User> LoginAll(@Param("username") String username, @Param("password") String password);
    void insertUser(User user);
}
