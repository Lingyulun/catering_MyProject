package com.dao;

import com.entity.Menu;
import com.entity.RoleEntity;

import java.util.List;

public interface RoleDao {
    void addRole(RoleEntity roleEntity);
    List<RoleEntity> getAll();
    RoleEntity findRole(String id);
    List<Menu> getMenusByRoleId(String roleId);
}
