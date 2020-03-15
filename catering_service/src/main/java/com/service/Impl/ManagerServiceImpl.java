package com.service.Impl;

import com.dao.ManagerDao;
import com.entity.Manager;
import com.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerDao managerDao;
    @Override
    public List<Manager> getAllManager(int pageNum,int pageSize) {
        return managerDao.getAllManager(pageNum, pageSize);
    }

    @Override
    public List<Manager> getmNameManager(String mName,int pageNum,int pageSize) {
        return managerDao.getmNameManager(mName,pageNum,pageSize);
    }

    @Override
    public Manager addManager(Manager manager) {
       return managerDao.addManager(manager);
    }

    @Override
    public Manager getManagerUpdateId(int mId) {
        return managerDao.getManagerUpdateId(mId);
    }

    @Override
    public Manager updateManager(Manager manager) {
       return managerDao.updateManager(manager);
    }

    @Override
    public void delManager(int mId) {
        managerDao.delManager(mId);
    }

    @Override
    public int delBatchesManager(Integer[] sids) {
       return managerDao.delBatchesManager(sids);
    }


}
