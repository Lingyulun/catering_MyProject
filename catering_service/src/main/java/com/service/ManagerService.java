package com.service;

import com.entity.Manager;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface ManagerService {
    List<Manager> getAllManager(int pageNum,int pageSize);
    List<Manager> getmNameManager(String mName,int pageNum,int pageSize);
    Manager addManager(Manager manager);
    void updateManager(Manager manager);
    void delManager(int mId);
    /*批量删除*/
   int delBatchesManager(Integer[] sids);
}
