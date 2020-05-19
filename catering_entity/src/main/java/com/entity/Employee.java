package com.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author 挥霍的人生
 * 员工
 */
@Data
public class Employee {
    private int eid;//员工编号
    private String ename;    //姓名
    private String egender;//性别
    private String eidcard; //身份证号
    private String ephone;    //电话号码
    private String eaddress; //联系地址
    private int edeptid; //部门id
    private String edeptname; //所属部门
    private String ejodlevelid; //职称
    private String edegindate;    //入职日期
}
