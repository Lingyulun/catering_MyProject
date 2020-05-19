package com.service;

import com.entity.client;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface clientService {
    List<client> getAll(int pageNum, int pageSize);
    client getUserInfoUid(int uid);
    Boolean insertUserInfo(client client);
    Boolean updateUserInfo(client client);
    Boolean deleteUserInfo(int uid);
}
