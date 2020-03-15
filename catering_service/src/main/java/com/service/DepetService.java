package com.service;

import com.entity.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface DepetService {
    List<Dept> getDeptpage(int pageNum,int pageSize);
    void insertDept(Dept dept);
    void deleteDeptId(int deptId);
    void updateDept(Dept dept);

    //填充到员工界面部门的下拉框
    List<Dept> getInsertQuery();
}
