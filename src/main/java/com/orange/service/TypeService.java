package com.orange.service;

import com.orange.bean.product.Type;

import java.util.List;

/**

 * @Description: 商品类型业务处理类
 
 */
public interface TypeService {

    /**
     * 集合查询
     * @param type
     */
    List<Type> getTypeList(Type type);

    int getCount(Type type);

    List<Type> getTypeListByPage(Type type);

    void save(Type type);

    void deleteByIds(List<Integer> ids);
}
