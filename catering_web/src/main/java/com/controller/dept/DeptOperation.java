package com.controller.dept;

import com.entity.Dept;
import com.entity.ProductType;
import com.github.pagehelper.PageInfo;
import com.service.DepetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

/**
 * @author 挥霍的人生
 */
@Controller
@RequestMapping("/dept")
public class DeptOperation {
    @Autowired
    private DepetService depetService;
    @RequestMapping("/listAll")
    public String listDept(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize",required = false,defaultValue = "2") int pageSize, Model model){
        List<Dept> depts=depetService.getDeptpage(pageNum, pageSize);
        PageInfo pageInfo=new PageInfo(depts);
        model.addAttribute("dept",pageInfo);
        return "dept/list";
    }
    @RequestMapping("/insert")
    public String insert(@Valid Dept dept,
                         BindingResult bindingResult){
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            return "error";
        }
        depetService.insertDept(dept);
        return "redirect:/dept/listAll";
    }
    @RequestMapping("/delete")
    public String deleteDep(int deptId) {
        depetService.deleteDeptId(deptId);
        return "redirect:/dept/listAll";
    }

    @RequestMapping("/update")
    public String update(@Valid Dept dept,
                         BindingResult bindingResult) {
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            return "error";
        }
        depetService.updateDept(dept);
        return "redirect:/dept/listAll";
    }
}
