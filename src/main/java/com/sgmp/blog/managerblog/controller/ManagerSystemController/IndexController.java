package com.sgmp.blog.managerblog.controller.ManagerSystemController;

import com.sgmp.blog.managerblog.serviceimpl.BlogCommentServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogMessageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/manager/mblog")
public class IndexController {

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    /**
     * 跳转首页
     * @param model
     * @return
     */
    @RequestMapping(value = "/index.html")
    public String index(Model model){

        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);
        return "/manager/index";
    }
}
