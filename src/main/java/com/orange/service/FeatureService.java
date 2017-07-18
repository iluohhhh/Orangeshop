package com.orange.service;

import com.orange.bean.product.Feature;

import java.util.List;


public interface FeatureService {

    /**
     * 集合查询
     * @param featureQuery
     */
    public List<Feature> getFeatureList(Feature featureQuery);
}
