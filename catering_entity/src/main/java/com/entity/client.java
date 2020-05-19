package com.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author 挥霍的人生
 */
//客户表
@Data
public class client {
    private int uid;
    private String username;
    private String ubirthday;
    private String uage;
    private String uphone;
    private String uaddress;
    private String usex;
}
