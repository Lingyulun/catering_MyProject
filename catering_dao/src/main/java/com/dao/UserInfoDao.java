package com.dao;

import com.entity.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface UserInfoDao {
    List<UserInfo> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    UserInfo getUserInfoUid(int uid);
    Boolean insertUserInfo(UserInfo userInfo);
    Boolean updateUserInfo(UserInfo userInfo);
    Boolean deleteUserInfo(int uid);
}
