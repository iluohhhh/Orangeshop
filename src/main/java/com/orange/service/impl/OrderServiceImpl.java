package com.orange.service.impl;

import com.orange.bean.BuyCart;
import com.orange.bean.BuyItem;
import com.orange.bean.order.Detail;
import com.orange.bean.order.Order;
import com.orange.bean.product.Color;
import com.orange.bean.product.Product;
import com.orange.dao.OrderDao;
import com.orange.service.ColorService;
import com.orange.service.DetailService;
import com.orange.service.OrderService;
import com.orange.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**

 * @Description: 订单详情
 
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderDao orderDao;
    @Resource
    private DetailService detailService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ColorService colorService;

    /**
     * 插入数据库
     *
     * @return
     */
    public Order addOrder(Order order,BuyCart buyCart) {
        //生成订单号
        DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String oid = df.format(new Date());
        order.setOid(oid);
        //运费
        order.setDeliverFee(buyCart.getFee());
        //应付金额
        order.setPayableFee(buyCart.getTotalPrice());
        //订单金额
        order.setTotalPrice(buyCart.getProductPrice());
        //支付状态
        if(order.getPaymentWay() == 0){
            order.setIsPaiy(0);
        }else{
            order.setIsPaiy(1);
        }
        //订单状态   提交订单
        order.setState(0);
        //订单生成时间
        order.setCreateDate(new Date());
        //保存订单
        Integer o = orderDao.addOrder(order);
        //购物项集合
        List<BuyItem> items = buyCart.getItems();

        for(BuyItem item :items){
            //保存订单详情  List集合
            Detail detail = new Detail();
            //设置一个订单ID
            detail.setOrderId(order.getId());
            //根据sku中的productId获取商品信息
            if(item.getSku().getProductId() != null) {
                Product product = productService.getProductByKey(item.getSku().getProductId());
                //商品名称
                detail.setProductName(product.getName());
                //商品编号
                detail.setProductNo(product.getNo());
            }
            //根据sku中的颜色id获取颜色信息
            if(item.getSku().getColorId() != null) {
                Color color = colorService.getColorByKey(item.getSku().getColorId());
                //颜色名称
                detail.setColor(color.getName());
            }
            //尺码
            detail.setSize(item.getSku().getSize());
            //商品销售价
            detail.setSkuPrice(item.getSku().getSkuPrice());
            //购物数量
            detail.setAmount(item.getAmount());
            //保存
            detailService.addDetail(detail);
        }

        return order;
    }

    @Override
    public List<Order> getOrderList(Order order) {
        return orderDao.getOrderList(order);
    }

    @Override
    public int getOrderListCount(Order orderQuery) {
        return orderDao.getOrderListCount(orderQuery);
    }

    @Override
    public List<Order> getOrderListWithPage(Order orderQuery) {
        return orderDao.getOrderListWithPage(orderQuery);
    }

    @Override
    public void updateOrderByKey(Order order) {
        orderDao.updateOrderByKey(order);
    }
}
