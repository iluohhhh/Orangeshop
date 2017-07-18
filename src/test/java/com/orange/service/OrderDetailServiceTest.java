package com.orange.service;

import com.orange.bean.order.Detail;
import com.orange.dao.SpringTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


public class OrderDetailServiceTest extends SpringTestCase{
    @Autowired
    private DetailService detailService;

    @Test
    public void getDetailListTest(){
        Detail detail = new Detail();
        detail.setOrderId(20);
        List<Detail> detailList = detailService.getDetailList(detail);
        detailList.size();
    }
}
