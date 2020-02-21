package com.controller.privilege;

import com.entity.Menu;
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
public class PrivilegeListServlet {
    @Autowired
    private PrivilegeService privilegeService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    @RequestMapping("/admin/privilege/list")
    @ResponseBody
    protected List<Map<String,Object>> service(String roleId)  {

        List<Map<String,Object>> jsonArray = new ArrayList<Map<String,Object>>();

        List<Menu> list = menuService.getAllMenus();

        List<Menu> rolePrivilege = roleService.getRolePrivilege(roleId);


        for(Menu p:list) {
            Map<String, Object> jsonObject = new HashMap<String, Object>();
            jsonObject.put("id", p.getId());
            jsonObject.put("pId", p.getPid());
            jsonObject.put("name", p.getName());
            jsonObject.put("open","true");
            for(Menu r:rolePrivilege) {
                if(p.getId().equals(r.getId())) {
                    jsonObject.put("checked","true");
                }
            }
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }
}
