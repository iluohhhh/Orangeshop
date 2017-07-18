package com.orange.service.impl;

import com.orange.bean.product.Color;
import com.orange.dao.product.ColorDao;
import com.orange.service.ColorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class ColorServiceImpl implements ColorService {
    @Resource
    private ColorDao colorDao;

    public List<Color> getColorList(Color colorQuery) {
        return colorDao.getColorList(colorQuery);
    }

    @Override
    public Color getColorByKey(Integer id) {
        if (id != null){
            return colorDao.getColorByKey(id);
        }
        return null;
    }
}
