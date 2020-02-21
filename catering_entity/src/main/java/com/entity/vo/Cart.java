package com.entity.vo;

import com.entity.Product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 挥霍的人生
 */
public class Cart {
    private Map<Integer,CartItem>carts=new HashMap<Integer, CartItem>();

    public void addCartItem(CartItem item) {
        // TODO Auto-generated method stub
        CartItem iCartItem=carts.get(item.getP().getPid());
        if(iCartItem!=null) {
            iCartItem.setQty(iCartItem.getQty()+item.getQty());

        }else {
            carts.put(item.getP().getPid(),item);
        }
    }
    public List<CartItem>getItems(){
        return new ArrayList<CartItem>(carts.values());
    }
    public int getCategoryCount() {
        return carts.size();
    }
    public int getItemCount() {
        int total=0;
        for(CartItem item:carts.values()) {
            total+=item.getQty();
        }
        return total;
    }
    public void removeItems(Integer id,Integer qty) {
        CartItem itemInCart=carts.get(id);
        if(itemInCart==null) {
            return;
        }
        Integer newValue=itemInCart.getQty()-qty;
        if(newValue<=0) {
            carts.remove(id);
        }else {
            itemInCart.setQty(newValue);
        }
    }
    public void removeItems(Integer id) {
        CartItem itemInCart=carts.get(id);
        if(itemInCart==null) {
            return;
        }
        carts.remove(id);
    }
    /**
     * 从购物物车移除购物车商品一定数量
     * @param qty
     * @param id
     * */
    public BigDecimal getTotal() {
        BigDecimal total=new BigDecimal(0);
        for(CartItem item:carts.values()) {
            total=total.add(item.getSubTotal());

        }
        return total;
    }
}
