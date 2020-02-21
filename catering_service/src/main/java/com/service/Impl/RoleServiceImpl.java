package com.service.Impl;

import com.dao.RoleDao;
import com.entity.Menu;
import com.entity.RoleEntity;
import com.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;


    @Override
    public void addRole(RoleEntity roleEntity) {
        roleDao.addRole(roleEntity);
    }

    @Override
    public List<RoleEntity> getAllRole() {
        return roleDao.getAll();
    }


    @Override
    public RoleEntity findRole(String id) {
        return roleDao.findRole(id);
    }

    @Override
    public List<Menu> getRolePrivilege(String roleId) {
        return roleDao.getMenusByRoleId(roleId);
    }
}
