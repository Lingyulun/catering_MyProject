package com.service;

import com.entity.Product;
import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface ProductService {
    //产品名查询
    List<Product> getNamesProducts(String pname, int pageNum, int pageSize);
    //查询所有分页
    List<Product> getAllProduct(int pageNum,int pageSize);

    //批量删除
    boolean delAllProducts(Integer[] pids);

    //用于前台添加物品到购物车
    Product getProductpId(int pid);

    List<Product> getProductAll(int ptype, int pageNum, int pageSize);



    //添加产品
    void insertProduct(Product product);
    //修改产品
    void updateProduct(Product product);
    //删除产品
    void deleteProduct(int pid);

    //得到对应类型数量，为0条时，同时删除产品和删除产品类型
    int getCount(int ptype);
    void deleteProductType(int ptype);


}
