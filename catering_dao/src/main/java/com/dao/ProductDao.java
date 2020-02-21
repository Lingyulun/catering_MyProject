package com.dao;

import com.entity.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface ProductDao {

    List<Product> getAllProducts(@Param("pname") String pname, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    List<Product> getAllProduct();

    void insertProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(int pid);



    //得到类型的数据，当数据为0条时，启动事务删除产品类型
   int getCount(int ptype);
    void deleteProductType(int ptype);


    List<Product> getProductAll(@Param("ptype") int ptype, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    //用于前台添加到购物车
    Product getProductpId(int pid);
}
