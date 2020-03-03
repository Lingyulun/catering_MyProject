package com.dao;

import com.entity.Manager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ManagerDao {
    List<Manager> getAllManager(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize);
    List<Manager> getmNameManager(@Param("mName") String mName,@Param("pageNum")int pageNum,@Param("pageSize") int pageSize);
    Manager addManager(Manager manager);
    void updateManager(Manager manager);
    void delManager(int mId);
    int delBatchesManager(Integer[] sids);
}
