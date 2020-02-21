package com.controller.producttype;

import com.entity.ProductType;
import com.github.pagehelper.PageInfo;
import com.service.ProductService;
import com.service.ProductTypeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

/**
 * @author 挥霍的人生
 */
@Controller
@RequestMapping("/ProductTypeLocation")
public class ProductTypeController {
    @Autowired
    private ProductTypeService productTypeService;

    @Autowired
    private ProductService productService;
    @RequestMapping("/list")
    public String listAll(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                          @RequestParam(value = "pageSize",required = false,defaultValue = "3") int pageSize, Model model){
        List<ProductType> productTypes=productTypeService.getAllProductType(pageNum,pageSize);
        PageInfo pageInfo=new PageInfo(productTypes);
        model.addAttribute("pageType",pageInfo);
        return "ProductType/listAll";
    }
    @RequestMapping("/deleteProductTypeId")
    public String deleteType(int tid,Model model){
        int count=productService.getCount(tid);
        System.out.println(count);
        if(count==1){
            //事务删除
            productTypeService.deleteTypeAndProductIdTX(tid);
            return "redirect:/ProductTypeLocation/list";
        }else {
           model.addAttribute("msg","产品还有未销售,不能删除");
           return "error";
        }
    }
    @RequestMapping("/update")
    public String update(@Valid ProductType productType,
                         BindingResult bindingResult) {
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            return "error";
        }
        productTypeService.updateType(productType);
        return "redirect:/ProductTypeLocation/list";
    }

    @RequestMapping("/insert")
    public String insert(@Valid ProductType productType,
                         BindingResult bindingResult){
        /*绑定数据结果*/
        if(bindingResult.hasErrors()){
            return "error";
        }
        productTypeService.insertProductType(productType);
        return "redirect:/ProductTypeLocation/list";
    }
}
