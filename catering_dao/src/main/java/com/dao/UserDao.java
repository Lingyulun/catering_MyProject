package com.dao;

import com.entity.Manager;
import com.entity.RoleEntity;
import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
   /* boolean addUser(User user);

    User findUser(String id);

    List<User> getAll();

    RoleEntity getRoles(String userId);

    void updateRole(User user, String roleId);

    User findUserByUsernameAndPassword(@Param("username") String userName, @Param("password") String password);

    void deleteRolesByUserId(String userId);

    void insertUserRole(@Param("userId") String userId, @Param("roleId") String roleId);
*/



    List<User> LoginAll(@Param("mUsername") String mUsername, @Param("mPassword") String mPassword);

    List<User> getAllManager(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize);
    //查询用户名
    List<User> getmNameManager(@Param("mName") String mName,@Param("pageNum")int pageNum,@Param("pageSize") int pageSize);

    User addManager(User manager);

    //修改前查询得到当前行id的信息
    User getManagerUpdateId(int mId);
    User updateManager(User manager);
    //删除
    void delManager(int mId);
    //批量删除数据
    int delBatchesManager(Integer[] sids);

}
