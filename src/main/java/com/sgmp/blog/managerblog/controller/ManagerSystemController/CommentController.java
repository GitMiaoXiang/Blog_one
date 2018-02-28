package com.sgmp.blog.managerblog.controller.ManagerSystemController;

import com.sgmp.blog.managerblog.controller.Msg;
import com.sgmp.blog.managerblog.javabean.BlogCommentCustom;
import com.sgmp.blog.managerblog.pojo.BlogCmtreply;
import com.sgmp.blog.managerblog.pojo.BlogComment;
import com.sgmp.blog.managerblog.serviceimpl.BlogCmtrepalyServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogCommentServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogMessageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/manager/comment")
public class CommentController {


    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogCmtrepalyServiceImpl blogCmtrepalyService;

    /**
     * 跳转未读评论
     * @param model
     * @return
     */
    @RequestMapping(value = "/comment_findall.html")
    public String aritlcefindall(Model model){
        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);
        /**
         * 查询所有评论回复
         */
        List<BlogCommentCustom> blogComments = blogCommentService.querybystatus();
        model.addAttribute("comment",blogComments);
        return "/manager/comment";
    }

    @RequestMapping(value = "/sendcomentmanager",method = RequestMethod.POST)
    @ResponseBody
    public Msg sendcomentmanager(BlogCmtreply blogCmtreply){
        blogCmtreply.setFromuserid(2);
        blogCmtreply.setTime(new Date());
        Integer save = blogCmtrepalyService.getMapper().insertUseGeneratedKeys(blogCmtreply);
        if(save==1){
            BlogComment blogComment = new BlogComment();
            blogComment.setArticleid(null);
            blogComment.setStatus("0");
            blogComment.setTime(null);
            blogComment.setUserid(null);
            blogComment.setContent(null);
            blogComment.setId(blogCmtreply.getCommentid());
            Integer integer = blogCommentService.updateSlective(blogComment);
            if(integer==1){
                return Msg.success();
            }else {
                return Msg.fail();
            }
        }
        return Msg.fail();
    }
}
