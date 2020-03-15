package com.entity;

import lombok.Data;

/**
 * @author 挥霍的人生
 */
@Data
public class EmployeeDel {
    private int edid;//员工编号
    private String edname;    //姓名
    private String edgender;//性别
    private String edidcard; //身份证号
    private String edphone;    //电话号码
    private String edaddress; //联系地址
    private String eddeptid; //所属部门
    private String edjodlevelid; //职称
    private String eddegindate;    //入职日期
}
