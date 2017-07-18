package com.orange.service.impl;

import com.orange.bean.product.Sku;
import com.orange.dao.product.SkuDao;
import com.orange.service.SkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service
public class SkuServiceImpl implements SkuService {
    @Resource
    private SkuDao skuDao;

    @Override
    @Transactional
    public Integer addSku(Sku sku) {
        return skuDao.addSku(sku);
    }

    @Override
    public int getSkuListCount(Sku skuQuery) {
        return skuDao.getSkuListCount(skuQuery);
    }

    @Override
    public List<Sku> getSkuListWithPage(Sku skuQuery) {
        return skuDao.getSkuListWithPage(skuQuery);
    }

    @Override
    public Integer updateSkuByKey(Sku sku) {
        if (null != sku) {
            skuDao.updateSkuByKey(sku);
        }
        return null;
    }

    @Override
    public List<Sku> getStock(Integer productId) {
        if (null != productId) {
            return skuDao.getStock(productId);
        }
        return null;
    }

    @Override
    public Sku getSkuByKey(Integer id) {
        if (null != id) {
            return skuDao.getSkuByKey(id);
        }
        return null;
    }
}
