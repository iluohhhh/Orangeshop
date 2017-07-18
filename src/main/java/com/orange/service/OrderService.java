package com.orange.service;

import com.orange.bean.BuyCart;
import com.orange.bean.order.Order;

import java.util.List;

/**

 * @Description: 订单业务层

 */
public interface OrderService {
    /**
     * 基本插入
     *
     * @return
     */
    Order addOrder(Order order,BuyCart buyCart);

    /**
     * 集合查询
     * @param order
     * @return
     */
    List<Order> getOrderList(Order order);

    /**
     * 总条数
     * @param orderQuery
     */
    public int getOrderListCount(Order orderQuery);


    /**
     * 分页查询
     * @param orderQuery
     */
    public List<Order> getOrderListWithPage(Order orderQuery);

    void updateOrderByKey(Order order);
}
