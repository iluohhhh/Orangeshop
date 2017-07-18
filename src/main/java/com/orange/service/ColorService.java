package com.orange.service;

import com.orange.bean.product.Color;

import java.util.List;


public interface ColorService {

    /**
     * 集合查询
     * @param colorQuery
     */
    public List<Color> getColorList(Color colorQuery);

    /**
     * 根据主键查找
     * @param id
     */
    public Color getColorByKey(Integer id);
}
