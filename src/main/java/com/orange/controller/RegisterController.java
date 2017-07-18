package com.orange.controller;

import com.orange.bean.user.Buyer;
import com.orange.service.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**

 * @Description: 用户注册中心

 */
@Controller
@RequestMapping("/regist")
public class RegisterController {
    @Autowired
    private BuyerService buyerService;
    public String buyerRegister(Buyer buyer, ModelMap modelMap){

        if(null != buyer) {
            buyerService.addBuyer(buyer);
            modelMap.put("buyer",buyer);
            modelMap.put("success","注册成功");
        }

        modelMap.put("error","注册失败");
        return "register";
    }
}
