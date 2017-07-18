package com.orange.controller;

import com.orange.bean.BuyCart;
import com.orange.bean.BuyItem;
import com.orange.bean.order.Order;
import com.orange.bean.product.Sku;
import com.orange.bean.user.Buyer;
import com.orange.service.OrderService;
import com.orange.service.SkuService;
import com.orange.util.Constants;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
public class FrontOrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private SkuService skuService;

    //提交订单
    @RequestMapping(value = "/buyer/confirmOrder.shtml")
    public String confirmOrder(Order order, HttpServletRequest request, HttpServletResponse response, ModelMap map){
        //1:接收前台传四个参数

        //springmvc
        ObjectMapper om = new ObjectMapper();
        om.setSerializationInclusion(JsonSerialize.Inclusion.NON_NULL);

        //声明
        BuyCart buyCart = null;
        //判断Cookie是否有购物车

        //JESSIONID
        //buyCart_cookie
        //
        Cookie[] cookies = request.getCookies();
        if(null != cookies && cookies.length >0){
            for(Cookie c : cookies){
                if(Constants.BUYCART_COOKIE.equals(c.getName())){
                    //如果有了  就使用此购物车
                    String value = c.getValue();//
                    //
                    try {
                        buyCart = om.readValue(value, BuyCart.class);
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    break;
                }
            }
        }

        //装购物车装满
        List<BuyItem> its = buyCart.getItems();
        for(BuyItem item : its){
            Sku s = skuService.getSkuByKey(item.getSku().getId());
            item.setSku(s);
        }

        Buyer buyer = (Buyer) request.getAttribute(Constants.BUYER_SESSION);
        if(null == buyer){
            buyer = new Buyer();
            buyer.setUsername("fbb2014");
        }
        //用户Id
        order.setBuyerId(buyer.getUsername());
        //保存订单   订单详情  二张表
        Order addOrder = orderService.addOrder(order, buyCart);
        //清空购物车
        Cookie cookie = new Cookie(Constants.BUYCART_COOKIE,null);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        map.put("order",addOrder);
        return "confirmOrder";
    }

}
