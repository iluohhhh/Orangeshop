package com.orange.interceptor;

import com.orange.util.Constants;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**

 * @Description: 后台登录拦截器
 
 */
public class BackGroudInterceptor implements HandlerInterceptor {
    //不需要拦截的地址
    private String[] allowPath = {"/orangeShop/login/toLogin.do","/orangeShop/login/doLogin.do", "/orangeShop/product/detail.shtml", "/orangeShop/shopping/cart.shtml",
            "/orangeShop/shopping/clearCart.shtml", "/orangeShop/shopping/deleteItem.shtml","/orangeShop/login/toLogin.shtml",
            "/orangeShop/login/doLogin.shtml","/orangeShop/login/register.shtml","/orangeShop/login/doRegister.shtml"
    };

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        //如果session中无用户信息则表示未登录
        if (null != session.getAttribute(Constants.EMPLOYEE_SESSION)) {
            return true;
        }
        String requestURI = request.getRequestURI();

        //不需要拦截的直接放过
        for (String nologin : allowPath) {
            if (requestURI.equals(nologin)) {
                return true;
            }
        }
        //前台未登录跳转到登录页面
        if(requestURI.contains(".shtml")){
            response.sendRedirect("/orangeShop/login/toLogin.shtml?url="+requestURI);
        }else if(requestURI.contains(".do")){
            //后台登录页面
            response.sendRedirect("/orangeShop/login/toLogin.do");
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
