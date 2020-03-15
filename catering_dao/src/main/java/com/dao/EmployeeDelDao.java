package com.dao;

import com.entity.EmployeeDel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface EmployeeDelDao {
    /*查询被删除的员工信息*/
    List<EmployeeDel> getAllEmployeeDels(@Param("pageNum") int pageNum, @Param("pageNum")int pageSize);
    void insertEmpDel(EmployeeDel employeeDel);
    void deleteEmpDel(int edid);
}
