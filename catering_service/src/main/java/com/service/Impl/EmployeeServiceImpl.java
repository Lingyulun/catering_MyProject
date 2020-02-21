package com.service.Impl;

import com.dao.EmployeeDao;
import com.entity.Employee;
import com.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeDao employeeDao;

    //得到员工信息

    @Override
    public List<Employee> getAll(int pageNum, int pageSize) {
        return employeeDao.getAll(pageNum, pageSize);
    }

    //模糊查询员工信息

    @Override
    public List<Employee> getEmployeeInfo(String ename,int pageNum,int pageSize) {
        return employeeDao.getEmployeeInfo(ename,pageNum,pageSize);
    }

    //添加员工

    @Override
    public void insertEmp(Employee employee) {
        employeeDao.insertEmp(employee);
    }

    //修改员工信息

    @Override
    public void updateEmp(Employee employee) {
        employeeDao.updateEmp(employee);
    }

    //得到所要修改员工信息的id及其信息

    @Override
    public Employee getById(int eid) {
        return employeeDao.getById(eid);
    }

    //删除员工信息

    @Override
    public void deleteEmp(int eid) {
        employeeDao.deleteEmp(eid);
    }
}
