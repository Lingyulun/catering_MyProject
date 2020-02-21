package com.controller.user;

import com.entity.RoleEntity;
import com.entity.User;
import com.service.RoleService;
import com.service.UserRoleService;
import com.service.UserSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Controller
public class UserListServlet {
    @Autowired
    private UserSerivce userSerivce;

    @Autowired
    private RoleService roleService;

    @RequestMapping("/user/list")
    public String service(Model model){

        List<User> allUser = userSerivce.getAllUser();
        List<RoleEntity> roles = roleService.getAllRole();

        model.addAttribute("roles", roles);
        model.addAttribute("allUser", allUser);
        return "user/userList";
    }
    @RequestMapping("/userInsert")
    public void insertUser(String username,String password,String roleId){
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        userSerivce.addUser(user);

        User u =userSerivce.findUser(username,password);
        userSerivce.updateRole(u,roleId);
    }


}
