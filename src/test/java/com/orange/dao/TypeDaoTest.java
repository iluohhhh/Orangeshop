package com.orange.dao;

import com.orange.bean.product.Type;
import com.orange.dao.product.TypeDao;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;


public class TypeDaoTest extends SpringTestCase{
    @Resource
    private TypeDao typeDao;

    @Test
    public void getTypeListTest(){
        List<Type> types = typeDao.getTypeList(new Type());
        System.out.println(types.size());
    }
}
