package com.orange.controller;

import com.orange.bean.product.Product;
import com.orange.bean.product.Type;
import com.orange.service.ProductService;
import com.orange.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping("/front")
public class FrontController {
    @Autowired
    private TypeService typeService;
    @Autowired
    private ProductService productService;
    @RequestMapping("/index.shtml")
    public String index(ModelMap modelMap) {
        List<Type> typeList = typeService.getTypeList(null);
        modelMap.put("types", typeList);
        return "index";
    }

    @RequestMapping("/productList.shtml")
    public String productList(Integer typeId,ModelMap modelMap){
        Product product = new Product();
        product.setTypeId(typeId);
        List<Product> productList = productService.getProduct(product);
        modelMap.put("productList",productList);
        List<Type> typeList = typeService.getTypeList(null);
        modelMap.put("types", typeList);
        return "productList";
    }
}
