package com.service.Impl;

import com.dao.PrivilegeDao;
import com.entity.Menu;
import com.entity.RoleEntity;
import com.service.PrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Service
public class PrivilegeServiceImpl implements PrivilegeService {

    @Autowired
    private PrivilegeDao privilegeDao;

    @Transactional
    @Override
    public void updateRolePrivilege(RoleEntity roleEntity, List<Menu> privileges) {
        privilegeDao.deleteRolePrivilege(roleEntity.getId());
        privilegeDao.insertRolePrivilege(roleEntity.getId(),privileges);
    }
}
