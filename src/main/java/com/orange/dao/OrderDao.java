package com.orange.dao;

import com.orange.bean.order.Order;

import java.util.List;

/**

 * @Description: 订单持久化层

 */
public interface OrderDao {

    /**
     * 添加
     * @param order
     */
    Integer addOrder(Order order);

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
