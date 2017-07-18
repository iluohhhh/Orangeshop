package com.orange.service.impl;

import com.orange.bean.product.Img;
import com.orange.bean.product.Product;
import com.orange.dao.product.ImgDao;
import com.orange.service.ImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class ImgServiceImpl implements ImgService {
    @Autowired
    private ImgDao imgDao;
    @Override
    @Transactional
    public Integer addImg(Img img) {
        return imgDao.addImg(img);
    }

    @Override
    public List<Img> getImgListWithPage(Img imgQuery) {
        if(null != imgQuery){
            return imgDao.getImgListWithPage(imgQuery);
        }
        return null;
    }

    @Override
    public List<Img> getImgByProductId(Integer productId) {
        if(productId != null){
            return imgDao.getImgByProductId(productId);
        }
        return null;
    }
}
