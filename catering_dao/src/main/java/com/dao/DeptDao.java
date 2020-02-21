package com.dao;

import com.entity.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptDao {
    List<Dept> getDeptpage(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    void insertDept(Dept dept);
    void deleteDeptId(int deptId);
    void updateDept(Dept dept);

}
