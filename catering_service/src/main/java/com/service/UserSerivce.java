package com.service;

import com.entity.User;
import com.entity.RoleEntity;
import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserSerivce {
    //boolean addUser(User user);
    //User findUser(String id);
    //List<User> getAllUser();
    //RoleEntity getUserRole(String userId);
    //void updateRole(User user, String roleId);
    //User findUser(String userName, String password);


    List<User> LoginAll(String mUsername, String password);
    List<User> getAllUser(int pageNum,int pageSize);
    List<User> getmNameUser(String mName,int pageNum,int pageSize);
    User addUser(User User);
    //修改前得到当前id的所有信息
    User getUserUpdateId(int mId);
    User updateUser(User User);
    void delUser(int mId);
    /*批量删除*/
    int delBatchesUser(Integer[] sids);



}
