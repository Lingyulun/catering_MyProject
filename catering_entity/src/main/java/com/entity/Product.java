package com.entity;

import lombok.Data;

import java.math.BigDecimal;
/**
 * @author 挥霍的人生
 */

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


    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname==null?null:pname.trim();
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }

    public int getPtype() {
        return ptype;
    }

    public void setPtype(int ptype) {
        this.ptype = ptype;
    }

    public BigDecimal getPsalary() {
        return psalary;
    }

    public void setPsalary(BigDecimal psalary) {
        this.psalary = psalary;
    }

    public int getPcount() {
        return pcount;
    }

    public void setPcount(int pcount) {
        this.pcount = pcount;
    }
}
