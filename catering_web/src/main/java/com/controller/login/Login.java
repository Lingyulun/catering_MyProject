package com.controller.login;

import com.entity.Manager;
import com.entity.User;
import com.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 挥霍的人生
 */
@Controller
@RequestMapping("/background")
public class Login {
    @Autowired
    private LoginService loginService;
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/loginManager")
   public String doLogin(String username, String password,String txtCode,HttpSession session){
        List<User> managers=loginService.LoginAll(username, password);
        for (User user : managers) {
            if(user.getUsername().equals(username) && user.getPassword().equals(password) && session.getAttribute("code").equals(txtCode)){
                System.out.println(username);
                System.out.println(password);
                session.setAttribute("username",username);
                session.setAttribute("password",password);
                return "index";
            }else {
                System.out.println("用户不存在");
            }
        }
        return "login";
   }
   @RequestMapping("/error")
    public String error(){
       return "error";
   }
}
