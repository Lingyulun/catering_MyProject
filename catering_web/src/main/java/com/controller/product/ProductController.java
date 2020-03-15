package com.controller.product;

import com.entity.Employee;
import com.entity.Product;
import com.entity.ProductType;
import com.github.pagehelper.PageInfo;
import com.service.ProductService;
import com.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author 挥霍的人生
 */
@Controller
@RequestMapping("/ProductOperation")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductTypeService productTypeService;
    public static final String FILE_DIRECTORY="F:/Test";



    @RequestMapping("/productListAll2")
    public String listProducts(@RequestParam(value = "pname",required = false) String pname,@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                               @RequestParam(value = "pageSize",required = false,defaultValue = "4") int pageSize, Model model){ ;
        List<Product> list=productService.getAllProducts(pname,pageNum,pageSize);
        PageInfo<Product> pageInfo=new PageInfo<Product>(list);
        model.addAttribute("pageInfo",pageInfo);
        return "product/productList";
    }

    @RequestMapping("/productListAll")
    public String listProducts(Model model){ ;
       List<Product> products=productService.getAllProduct();
        PageInfo<Product> pageInfo=new PageInfo<Product>(products,3);
        model.addAttribute("pageInfo",pageInfo);
        return "product/productList";
    }

    //跳转到产品添加页面
    @RequestMapping("/productAdd")
    public ModelAndView listProductType(){
        ModelAndView model=new ModelAndView();
        //查询产品类型填充到下拉框
        List<ProductType> productTypes=productTypeService.getProductType();
        model.addObject("productType",productTypes);
        model.addObject("product",new Product());
        model.setViewName("product/productadd");
        return model;
    }

    @RequestMapping("/test")
    public String test(){
        return "upload/upload";
    }

    @RequestMapping("/productAddManager")
    public String UploadTheme(@Valid Product product,MultipartFile pimage, Model model){
        if (pimage != null) {
            System.out.println(pimage.getName());//返回文件的名称
            System.out.println(pimage.getOriginalFilename());//返回文件的原文件名
            try {
                product.setPimage(pimage.getOriginalFilename());
                productService.insertProduct(product);
                pimage.transferTo(new File("F:/image/images/"+ File.separator +pimage.getOriginalFilename()));
            } catch (IllegalStateException e){
                e.printStackTrace();
                model.addAttribute("msg", "上传失败");
                return "/error.jsp";
            } catch (IOException e){
                e.printStackTrace();
                model.addAttribute("msg", "上传失败");
                return "/error.jsp";
            }
        }else {
            return "error";
        }
        return "redirect:/ProductOperation/productListAll";
    }

    @RequestMapping("/deleteProduct")
    public String deleteProduct(int pid){
        productService.deleteProduct(pid);
        return "redirect:/ProductOperation/productListAll";
    }

    //修改的pid
    @RequestMapping("/getUpdateProductPid")
    public ModelAndView getById(int pid){
        ModelAndView modelAndView=new ModelAndView();
        Product product=productService.getProductpId(pid);
        modelAndView.addObject("updateProductPId",product);
        modelAndView.setViewName("product/productupdate");
        return modelAndView;
    }
    @RequestMapping("/updateProduct")
    public String UploadThemeProduct(@Valid Product product,MultipartFile pimage, Model model){
        if (pimage != null) {
            System.out.println(pimage.getName());//返回文件的名称
            System.out.println(pimage.getOriginalFilename());//返回文件的原文件名
            try {
                product.setPimage(pimage.getOriginalFilename());
                productService.updateProduct(product);
                pimage.transferTo(new File("F:/image/images"+ File.separator +pimage.getOriginalFilename()));
            } catch (IllegalStateException e){
                e.printStackTrace();
                model.addAttribute("msg", "上传失败");
                return "/error.jsp";
            } catch (IOException e){
                e.printStackTrace();
                model.addAttribute("msg", "上传失败");
                return "/error.jsp";
            }
        }else {
            return "error";
        }
        return "redirect:/ProductOperation/productListAll";
    }
}
