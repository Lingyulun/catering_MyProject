package com.entity.vo;

import com.entity.Product;

import java.math.BigDecimal;

/**
 * @author 挥霍的人生
 */
public class CartItem {
    private Product p;
    private int qty;


    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
    public CartItem(Product p) {
        this(p,1);
    }
    public CartItem(Product p,int qty) {
        this.p=p;
        this.qty=qty;
    }
    public BigDecimal getSubTotal() {
        return this.p.getPsalary().multiply(new BigDecimal(qty));
    }

}
