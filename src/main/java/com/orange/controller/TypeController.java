package com.orange.controller;

import com.alibaba.fastjson.JSON;
import com.orange.bean.product.Type;
import com.orange.service.TypeService;
import com.orange.util.ResponseUtil;
import com.orange.util.ResultInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**

 * @Description: 商品类别管理

 */
@Controller
@RequestMapping("/type")
public class TypeController {
    @Autowired
    private TypeService typeService;

    @RequestMapping("/list.do")
    public String toList() {
        return "class/list";
    }

    @RequestMapping("/page.do")
    public void page(HttpServletResponse response, Integer rows, Integer page) {
        Type type = new Type();
        type.setPageNo(page);
        type.setPageSize(rows);
        int count = typeService.getCount(type);
        List<Type> pageList = typeService.getTypeListByPage(type);
        ResultInfo<Type> resultInfo = new ResultInfo<>();
        resultInfo.setRows(pageList);
        resultInfo.setTotal(count);
        String json = JSON.toJSONString(resultInfo);
        ResponseUtil.renderJson(response, json);
    }

    /**
     * 跳转到添加页面
     *
     * @param
     * @return
     */
    @RequestMapping("/toAdd.do")
    public String toAdd(ModelMap modelMap) {
        List<Type> typeList = typeService.getTypeList(new Type());
        modelMap.put("types", typeList);
        return "class/add";
    }

    /**
     * 类别添加
     *
     * @param type
     * @param response
     */
    @RequestMapping("/add.do")
    public void add(Type type, HttpServletResponse response) {
        Map<String, String> map = new HashMap<>();
        if (StringUtils.isEmpty(type.getName())) {
            map.put("data", "添加失败");
            ResponseUtil.renderTxt(response, JSON.toJSONString(map));
            return;
        }

        typeService.save(type);
        map.put("data", "添加成功");
        ResponseUtil.renderTxt(response, JSON.toJSONString(map));
    }

    @RequestMapping("/delete.do")
    public void delete(String ids, HttpServletResponse response) {
        String[] idArry = ids.split(",");
        List<Integer> idList = new ArrayList<>(10);
        for (String id : idArry) {
            idList.add(Integer.valueOf(id));
        }

        if(null != idList){
            typeService.deleteByIds(idList);
        }

        ResponseUtil.renderTxt(response,"success");
    }
}
