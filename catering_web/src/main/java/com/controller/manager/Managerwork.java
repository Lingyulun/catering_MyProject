package com.controller.manager;

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
    @RequestMapping("/listAll")
    public String listManager(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize,Model model){
        List<Manager> managers=managerService.getAllManager(pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(managers);
        model.addAttribute("managers",pageInfo);
        model.addAttribute("roles",new RoleEntity());
        return "manager/managerlist";
    }
    @RequestMapping("/listAllmName")
    public String listManagermName(@RequestParam(value = "mName",required = false) String mName,
                                   @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                                   @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize,Model model){
        List<Manager> managers=managerService.getmNameManager(mName,pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(managers);
        model.addAttribute("managers",pageInfo);
        return "manager/managerlist";
    }


    @RequestMapping("/addView")
    public String addView(){
        return "manager/manageradd";
    }
    @ResponseBody
    @RequestMapping("/add")
    public Manager insert(@Valid Manager manager){
        return  managerService.addManager(manager);
    }
    @RequestMapping("/delete")
    public String deleteManager(int MId) {
        managerService.delManager(MId);
        return "redirect:/managers/listAll";
    }

    @RequestMapping("/update")
    public String update(@Valid Manager manager,
                         BindingResult bindingResult) {
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            return "error";
        }
        managerService.updateManager(manager);
        return "redirect:/managers/listAll";
    }
    @RequestMapping("/delBatchesManager")
    @ResponseBody
    public int test1(@RequestParam(value = "sids[]") Integer[] sids) {
        managerService.delBatchesManager(sids);
        return sids.length;
    }
}
