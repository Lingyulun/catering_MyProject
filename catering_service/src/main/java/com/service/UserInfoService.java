package com.service;

import com.entity.UserInfo;
import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface UserInfoService {
    List<UserInfo> getAll(int pageNum, int pageSize);
    UserInfo getUserInfoUid(int uid);
    Boolean insertUserInfo(UserInfo userInfo);
    Boolean updateUserInfo(UserInfo userInfo);
    Boolean deleteUserInfo(int uid);
}
