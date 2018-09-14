package com.cmos.handlers;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInterceptor implements HandlerInterceptor {
    /**
     * 渲染视图之后被调用
     * 释放资源
     */
    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        System.out.println("afterCompletion");
    }

    /**
     * 调用方法之后，渲染视图之前被调用
     * 对请求域中的属性 或视图进行修改
     */
    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object arg2, ModelAndView arg3)
            throws Exception {
        System.out.println("postHandle");

    }

    /**
     * 该方法在目标方法之前执行 若返回值为true，则继续执行后续的拦截器和方法 否则，则不会调用
     * 可以做权限，日志，事务
     */
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object arg2) throws Exception {

        System.out.println("先登录");
        String user = (String) req.getSession().getAttribute("currentuser");
        if (user == null) {
            resp.sendRedirect(req.getContextPath());
            return false;
        } else {
            return true;
        }

    }

}
