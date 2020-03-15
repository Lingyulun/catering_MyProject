package com.dao;

import com.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface EmployeeDao {
    List<Employee> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    //    模糊查询员工信息
    List<Employee> getFuzzQueryEmployee(@Param("edegindate")String edegindate,@Param("ename") String ename, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    List<Employee> getFuzzDateEmployee(@Param("edegindate")String edegindate,@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    List<Employee> getFuzzNameEmployee(@Param("ename") String ename, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);



    void insertEmp(Employee employee);
    void updateEmp(Employee employee);
    Employee getById(int eid);
    void deleteEmp(int eid);
    int delAllEmployee(Integer[] eids);
}
