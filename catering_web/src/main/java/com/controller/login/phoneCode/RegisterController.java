package com.controller.login.phoneCode;

import com.entity.Employee;
import com.entity.Manager;
import com.entity.User;
import com.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

/**
 * @author 挥霍的人生
 */
@Controller
public class RegisterController {

    @Autowired
    private LoginService loginService;
    @RequestMapping("/background/register")
    public String register(){
        return "backgroundRegister";
    }

    @RequestMapping("/background/register-Manager")
    public String insert(@Valid User user,
                         BindingResult bindingResult) {
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            return "error";
        }
        loginService.insertUser(user);
        return "redirect:/background/register";
    }
}
