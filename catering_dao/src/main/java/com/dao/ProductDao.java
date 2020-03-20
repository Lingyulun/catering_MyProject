package com.dao;

import com.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface ProductDao {
    //查询产品名
    List<Product> getNamesProducts(@Param("pname") String pname, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    //查询所有
    List<Product> getAllProduct(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    //添加产品
    void insertProduct(Product product);
    //修改产品
    void updateProduct(Product product);
    //删除产品
    void deleteProduct(int pid);

    //批量删除产品
    boolean delAllProducts(Integer[] pids);

    //得到类型的数据，当数据为0条时，启动事务删除产品类型
    int getCount(int ptype);
    void deleteProductType(int ptype);


    List<Product> getProductAll(@Param("ptype") int ptype, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);


    //用于前台添加到购物车
    Product getProductpId(int pid);
}
