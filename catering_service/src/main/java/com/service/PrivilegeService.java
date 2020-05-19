package com.service;

import com.entity.Menu;
import com.entity.RoleEntity;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface PrivilegeService {
    void updateRolePrivilege(RoleEntity roleEntity, List<Menu> privileges);
}
