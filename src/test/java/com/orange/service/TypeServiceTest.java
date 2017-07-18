package com.orange.service;

import com.orange.bean.product.Type;
import com.orange.dao.SpringTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


public class TypeServiceTest extends SpringTestCase {
    @Autowired
    private TypeService typeService;

    @Test
    public void getTypeListTest(){
        List<Type> typeList = typeService.getTypeList(new Type());
        System.out.println(typeList.size());
    }
}
