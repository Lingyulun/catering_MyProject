package com.dao;

import com.entity.Menu;

import java.util.List;

public interface MenuDao {
    Menu findMenuById(String id);
    List<Menu> getAllMenus();
}
