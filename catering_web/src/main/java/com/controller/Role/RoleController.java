package com.controller.Role;

import com.entity.RoleEntity;
import com.service.RoleService;
import com.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
/**
 * @author 挥霍的人生
 */
@Controller
public class RoleController {
    @Autowired
    private RoleService roleService;

    @RequestMapping("/role/list")
    public String service(Model model) {
        List<RoleEntity> role = roleService.getAllRole();
        model.addAttribute("role", role);
        return "Role/list";
    }
}
