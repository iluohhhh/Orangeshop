package com.orange.controller;

import com.alibaba.fastjson.JSON;
import com.orange.bean.product.Color;
import com.orange.bean.product.Sku;
import com.orange.service.ColorService;
import com.orange.service.SkuService;
import com.orange.util.ResponseUtil;
import com.orange.util.ResultInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
@RequestMapping("/sku")
public class SkuController {
    @Autowired
    private SkuService skuService;
    @Autowired
    private ColorService colorService;


    @RequestMapping("/list.do")
    public String list(Integer id, Model model){
        model.addAttribute("id",id);
        return "sku/list";
    }

    /**
     * 分页查询
     * @param page 第几页
     * @param rows 每页多少条数据
     * @return
     */
    @RequestMapping("/page.do")
    public void page(Integer id, Integer page, Integer rows, HttpServletResponse response){
        Sku sku = new Sku();
        sku.setProductId(id);
        sku.setPageNo(page);
        sku.setPageSize(rows);
        List<Sku> skuListWithPage = skuService.getSkuListWithPage(sku);

        //获取每个sku对应的颜色
        for (Sku sku1 : skuListWithPage){
            Color color = colorService.getColorByKey(sku1.getColorId());
            sku1.setColor(color);
        }

        int count = skuService.getSkuListCount(sku);
        ResultInfo<Sku> resultInfo = new ResultInfo<>();
        resultInfo.setTotal(count);
        resultInfo.setRows(skuListWithPage);
        String json = JSON.toJSONString(resultInfo);
        ResponseUtil.renderJson(response,json );
    }

    @RequestMapping("/update.do")
    public void updateSku(Sku sku){
        skuService.updateSkuByKey(sku);
    }
}
