package com.service.Impl;

import com.dao.UserInfoDao;
import com.entity.UserInfo;
import com.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * @author 挥霍的人生
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    private UserInfoDao userInfoDao;
    @Override
    public List<UserInfo> getAll(int pageNum, int pageSize) {
        return userInfoDao.getAll(pageNum,pageSize);
    }

    @Override
    public UserInfo getUserInfoUid(int uid) {
        return userInfoDao.getUserInfoUid(uid);
    }

    @Override
    public Boolean insertUserInfo(UserInfo userInfo) {
        return userInfoDao.insertUserInfo(userInfo);
    }

    @Override
    public Boolean updateUserInfo(UserInfo userInfo) {
        return userInfoDao.updateUserInfo(userInfo);
    }

    @Override
    public Boolean deleteUserInfo(int uid) {
        return userInfoDao.deleteUserInfo(uid);
    }
}
