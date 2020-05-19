package com.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 挥霍的人生
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
   /* private String id;
    private String username;
    private String password;
    private String name;//角色*/

    private int mId;// 编号
    private String mName;//姓名
    private String  mPhone;//电话
    private String mUsername;//用户名
    private String  mPassword;//密码
    private int role;
    private String name;  //角色
}
