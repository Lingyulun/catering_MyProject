package com.controller.before;

import com.entity.Product;
import com.entity.ProductCategoryVo;
import com.entity.ProductType;
import com.github.pagehelper.PageInfo;
import com.service.ProductService;
import com.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 挥霍的人生
 */
@Controller
public class BeforeController {
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductTypeService productTypeService;

    @RequestMapping("/beforeIndexView")
    public String beforeIndexView(){
        return "before/index";
    }
    @RequestMapping("/beforeInfo")
    public String beforeInfo(@RequestParam(value = "ptype",required = false,defaultValue = "1") int ptype, @RequestParam(value = "pageNum",required = false,defaultValue="1") int pageNum,
                             @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize, Model model){
        List<Product> products=productService.getProductAll(ptype,pageNum,pageSize);
        List<ProductType> productTypes=productTypeService.getProductType();
        model.addAttribute("pvo",new ProductCategoryVo(products,productTypes));

        PageInfo voPageInfo=new PageInfo(products);
        model.addAttribute("pco",voPageInfo);
        return "ProductShow/productShowIndex";
    }
}
