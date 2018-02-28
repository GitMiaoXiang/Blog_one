package com.sgmp.blog.managerblog.controller;


import com.sgmp.blog.managerblog.javabean.BlogMessageDiv;
import com.sgmp.blog.managerblog.pojo.BlogMessage;
import com.sgmp.blog.managerblog.pojo.BlogUser;
import com.sgmp.blog.managerblog.serviceimpl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/web/message")
public class BlogMessageController {

    @Autowired
    private BlogArticleServieImpl blogArticleService;

    @Autowired
    private BlogTagServiceImpl blogTagService;

    @Autowired
    private BlogCategoryServiceImpl blogCategoryService;

    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    @Autowired
    private BlogUserServiceImpl blogUserService;

    /**
     * 添加留言
     */
    @PostMapping("/sendmsg")
    public BlogMessageDiv sendmsg(BlogMessage blogMessage, @Valid BlogUser blogUser, BindingResult result){
        BlogMessageDiv blogMessageDiv;
        if(blogMessage.getContent()==null||blogMessage.getContent()==""){
            Map<String,Object> map=new HashMap<>();
            blogMessageDiv=new BlogMessageDiv();
            map.put("content","内容不能为空。");
            blogMessageDiv.setMap(map);
            return blogMessageDiv;
        }
        if(result.hasErrors()){
            Map<String,Object> map=new HashMap<>();
            blogMessageDiv=new BlogMessageDiv();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError:fieldErrors) {
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            blogMessageDiv.setMap(map);
            return blogMessageDiv;
        }
        blogUser.setStatus("1");
        blogUser.setCreatedate(new Date());
        int i = blogUserService.getMapper().insertUseGeneratedKeys(blogUser);
        if(i==1){
            BlogMessageDiv blogMessageDiv1=new BlogMessageDiv();
            blogMessage.setUserid(blogUser.getId());
            BlogMessage sendmsg = blogMessageService.sendmsg(blogMessage);
            blogMessageDiv1.setStatus(sendmsg.getStatus());
            blogMessageDiv1.setTime(sendmsg.getTime());
            blogMessageDiv1.setContent(sendmsg.getContent());
            blogMessageDiv1.setId(sendmsg.getId());
            blogMessageDiv1.setUserid(sendmsg.getUserid());
            blogMessageDiv1.setName(blogUser.getName());
            return blogMessageDiv1;
        }
        return null;
    }


}
