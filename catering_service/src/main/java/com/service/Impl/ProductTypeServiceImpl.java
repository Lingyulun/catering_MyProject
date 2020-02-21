package com.service.Impl;

import com.dao.ProductDao;
import com.dao.ProductTypeDao;
import com.entity.Product;
import com.entity.ProductType;
import com.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 挥霍的人生
 */
@Service
public class ProductTypeServiceImpl implements ProductTypeService {
    @Autowired
    private ProductTypeDao productTypeDao;

    @Autowired
    private ProductDao productDao;

    @Override
    public List<ProductType> getAllProductType(int pageNum, int pageSize) {
        return productTypeDao.getAllProductType(pageNum,pageSize);
    }

    @Override
    public Boolean updateType(ProductType productType) {
       return productTypeDao.updateType(productType);
    }

    @Override
    public List<ProductType> getProductType() {
        return productTypeDao.getProductType();
    }

    @Transactional
    @Override
    public void deleteTypeAndProductIdTX(int tId) {
        //先删除产品，后删类型，因为有外键依赖
        productDao.deleteProductType(tId);
        productTypeDao.deleteTypeId(tId);
    }


    //添加产品类型

    @Override
    public Boolean insertProductType(ProductType productType) {
       return productTypeDao.insertProductType(productType);
    }
}
