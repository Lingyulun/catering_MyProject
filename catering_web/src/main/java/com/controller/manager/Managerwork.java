package com.controller.manager;

import com.entity.Employee;
import com.entity.Manager;
import com.entity.RoleEntity;
import com.github.pagehelper.PageInfo;
import com.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

/**
 * @author 挥霍的人生
 */
@Controller
@RequestMapping("/managers")
public class Managerwork {
    @Autowired
    private ManagerService managerService;
    //查询所有分页
    @RequestMapping("/listAll")
    public String listManager(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize,Model model){
        List<Manager> managers=managerService.getAllManager(pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(managers);
        model.addAttribute("managers",pageInfo);
        model.addAttribute("roles",new RoleEntity());
        return "manager/managerlist";
    }
    //查询用户名
    @RequestMapping("/listAllmName")
    public String listManagermName(@RequestParam(value = "mName",required = false) String mName,
                                   @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                                   @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize,Model model){
        List<Manager> managers=managerService.getmNameManager(mName,pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(managers);
        model.addAttribute("managers",pageInfo);
        return "manager/managerlist";
    }

    //跳转到添加页面
    @RequestMapping("/addView")
    public String addView(){
        return "manager/manageradd";
    }
    //添加数据
    @ResponseBody
    @RequestMapping("/add")
    public Manager insert(@Valid Manager manager){
        return managerService.addManager(manager);
    }

    //删除数据
    @RequestMapping("/delete")
    public String deleteManager(int MId) {
        managerService.delManager(MId);
        return "redirect:/managers/listAll";
    }
    @RequestMapping("/getUpdateManagerId")
    public ModelAndView getManagerUpdateId(int mId){
        ModelAndView modelAndView=new ModelAndView();
        Manager manager=managerService.getManagerUpdateId(mId);
        modelAndView.addObject("managerUpdateId",manager);
        modelAndView.setViewName("/manager/managerupdate");
        return modelAndView;
    }
    @RequestMapping("/update")
    @ResponseBody
    public Manager update(@Valid Manager manager) {
        return managerService.updateManager(manager);
    }
    //批量删除
    @RequestMapping("/delBatchesManager")
    @ResponseBody
    public int delBatchesManagerID(@RequestParam(value = "sids[]") Integer[] sids) {
        managerService.delBatchesManager(sids);
        return sids.length;
    }
}
