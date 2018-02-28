package com.sgmp.blog.managerblog.controller;

import com.sgmp.blog.managerblog.pojo.BlogCmtreply;
import com.sgmp.blog.managerblog.pojo.BlogComment;
import com.sgmp.blog.managerblog.serviceimpl.BlogCmtrepalyServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogCommentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/web")
public class BlogCmtRepalyController {

    @Autowired
    private BlogCmtrepalyServiceImpl blogCmtrepalyService;

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @PostMapping(value = "{arid}/{ids}/{type}/sendrepaly")
    @ResponseBody
    public BlogCmtreply sendrepaly(@PathVariable(value = "arid") String arid, @PathVariable(value = "ids") String ids, @PathVariable(value = "type") String type, BlogCmtreply blogCmtreply){
        if(type.equals("repalyid")){
            BlogCmtreply querybycmid = blogCmtrepalyService.queryId(Integer.parseInt(ids));
            blogCmtreply.setCommentid(querybycmid.getCommentid());
            blogCmtreply.setRepalyid(querybycmid.getId());
            blogCmtreply.setTouserid(querybycmid.getFromuserid());
        }else if(type.equals("commentid")){
            BlogComment blogComment = blogCommentService.queryId(Integer.parseInt(ids));
            blogCmtreply.setCommentid(blogComment.getId());
            blogCmtreply.setTouserid(blogComment.getUserid());
        }
        BlogCmtreply sendrepalylist = blogCmtrepalyService.sendrepalylist(blogCmtreply);
        if(sendrepalylist!=null){
            return sendrepalylist;
        }
        return null;
    }
}
