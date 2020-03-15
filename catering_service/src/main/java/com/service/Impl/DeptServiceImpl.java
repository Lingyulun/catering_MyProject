package com.service.Impl;

import com.dao.DeptDao;
import com.entity.Dept;
import com.service.DepetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Service
public class DeptServiceImpl implements DepetService {
    @Autowired
    private DeptDao deptDao;

    @Override
    public List<Dept> getDeptpage(int pageNum, int pageSize) {
        return deptDao.getDeptpage(pageNum, pageSize);
    }

    @Override
    public void insertDept(Dept dept) {
        deptDao.insertDept(dept);
    }

    @Override
    public void deleteDeptId(int deptId) {
        deptDao.deleteDeptId(deptId);
    }

    @Override
    public void updateDept(Dept dept) {
        deptDao.updateDept(dept);
    }

    //员工添加界面，填充部门添加的下拉框
    @Override
    public List<Dept> getInsertQuery() {
        return deptDao.getInsertQuery();
    }
}
