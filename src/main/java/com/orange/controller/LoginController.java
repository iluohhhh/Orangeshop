package com.orange.controller;

import com.alibaba.fastjson.JSON;
import com.orange.bean.user.Buyer;
import com.orange.bean.user.Employee;
import com.orange.service.BuyerService;
import com.orange.service.user.EmployeeService;
import com.orange.util.Constants;
import com.orange.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private BuyerService buyerService;

    /**
     * 登录页面
     *
     * @return
     */
    @RequestMapping(value = "/doLogin.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String doLogin(String username, String password, ModelMap modelMap, HttpServletRequest request) {
        //封装查询条件
        Employee employee = new Employee();
        //判断用户输入的用户名密码是否为空
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            modelMap.put("error", "登录信息有误");
            return "login";
        }
        employee.setPassword(password);
        employee.setUsername(username);
        //用上面封装的条件去查询
        Employee result = employeeService.getEmployee(employee);
        //如果没查到说明用户名或密码错误，则返回登录页面
        if (null == result) {
            modelMap.put("error", "登录信息有误");
            return "login";
        }
        //登录成功后将用户信息放入session中
        request.getSession().setAttribute(Constants.EMPLOYEE_SESSION, result);
        return "main";
    }

    /**
     * 去登录页面
     *
     * @return
     */
    @RequestMapping("/toLogin.do")
    public String toLogin() {
        return "login";
    }

    /**
     * 欢迎页面
     *
     * @return
     */
    @RequestMapping("/welcome.do")
    public String welcome() {
        return "welcome";
    }

    /**
     * 购买者登录
     *
     * @param request
     * @param username
     * @param password
     */
    @RequestMapping("/doLogin.shtml")
    public String buyerLogin(HttpServletRequest request, String username, String password, String targetUrl) {
        Buyer buyer = buyerService.getBuyerByUserNameAndPassword(username, password);
        if (null == buyer) {
//        	request.setAttribute("targetUrl", "/orangeShop/front/index.shtml");
            return "login";
        }
        if (!StringUtils.isEmpty(targetUrl)) {
            String contextPath = request.getContextPath();
            targetUrl = targetUrl.replaceAll(contextPath,"");
        }
        request.getSession().setAttribute(Constants.BUYER_SESSION, buyer);
        if(StringUtils.isEmpty(targetUrl)){
        	return "redirect:/front/index.shtml";
        }
        return "redirect:" + targetUrl;
    }

    /**
     * 购买者跳转登录页面
     *
     * @return
     */
    @RequestMapping("/toLogin.shtml")
    public String buyerToLogin(String url, ModelMap modelMap) {
        modelMap.put("url", url);
        return "login";
    }

    /**
     * 购买者退出登录
     * @param request
     * @return
     */
    @RequestMapping("/logout.shtml")
    public String loginOut(HttpServletRequest request,ModelMap modelMap,String url){
        modelMap.put("url",url);
        request.getSession().invalidate();
        return "redirect:/login/toLogin.shtml";
    }

    /**
     * 用户注册
     * @return
     */
    @RequestMapping("/register.shtml")
    public String register(){
        return "register";
    }
    @RequestMapping("/doRegister.shtml")
    public void doRegister(Buyer buyer,HttpServletResponse response){
        buyerService.addBuyer(buyer);
        Map<String,String> map = new HashMap<>();
        map.put("data","Register SuccessFull!");
        ResponseUtil.renderJson(response, JSON.toJSONString(map));
    }
}
