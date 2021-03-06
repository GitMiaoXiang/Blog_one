package com.sgmp.blog.managerblog.intereptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String requestURI = httpServletRequest.getRequestURI();
        if(requestURI.indexOf("/manager/mblog/login.html")>=0||requestURI.indexOf("/manager/mblog/login")>=0){
            return true;
        }
        HttpSession session = httpServletRequest.getSession();
        String managername = (String) session.getAttribute("managername");
        if(managername!=null){
            return true;
        }
        httpServletRequest.getRequestDispatcher("/manager/mblog/login.html").forward(httpServletRequest,httpServletResponse);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
