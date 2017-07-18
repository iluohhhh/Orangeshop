package com.orange.dao.product;

import com.orange.bean.product.Product;
import com.orange.bean.vo.ProductVo;

import java.util.List;
import java.util.Map;


public interface ProductDao {

    /**
     * 添加
     *
     * @param product
     */
    Integer addProduct(Product product);

    /**
     * 根据主键查找
     *
     * @param id
     */
    Product getProductByKey(Integer id);

    /**
     * 根据主键批量查找
     *
     * @param productQuery
     */
    List<Product> getProductsByKeys(List<Integer> idList);

    /**
     * 商品上下架
     */
    void isShow(Product product);


    /**
     * 分页查询
     *
     * @param productVo 查询条件封装类
     */
    List<Product> getProductListWithPage(ProductVo productVo);

    /**
     * 总条数
     *
     * @param productQuery
     */
    int getProductListCount(ProductVo productQuery);

    /**
     * 更新
     *
     * @param product
     */
    void update(Product product);

    List<Product> getProduct(Product product);

}
