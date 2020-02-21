package com.service;

import com.entity.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepetService {
    List<Dept> getDeptpage(int pageNum,int pageSize);
    void insertDept(Dept dept);
    void deleteDeptId(int deptId);
    void updateDept(Dept dept);
}
