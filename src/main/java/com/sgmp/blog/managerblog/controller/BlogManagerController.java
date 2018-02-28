package com.sgmp.blog.managerblog.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.sgmp.blog.managerblog.pojo.BlogManager;
import com.sgmp.blog.managerblog.serviceimpl.BlogManagerServiceImple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/web")
public class BlogManagerController {

    @Autowired
    private BlogManagerServiceImple blogManagerService;


    @RequestMapping(value = "/queryManager",method = RequestMethod.GET)
    public List<BlogManager> query() throws JsonProcessingException {
        List<BlogManager> blogManagerList = blogManagerService.query();
        return blogManagerList;
    }

}
