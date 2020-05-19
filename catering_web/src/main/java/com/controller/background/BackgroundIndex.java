package com.controller.background;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 挥霍的人生
 */
@Controller
public class BackgroundIndex {
    @RequestMapping("/index")
    public String index(){
        return "index";
    }
    @RequestMapping("/index2")
    public String index2(){
        return "index2";
    }

}
