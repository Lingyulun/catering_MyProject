package com.controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 挥霍的人生
 */
@Controller
public class TestController {
    @RequestMapping("/test")
    public String to(){
        return "beforeshowIndex";
    }
}
