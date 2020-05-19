package com.dao;

import com.entity.client;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface ClientInfoDao {
    List<client> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    client getUserInfoUid(int uid);
    Boolean insertUserInfo(client client);
    Boolean updateUserInfo(client client);
    Boolean deleteUserInfo(int uid);
}
