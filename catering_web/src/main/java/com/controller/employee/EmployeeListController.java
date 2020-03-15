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
    public String list(@RequestParam(value = "edegindate",defaultValue = "null",required = false) String edegindate,
                       @RequestParam(value = "ename",defaultValue = "null",required = false) String ename,
                       @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize",required = false,defaultValue = "100") int pageSize, Model model){
        List<Employee> employees=employeeService.getFuzzQueryEmployee(edegindate,ename,pageNum, pageSize);
        PageInfo pageInfo=new PageInfo(employees);
        model.addAttribute("page",pageInfo);
        return "Employee/list2";
    }
    @RequestMapping("/addView")
    public String insert(){

        return "Employee/insert";
    }
    @ResponseBody
    @RequestMapping("/insert")
    public String insert(@Valid Employee employeeEntity) {
        employeeService.insertEmp(employeeEntity);
        return "redirect:/catering/list";
    }
    // 跳转到后台界面
    @RequestMapping("/index")
    public String index(){
        return "backgroundIndex";
    }

    //填充到下拉框，选中对应修改的部门
    @RequestMapping("/updateView")
    public String update(){
        ModelAndView model=new ModelAndView();
        List<Dept> depts=deptService.getInsertQuery();
        model.addObject("depts",depts);
        model.addObject("employees",new Employee());
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
    //批量删除
    @RequestMapping("/delBatchesEmployee")
    @ResponseBody
    public int delBatchesEmployeeId(@RequestParam(value = "eids[]") Integer[] eids) {
       employeeService.delAllEmployee(eids);
       return eids.length;
    }
}
