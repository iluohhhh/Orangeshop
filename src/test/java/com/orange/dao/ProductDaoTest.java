package com.orange.dao;

import com.orange.bean.vo.ProductVo;
import com.orange.dao.product.ProductDao;
import org.junit.Test;

import javax.annotation.Resource;


public class ProductDaoTest extends SpringTestCase {
    @Resource
    private ProductDao productDao;

    @Test
    public void getProductListCountTest(){
        ProductVo productVo = new ProductVo();
        productVo.setIsShow(1);
        int count = productDao.getProductListCount(productVo);
        System.out.println("-----count= "+count);

    }
}
