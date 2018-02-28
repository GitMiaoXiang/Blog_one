package com.sgmp.blog.managerblog.controller.ManagerSystemController;

import com.sgmp.blog.managerblog.controller.Msg;
import com.sgmp.blog.managerblog.pojo.BlogManager;
import com.sgmp.blog.managerblog.serviceimpl.BlogManagerServiceImple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/manager/mblog")
public class LoginController {

    @Autowired
    private BlogManagerServiceImple blogManagerServiceImple;

    @RequestMapping(value = "/login.html")
    public String index(Model model){
        return "/manager/login";
    }

    /**
     * 登录
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Msg login(BlogManager blogManager, HttpSession session){
        BlogManager blogManager1 = blogManagerServiceImple.queryOne(blogManager);
        if(blogManager1.getName().equals(blogManager.getName())){
            session.setAttribute("managername",blogManager1.getName());
            return Msg.success();
        }
        return Msg.fail();
    }

    @RequestMapping(value = "/loginout",method = RequestMethod.GET)
    public String loginout(Model model,HttpSession session){
        String managername = (String) session.getAttribute("managername");
        if(managername!=null){
            session.invalidate();
        }
        return "/manager/login";
    }
}
