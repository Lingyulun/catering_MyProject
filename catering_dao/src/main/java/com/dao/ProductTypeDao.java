package com.dao;

import com.entity.Employee;
import com.entity.ProductType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 挥霍的人生
 */
public interface ProductTypeDao {
    List<ProductType> getAllProductType(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
    //用来查询产品类型添加到产品下拉框
    List<ProductType> getProductType();
    Boolean updateType(ProductType productType);
    ProductType getProductTypeId(int tId);
    Boolean deleteTypeId(int tId);
    Boolean insertProductType(ProductType productType);
}
