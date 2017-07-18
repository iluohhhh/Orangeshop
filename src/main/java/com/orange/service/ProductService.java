package com.orange.service;

import com.orange.bean.product.Product;
import com.orange.bean.vo.ProductVo;

import java.util.List;


public interface ProductService {

    /**
     * 获取所有条数
     * @param productQuery
     * @return
     */
    int getProductListCount(ProductVo productQuery);

    /**
     * 分页查询
     * @param productVo
     * @return
     */
    List<Product> getProductListWithPage(ProductVo productVo);

    /**
     * 添加
     * @param product
     */
    public Integer addProduct(Product product);

    /**
     * 更新
     * @param product
     */
    void update(Product product);

    /**
     * 商品上下架
     * @param ids
     * @param isShow
     */
    void isShow(String ids,Integer isShow);

    /**
     * 根据主键查找
     *
     * @param id
     */
    Product getProductByKey(Integer id);

    List<Product> getProduct(Product product);

}
