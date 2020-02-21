package com.service;

import com.entity.Product;
import com.entity.ProductType;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface ProductTypeService {
    List<ProductType> getAllProductType(int pageNum, int pageSize);
    Boolean updateType(ProductType productType);
    //查询产品类型信息填充到下拉框
    List<ProductType> getProductType();

   void deleteTypeAndProductIdTX(int tId);
   Boolean insertProductType(ProductType productType);
}
