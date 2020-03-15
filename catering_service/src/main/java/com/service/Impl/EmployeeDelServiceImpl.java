package com.service.Impl;

import com.dao.EmployeeDelDao;
import com.entity.EmployeeDel;
import com.service.EmployeeDelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Service
public class EmployeeDelServiceImpl implements EmployeeDelService {
    @Autowired
    private EmployeeDelDao employeeDelDao;
    @Override
    public List<EmployeeDel> getAllEmployeeDels(int pageNum, int pageSize) {
        return employeeDelDao.getAllEmployeeDels(pageNum, pageSize);
    }

    @Override
    public void insertEmpDel(EmployeeDel employeeDel) {
        employeeDelDao.insertEmpDel(employeeDel);
    }

    @Override
    public void deleteEmpDel(int edid) {
        employeeDelDao.deleteEmpDel(edid);
    }
}
