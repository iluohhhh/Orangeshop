package com.orange.service;

import com.orange.bean.product.Brand;

import java.util.List;


public interface BrandService {


    //查询集合
    public List<Brand> getBrandList(Brand brandQuery);
}
