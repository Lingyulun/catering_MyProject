package com.controller.Role;

import com.entity.Menu;
import com.entity.RoleEntity;
import com.service.MenuService;
import com.service.PrivilegeService;
import com.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 挥霍的人生
 */
@Controller
public class RolePrivilegeInsertController {
    @Autowired
    private PrivilegeService privilegeService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    @RequestMapping("/admin/role-privilege/inser")
    @ResponseBody
    protected Object service(String[] privilege_id,String role_id) {

        RoleEntity role = roleService.findRole(role_id);

        List<Menu> list = new ArrayList<Menu>();
        for(String pid:privilege_id) {
            Menu privilege = menuService.findMenuById(pid);
            list.add(privilege);
        }

        privilegeService.updateRolePrivilege(role,list);
        return true;

    }
}
