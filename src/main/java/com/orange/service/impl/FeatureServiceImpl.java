package com.orange.service.impl;

import com.orange.bean.product.Feature;
import com.orange.dao.product.FeatureDao;
import com.orange.service.FeatureService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class FeatureServiceImpl implements FeatureService {
    @Resource
    private FeatureDao featureDao;

    @Override
    public List<Feature> getFeatureList(Feature featureQuery) {
        return featureDao.getFeatureList(featureQuery);
    }
}
