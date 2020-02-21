package com.service;

import com.entity.Product;
import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface ProductService {

    List<Product> getAllProducts(String pname, int pageNum, int pageSize);
    List<Product> getAllProduct();


    //用于前台添加物品到购物车
    Product getProductpId(int pid);

    List<Product> getProductAll(int ptype, int pageNum, int pageSize);




    void insertProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(int pid);

    //得到对应类型数量，为0条时，同时删除产品和删除产品类型
    int getCount(int ptype);
    void deleteProductType(int ptype);


}
