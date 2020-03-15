package com.service;

import com.entity.EmployeeDel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDelService {
    List<EmployeeDel> getAllEmployeeDels(@Param("pageNum") int pageNum, @Param("pageNum")int pageSize);
    void insertEmpDel(EmployeeDel employeeDel);
    void deleteEmpDel(int edid);
}
