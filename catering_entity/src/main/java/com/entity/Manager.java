package com.entity;

import lombok.Data;

import java.util.List;

/**
 * @author 挥霍的人生
 * 管理员表实体类
 */
@Data
public class Manager {
  private int mId;// 编号
  private String mName;//姓名
  private String  mPhone;//电话
  private String mUsername;//用户名
  private String  mPassword;//密码
  private String name;  //角色
}
