package com.service;

import com.entity.Employee;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface EmployeeService {
    //查询所有员工信息并分页
    List<Employee> getAll(int pageNum, int pageSize);
    //模糊查询员工信息
    List<Employee> getEmployeeInfo(String ename,int pageNum,int pageSize);
    void insertEmp(Employee employee);
    void updateEmp(Employee employee);
    Employee getById(int eid);
    void deleteEmp(int eid);
}
