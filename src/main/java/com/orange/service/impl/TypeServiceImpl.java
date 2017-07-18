package com.orange.service.impl;

import com.orange.bean.product.Type;
import com.orange.dao.product.TypeDao;
import com.orange.service.TypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class TypeServiceImpl implements TypeService {
    @Resource
    private TypeDao typeDao;

    @Override
    public List<Type> getTypeList(Type type) {
        return typeDao.getTypeList(type);
    }

    @Override
    public int getCount(Type type) {
        return typeDao.getCount(type);
    }

    @Override
    public List<Type> getTypeListByPage(Type type) {
        return typeDao.getTypeListByPage(type);
    }

    @Override
    public void save(Type type) {
        if (null != type) {
            type.setIsDisplay(1);
            typeDao.save(type);
        }
    }

    @Override
    public void deleteByIds(List<Integer> ids) {
        if (null != ids) {

            for (Integer id : ids) {
                try {
                    typeDao.delete(id);
                } catch (Exception e) {

                }
            }
        }
    }
}
