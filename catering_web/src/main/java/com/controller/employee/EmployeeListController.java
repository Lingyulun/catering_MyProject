package com.controller.employee;

import com.entity.Employee;
import com.github.pagehelper.PageInfo;
import com.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

/**
 * @author 挥霍的人生
 */
@Controller
@RequestMapping("/catering")
public class EmployeeListController {
    @Autowired
    private EmployeeService employeeService;
    @RequestMapping("/list")
    public String listAll(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                          @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize, Model model){
        List<Employee> employees=employeeService.getAll(pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(employees);
        model.addAttribute("page",pageInfo);
        return "Employee/list";
    }


    @RequestMapping("/list2")
    public String listAll2(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                          @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize, Model model){
        List<Employee> employees=employeeService.getAll(pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(employees);
        model.addAttribute("page",pageInfo);
        return "Employee/list2";
    }

    @RequestMapping("/listEmployee")
    public String list(@RequestParam(value = "ename",required = false) String ename,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                        @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize, Model model){
        List<Employee> employees=employeeService.getEmployeeInfo(ename,pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(employees);
        model.addAttribute("page",pageInfo);
        return "Employee/list";
    }
    @RequestMapping("/insert")
    public String insert(@Valid Employee employeeEntity,
                         BindingResult bindingResult) {
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            return "Employee/insert";
        }
        employeeService.insertEmp(employeeEntity);
        return "redirect:/catering/list";
    }
    // 跳转到后台界面
    @RequestMapping("/index")
    public String index(){
        return "backgroundIndex";
    }
    @RequestMapping("/addView")
    public String insert(){
        return "Employee/insert";
    }

    @RequestMapping("/updateView")
    public String update(){
        return "Employee/update";
    }
    @RequestMapping("/update")
    public String update(@Valid Employee employeeEntity,
                         BindingResult bindingResult) {
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            return "Employee/update";
        }
        employeeService.updateEmp(employeeEntity);
        return "redirect:/catering/list2";
    }
    /*得到修改的Id*/
    @RequestMapping("/getById")
    public ModelAndView getById(int eid){
        ModelAndView modelAndView=new ModelAndView();
        Employee employee=employeeService.getById(eid);
        modelAndView.addObject("employee",employee);
        modelAndView.setViewName("Employee/update");
        return modelAndView;
    }
    @RequestMapping("/deleteEmp")
    public String deleteEmp(int eid) {
        employeeService.deleteEmp(eid);
        return "redirect:/catering/list";
    }
}
