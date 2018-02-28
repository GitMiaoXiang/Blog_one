package com.sgmp.blog.managerblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/web")
public class BlogArticleDetail {

    @RequestMapping(value = "/detail.html")
    public String articledetail(Model model){
        return "articledetail";

    }
}
