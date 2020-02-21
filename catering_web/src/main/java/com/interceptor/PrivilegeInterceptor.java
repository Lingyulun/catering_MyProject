package com.interceptor;

import com.entity.Menu;
import com.entity.RoleEntity;
import com.entity.User;
import com.service.RoleService;
import com.service.UserSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

@Component
public class PrivilegeInterceptor implements HandlerInterceptor {
   /* @Autowired
    private UserSerivce userService ;

    @Autowired
    private RoleService roleService ;
    private String loginUrl = "/login";


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        HttpSession session = request.getSession();


        User user = (User) session.getAttribute("user");
        if(user==null) {
            response.sendRedirect(loginUrl);
            return false;
        }


       RoleEntity role = userService.getUserRole(user.getId());
        List<Menu> privileges = roleService.getRolePrivilege(role.getId());


        String requestUri = getRequestUrl(request);
        List<String> list = getprivilege(privileges);

        if(isAllowd(list, requestUri)) {
            return true;
        }else {
            response.sendRedirect("/unauthorized");
            return false;
        }
    }





    public boolean isAllowd(List<String> list,String requestUri) {
        boolean isAllowd = false;
        for(String allowList:list) {
            if(allowList.equals(requestUri)) {
                isAllowd=true;
                break;
            }
        }
        return isAllowd;
    }




    public List<String> getprivilege(List<Menu> privileges){
        Set<String> set = new TreeSet<String>();
        for(Menu privilege:privileges) {
            String[] uris = privilege.getUri().trim().split(",");
            if(uris!=null) {
                for(String uri:uris) {
                    set.add(uri);
                }
            }
        }
        return new ArrayList<>(set);
    }


    public String getRequestUrl(HttpServletRequest request) {
        String context = request.getContextPath();
        String requestUri =  request.getRequestURI();
        String result = requestUri.substring(context.length());
        return result;
    }*/
}
