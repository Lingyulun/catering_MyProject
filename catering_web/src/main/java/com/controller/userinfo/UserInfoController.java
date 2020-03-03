package com.controller.userinfo;

import com.entity.Employee;
import com.entity.UserInfo;
import com.github.pagehelper.PageInfo;
import com.service.UserInfoService;
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
@RequestMapping("/user")
public class UserInfoController {
    @Autowired
    private UserInfoService userInfoService;
    @RequestMapping("/userInfoAll")
    public String userInfoAll(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                              @RequestParam(value = "pageSize",required = false,defaultValue = "2") int pageSize, Model model){
        List<UserInfo> userInfos=userInfoService.getAll(pageNum, pageSize);
        PageInfo pageInfo=new PageInfo(userInfos);
        model.addAttribute("pageUserInfoAll",pageInfo);
        return "userInfo/userInfolistAll";
    }
    @RequestMapping("/insertView")
    public String insertView(){
        return "userInfo/insert";
    }
    @RequestMapping("/insert")
    public String insert(@Valid UserInfo userInfo,
                         BindingResult bindingResult) {
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            return "userInfo/insert";
        }
        userInfoService.insertUserInfo(userInfo);
        return "redirect:/user/userInfoAll";
    }
    @RequestMapping("/delete")
    public String deleteUserInfoId(int uid){
        userInfoService.deleteUserInfo(uid);
        return "redirect:/user/userInfoAll";
    }

    @RequestMapping("/update")
    public String update(@Valid UserInfo userInfo,
                         BindingResult bindingResult) {
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            return "userInfo/update";
        }
        userInfoService.updateUserInfo(userInfo);
        return "redirect:/user/userInfoAll";
    }

    /*得到修改的Id*/
    @RequestMapping("/getById")
    public String getById(int uid,Model model){
        UserInfo userInfo=userInfoService.getUserInfoUid(uid);
        model.addAttribute("userInfoById",userInfo);
        return "userInfo/update";
    }
}
