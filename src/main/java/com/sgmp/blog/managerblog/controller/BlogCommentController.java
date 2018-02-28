package com.sgmp.blog.managerblog.controller;

import com.sgmp.blog.managerblog.javabean.BlogDivComment;
import com.sgmp.blog.managerblog.pojo.BlogComment;
import com.sgmp.blog.managerblog.pojo.BlogCommentCustom;
import com.sgmp.blog.managerblog.pojo.BlogUser;
import com.sgmp.blog.managerblog.serviceimpl.BlogCommentServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/web/comment")
public class BlogCommentController {

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogUserServiceImpl blogUserService;
    /**
     * 查询所有评论
     * @return
     */
    @GetMapping(value = "/query")
    @ResponseBody
    public ResponseEntity<List<BlogCommentCustom>> queryarticclereplay(){
        List<BlogCommentCustom> queryarticclereplay = blogCommentService.queryarticclereplay();
        /*for (BlogCommentCustom blogCommentCustoms:queryarticclereplay) {
        }*/
        if(!queryarticclereplay.isEmpty()){
            return ResponseEntity.ok(queryarticclereplay);
        }
         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }

    /**
     * 刷新jsp
     * @param blogComment
     * @return
     */
    /*@PostMapping(value = "/sendcomment")
    public String sendComment(BlogComment blogComment){
        blogComment.setUserid(2);
        blogComment.setTime(new Date());
        Boolean sendComment = blogCommentService.sendComment(blogComment);
        if(sendComment){
            return "redirect:/"+blogComment.getArticleid()+"/comment.html";
        }
        return "comment";
    }*/

    /**
     * 刷新div
     * @param blogComment
     * @return
     */
    @PostMapping(value = "/sendcomment")
    @ResponseBody
    public BlogDivComment sendComment(@Valid BlogComment blogComment, @Valid BlogUser user, BindingResult result){
        BlogDivComment blogDivComment;
        if(blogComment.getContent()==null||blogComment.getContent()==""){
            Map<String,Object> map=new HashMap<>();
            map.put("content","内容不能为空。");
            blogDivComment=new BlogDivComment();
            blogDivComment.setMap(map);
            return blogDivComment;
        }
        if(result.hasErrors()){
            Map<String,Object> map=new HashMap<>();
            List<FieldError> fieldError = result.getFieldErrors();
            for (FieldError fieldError1:fieldError) {
                map.put(fieldError1.getField(),fieldError1.getDefaultMessage());
            }
            blogDivComment=new BlogDivComment();
            blogDivComment.setMap(map);
            return blogDivComment;
        }else {
            user.setStatus("1");
            user.setCreatedate(new Date());
            int i = blogUserService.getMapper().insertUseGeneratedKeys(user);
            if (i == 1) {
                blogComment.setUserid(user.getId());
                blogComment.setTime(new Date());
                blogComment.setStatus("1");
                BlogComment blogComment1 = blogCommentService.sendComment(blogComment);
                if (blogComment1 != null) {
                    blogDivComment = new BlogDivComment();
                    blogDivComment.setArticleid(blogComment1.getArticleid());
                    blogDivComment.setContentz(blogComment1.getContent());
                    blogDivComment.setId(blogComment1.getId());
                    blogDivComment.setTime(blogComment1.getTime());
                    blogDivComment.setUserid(blogComment1.getUserid());
                    return blogDivComment;
                }
            }
        }
        return null;
    }
}
