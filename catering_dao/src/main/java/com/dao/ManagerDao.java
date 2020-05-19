package com.dao;

import com.entity.Manager;
import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ManagerDao {

  /*  List<Manager> LoginAll(@Param("mUsername") String mUsername, @Param("mPassword") String mPassword);

    List<Manager> getAllManager(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize);
    //查询用户名
    List<Manager> getmNameManager(@Param("mName") String mName,@Param("pageNum")int pageNum,@Param("pageSize") int pageSize);

    Manager addManager(Manager manager);

    //修改前查询得到当前行id的信息
    Manager getManagerUpdateId(int mId);
    Manager updateManager(Manager manager);
    //删除
    void delManager(int mId);
    //批量删除数据
    int delBatchesManager(Integer[] sids);*/
}
