package com.service.Impl;

import com.dao.MenuDao;
import com.entity.Menu;
import com.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDao menuDao;
    @Override
    public Menu findMenuById(String id) {
        return menuDao.findMenuById(id);
    }

    @Override
    public List<Menu> getAllMenus() {
        return menuDao.getAllMenus();
    }
}
