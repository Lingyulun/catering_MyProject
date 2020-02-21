package com.controller.backstage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 挥霍的人生
 */
@Controller
public class BackstageIndex {
    @RequestMapping("/backstage")
    public String backstage(){
        return "backstage/background/classificationManagement";
    }
}
