package com.service.Impl;

import com.dao.ProductDao;
import com.entity.Product;
import com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * @author 挥霍的人生
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDao productDao;

    @Override
    public List<Product> getAllProducts(String pname,int pageNum,int pageSize) {
        return productDao.getAllProducts(pname,pageNum,pageSize);
    }

    @Override
    public List<Product> getAllProduct() {
        return productDao.getAllProduct();
    }


    //用于前台添加商品到购物车查询id的信息
    @Override
    public Product getProductpId(int pid) {
        return productDao.getProductpId(pid);
    }

    @Override
   public List<Product> getProductAll(int ptype,int pageNum,int pageSize) {
      return productDao.getProductAll(ptype,pageNum,pageSize);
   }

    @Override
    public void insertProduct(Product product) {
       productDao.insertProduct(product);
    }

    @Override
    public void updateProduct(Product product) {
        productDao.updateProduct(product);
    }


    @Override
    public void deleteProduct(int pid) {
        productDao.deleteProduct(pid);
    }

    @Override
    public int getCount(int ptype) {
       return productDao.getCount(ptype);
    }

    //删除产品类型，根据类型删除对应的产品
    @Override
    public void deleteProductType(int ptype) {
        productDao.deleteProductType(ptype);
    }
}
