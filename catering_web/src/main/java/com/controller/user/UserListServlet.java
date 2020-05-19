package com.controller.user;

import com.entity.User;
import com.entity.RoleEntity;
import com.entity.User;
import com.github.pagehelper.PageInfo;
import com.service.RoleService;
import com.service.UserRoleService;
import com.service.UserSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

/**
 * @author 挥霍的人生
 */
@Controller
@RequestMapping("/managers")
public class UserListServlet {
    /*@Autowired
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
    }*/


    @Autowired
    private UserSerivce UserService;

    //登录
    @RequestMapping("/loginUser")
    public String doLogin(String mUsername, String mPassword, String txtCode, HttpSession session){
        List<User> Users=UserService.LoginAll(mUsername,mPassword);
        for (User login : Users) {
            if(login.getMUsername().equals(mUsername) && login.getMPassword().equals(mPassword) && session.getAttribute("code").equals(txtCode)){
                System.out.println(mUsername);
                System.out.println(mPassword);
                session.setAttribute("mUsername",mUsername);
                session.setAttribute("mPassword",mPassword);
                return "index";
            }else {
                System.out.println("用户不存在");
            }
        }
        return "login";
    }

    //查询所有分页
    @RequestMapping("/listAll")
    public String listUser(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                              @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize,Model model){
        List<User> Users=UserService.getAllUser(pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(Users);
        model.addAttribute("managers",pageInfo);
        model.addAttribute("roles",new RoleEntity());
        return "manager/managerlist";
    }
    //查询用户名
    @RequestMapping("/listAllmName")
    public String listUsermName(@RequestParam(value = "mName",required = false) String mName,
                                   @RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                                   @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize,Model model){
        List<User> Users=UserService.getmNameUser(mName,pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(Users);
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
    public User insert(@Valid User User){
        return UserService.addUser(User);
    }

    //删除数据
    @RequestMapping("/delete")
    public String deleteUser(int MId) {
        UserService.delUser(MId);
        return "redirect:/managers/listAll";
    }
    @RequestMapping("/getUpdateUserId")
    public ModelAndView getUserUpdateId(int mId){
        ModelAndView modelAndView=new ModelAndView();
        User User=UserService.getUserUpdateId(mId);
        modelAndView.addObject("managerUpdateId",User);
        modelAndView.setViewName("/manager/managerupdate");
        return modelAndView;
    }
    @RequestMapping("/update")
    @ResponseBody
    public User update(@Valid User User) {
        return UserService.updateUser(User);
    }
    //批量删除
    @RequestMapping("/delBatchesUser")
    @ResponseBody
    public int delBatchesUserID(@RequestParam(value = "sids[]") Integer[] sids) {
        UserService.delBatchesUser(sids);
        return sids.length;
    }

}
