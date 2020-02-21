package com.service;

import com.entity.Menu;
import com.entity.RoleEntity;

import java.util.List;

public interface RoleService {

    void addRole(RoleEntity roleEntity);

    List<RoleEntity> getAllRole();
    RoleEntity findRole(String id);
    List<Menu> getRolePrivilege(String roleId);
}
