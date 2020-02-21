package com.service;

import com.entity.Menu;
import com.entity.RoleEntity;

import java.util.List;

public interface PrivilegeService {
    void updateRolePrivilege(RoleEntity roleEntity, List<Menu> privileges);
}
