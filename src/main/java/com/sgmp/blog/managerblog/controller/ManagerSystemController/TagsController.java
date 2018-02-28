package com.sgmp.blog.managerblog.controller.ManagerSystemController;

import com.sgmp.blog.managerblog.pojo.BlogTag;
import com.sgmp.blog.managerblog.serviceimpl.BlogCommentServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogMessageServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogTagServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/manager/tag")
public class TagsController {

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    @Autowired
    private BlogTagServiceImpl blogTagService;

    @RequestMapping(value = "/tag_findall.html")
    public String aritlcefindall(Model model){
        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);
        List<BlogTag> query = blogTagService.query();
        model.addAttribute("tags",query);
        return "/manager/tag";
    }

    @RequestMapping(value = "/tag_add.html")
    public String articleadd(Model model){
        return "/manager/tag_add";
    }
}
