package com.controller.employee;

import com.entity.Dept;
import com.entity.Employee;
import com.github.pagehelper.PageInfo;
import com.service.DepetService;
import com.service.EmployeeService;
import com.service.Impl.EmployeeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sun.invoke.empty.Empty;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * @author 挥霍的人生
 */
@Controller
@RequestMapping("/catering")
public class EmployeeListController {
    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepetService deptService;

    @RequestMapping("/list")
    public String listAll2(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                          @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize, Model model){
        List<Employee> employees=employeeService.getAll(pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(employees);
        model.addAttribute("page",pageInfo);
        return "Employee/list";
    }

    @RequestMapping("/listEmployee")
    public String list(@RequestParam(value = "edegindate",defaultValue = "null",required = false) String edegindate,
                       @RequestParam(value = "ename",defaultValue = "null",required = false) String ename,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize",required = false,defaultValue = "20") int pageSize, Model model){
        System.out.println(edegindate);
        List<Employee> employees=employeeService.getFuzzQueryEmployee(edegindate,ename,pageNum, pageSize);

        PageInfo pageInfo=new PageInfo(employees);
        model.addAttribute("page",pageInfo);
        return "Employee/list";
    }




    @RequestMapping("/addView")
    public ModelAndView insert(){
        ModelAndView modelAndView=new ModelAndView();
        List<Dept> deptList=deptService.getInsertQuery();
        modelAndView.addObject("deptsInsert",deptList);
        modelAndView.setViewName("Employee/insert");
        return modelAndView;
    }
    @ResponseBody
    @RequestMapping("/insert")
    public String insert(@Valid Employee employeeEntity) {
        employeeService.insertEmp(employeeEntity);
        return "redirect:/catering/list";
    }
    @RequestMapping("/update")
    @ResponseBody
    public void update(@Valid Employee employeeEntity,
                         BindingResult bindingResult) {
        ModelAndView modelAndView=new ModelAndView();
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            //return "Employee/update";
           modelAndView.setViewName("Employee/update");
        }
        employeeService.updateEmp(employeeEntity);
    }
    /*得到修改的Id*/
    @RequestMapping("/getById")
    public ModelAndView getById(int eid){
        ModelAndView modelAndView=new ModelAndView();
        Employee employee=employeeService.getById(eid);
        modelAndView.addObject("employee",employee);

        List<Dept> depts=deptService.getInsertQuery();
        modelAndView.addObject("depts",depts);

        modelAndView.setViewName("Employee/update");
        return modelAndView;
    }
    @RequestMapping("/deleteEmp")
    public String deleteEmp(int eid) {
        employeeService.deleteEmp(eid);
        return "redirect:/catering/list";
    }
    //批量删除
    @RequestMapping("/delBatchesEmployee")
    @ResponseBody
    public boolean delBatchesEmployeeId(@RequestParam(value = "eids[]") Integer[] eids) {
        boolean b= employeeService.delAllEmployee(eids);
        if(b){
            System.out.println("delete success");
        }else{
            System.out.println("delete failed");
        }
        return false;
    }



}
