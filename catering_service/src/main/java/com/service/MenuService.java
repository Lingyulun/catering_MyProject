package com.service;

import com.entity.Menu;
import java.util.List;

public interface MenuService {
    Menu findMenuById(String id);
    List<Menu> getAllMenus();
}
