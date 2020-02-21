package com.service;

import com.entity.Manager;
import com.entity.User;

import java.util.List;

public interface LoginService {
    List<User> LoginAll(String username, String password);
    void insertUser(User user);
}
