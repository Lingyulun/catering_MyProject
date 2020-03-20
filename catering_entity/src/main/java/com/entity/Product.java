package com.entity;

import lombok.Data;

import java.math.BigDecimal;
/**
 * @author 挥霍的人生
 */
@Data
public class Product {
    //编号
    private int pid;
    //名字
    private String pname;
    //介绍
    private String pdesc;
    //图片
    private String pimage;
    //类型
    private int ptype;
    //价格
    private BigDecimal psalary;
    //数量
    private int pcount;

}
