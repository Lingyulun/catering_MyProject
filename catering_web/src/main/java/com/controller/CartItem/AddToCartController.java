package com.controller.CartItem;

import com.entity.Product;
import com.service.ProductService;
import com.entity.vo.Cart;
import com.entity.vo.CartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author 挥霍的人生
 */
@Controller
@RequestMapping("/viewCart")
public class AddToCartController {
    @Autowired
    private ProductService productService;

    //查看购物车

    @RequestMapping("/viewCartIndex")
    public String viewCart(){
        return "viewCart/viewCart";
    }

    @RequestMapping("/addToCart")
    public String test(HttpSession session,Model model,int pid){
        Product p=productService.getProductpId(pid);
        CartItem cartItem=new CartItem(p);
        Cart cart=(Cart)session.getAttribute("cart");
        if(cart!=null) {
            cart.addCartItem(cartItem);
        }else {
            cart =new Cart();
            cart.addCartItem(cartItem);
            session.setAttribute("cart", cart);
        }
        model.addAttribute("cart",cart);
        return "viewCart/viewCart";
    }

    @RequestMapping("/delete")
    public String deleteCartByBook(int id,HttpSession session,Model model){
        //获取数的id
        Cart cart = (Cart)session.getAttribute("cart");
        cart.removeItems(id); //直接调用 实体类Cart中的removeItems()方法
        return "viewCart/viewCart";
    }
}
