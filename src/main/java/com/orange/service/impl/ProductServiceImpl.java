package com.orange.service.impl;

import com.orange.bean.product.Img;
import com.orange.bean.product.Product;
import com.orange.bean.product.Sku;
import com.orange.bean.vo.ProductVo;
import com.orange.dao.product.ProductDao;
import com.orange.service.ImgService;
import com.orange.service.ProductService;
import com.orange.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**

 * @Description: 商品的业务处理类

 */
@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductDao productDao;
    @Autowired
    private ImgService imgService;
    @Autowired
    private SkuService skuService;

    @Override
    public int getProductListCount(ProductVo productQuery) {
        return productDao.getProductListCount(productQuery);
    }

    @Override
    public List<Product> getProductListWithPage(ProductVo productVo) {
        return productDao.getProductListWithPage(productVo);
    }

    @Override
    //注解启动事务
    @Transactional
    public Integer addProduct(Product product) {
        //以年月日时分秒毫秒作为商品的编号
        DateFormat format = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        String no = format.format(new Date());
        //将生成的编号设置
        product.setNo(no);
        Img img = product.getImg();
        Integer id = productDao.addProduct(product);
        Integer productId = product.getId();
        //将新生成的商品id放入img中，这样就可以关联商品和图片
        img.setProductId(productId);
        imgService.addImg(img);
        //最小销售单元：例如L型黑色就是一个最小销售单元。
        Sku sku = new Sku();
        sku.setCreateTime(new Date());
        for (String size : product.getSize().split(",")) {
            sku.setSize(size);
            for (String color : product.getColor().split(",")) {
                sku.setColorId(Integer.valueOf(color));
                sku.setProductId(productId);
                skuService.addSku(sku);
            }
        }
        return productId;
    }

    @Override
    public void update(Product product) {
        if (product != null) {
            productDao.update(product);
        }
    }

    @Override
    public void isShow(String idStr, Integer isShow) {
        if (isShow != null) {
            List<Integer> ids = new ArrayList<>();
            String[] idsArry = idStr.split(",");

            Product product = new Product();
            for (String id : idsArry) {
                if (!StringUtils.isEmpty(id)) {
                    product.setId(Integer.valueOf(id));
                    product.setIsShow(isShow);
                    productDao.isShow(product);
                }
            }
        }
    }

    @Override
    public Product getProductByKey(Integer id) {
        if (id != null) {
            return productDao.getProductByKey(id);
        }
        return null;
    }

    @Override
    public List<Product> getProduct(Product product) {
        List<Product> productList = productDao.getProduct(product);

        for (Product p : productList){
            List<Img> imgs = imgService.getImgByProductId(p.getId());
            if(imgs != null && imgs.size() >0){
                p.setImg(imgs.get(0));
            }
        }

        return productList;
    }
}
