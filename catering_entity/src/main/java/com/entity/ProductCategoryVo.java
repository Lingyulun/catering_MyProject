package com.entity;

import com.github.pagehelper.PageInfo;



import java.util.List;
/**
 * @author 挥霍的人生
 */
public class ProductCategoryVo {
   private List<Product> products;
   private List<ProductType> productTypes;
    private PageInfo pageInfo;
    private Integer currentCid;


    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<ProductType> getProductTypes() {
        return productTypes;
    }

    public void setProductTypes(List<ProductType> productTypes) {
        this.productTypes = productTypes;
    }

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }

    public Integer getCurrentCid() {
        return currentCid;
    }

    public void setCurrentCid(Integer currentCid) {
        this.currentCid = currentCid;
    }

    public ProductCategoryVo() {
    }
    public ProductCategoryVo(List<Product> products, List<ProductType> productTypes) {
        this.products = products;
        this.productTypes = productTypes;
    }

    public ProductCategoryVo(List<Product> products, List<ProductType> productTypes, PageInfo pageInfo) {
        this.products = products;
        this.productTypes = productTypes;
        this.pageInfo = pageInfo;
    }

    public ProductCategoryVo(List<Product> products, List<ProductType> productTypes, Integer currentCid) {
        this.products = products;
        this.productTypes = productTypes;
        this.currentCid = currentCid;
    }

    public ProductCategoryVo(List<Product> products, List<ProductType> productTypes, PageInfo pageInfo, Integer currentCid) {
        this.products = products;
        this.productTypes = productTypes;
        this.pageInfo = pageInfo;
        this.currentCid = currentCid;
    }
}
