package com.sgmp.blog.managerblog.controller;

import com.sgmp.blog.managerblog.pojo.BlogCategory;
import com.sgmp.blog.managerblog.serviceimpl.BlogCategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/web/category")
public class BlogCategoryController {

    @Autowired
    private BlogCategoryServiceImpl blogCcategoryService;

    @GetMapping("/querysun/{id}")
    public List<BlogCategory> querysun(@PathVariable("id") String ids){
        Integer indexz=Integer.parseInt(ids);
        List<BlogCategory> querysun = blogCcategoryService.querysun(indexz);
        return  querysun;
    }

}
