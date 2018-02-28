package com.sgmp.blog.managerblog.controller.ManagerSystemController;

import com.github.pagehelper.PageInfo;
import com.sgmp.blog.managerblog.controller.Msg;
import com.sgmp.blog.managerblog.javabean.BlogArticleCustom;
import com.sgmp.blog.managerblog.pojo.BlogArticle;
import com.sgmp.blog.managerblog.pojo.BlogCategory;
import com.sgmp.blog.managerblog.pojo.BlogComment;
import com.sgmp.blog.managerblog.pojo.BlogImages;
import com.sgmp.blog.managerblog.serviceimpl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/manager/article")
public class ArticleController {

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    @Autowired
    private BlogArticleServieImpl blogArticleServie;

    @Autowired
    private BlogCategoryServiceImpl blogCategoryService;

    @Autowired
    private BlogImagesServiceImpl blogImagesService;

    @Autowired
    private BlogCmtrepalyServiceImpl blogCmtrepalyService;

    @RequestMapping(value = "{caid}/article_findall.html")
    public String aritlcefindall(Model model, @PathVariable(value = "caid") Integer caid,@RequestParam(value = "page",defaultValue = "1") Integer page){
        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);
        /**
         * 查询栏目数
         */
        BlogCategory blogCategory = new BlogCategory();
        blogCategory.setIndexz(3);
        List<BlogCategory> categories = blogCategoryService.queryListbyWhere(blogCategory);
        model.addAttribute("category",categories);

        //当前栏目
        Integer caidnum=null;
        /**
         * 查询文章
         */
        List<BlogArticleCustom> blogArticleCustoms = new ArrayList<>();
        BlogArticle blogArticle1=new BlogArticle();
        if(caid==0){
            caidnum=0;
        }
        if(!caid.equals(0)){
            blogArticle1.setCategory(caid);
        }
        PageInfo<BlogArticle> blogArticlePageInfo = blogArticleServie.queryPageListByWhere(blogArticle1, page, 6);
        for (BlogArticle blogArticle:blogArticlePageInfo.getList()) {
            BlogArticleCustom blogArticleCustom = new BlogArticleCustom();
            blogArticleCustom.setCount(blogCommentService.count(blogArticle.getId()));
            BlogComment blogComment=new BlogComment();
            blogComment.setArticleid(blogArticle.getId());
            List<BlogComment> blogComments = blogCommentService.queryListbyWhere(blogComment);
            //查询评论回复数
            Integer cmtnumber=0;
            for (BlogComment blogComment1:blogComments) {
                cmtnumber=cmtnumber+blogCmtrepalyService.count(blogComment1.getId());
            }
            blogArticleCustom.setCmtcount(cmtnumber);
            List<BlogImages> images = blogImagesService.querybyarid(blogArticle.getId());
            for (BlogImages blogImages : images) {
                blogArticleCustom.setSrc(blogImages.getSrc());
            }
            blogArticleCustom.setCategory(blogArticle.getCategory());
            blogArticleCustom.setCkickcount(blogArticle.getCkickcount());
            blogArticleCustom.setContent(blogArticle.getContent());
            blogArticleCustom.setCreatedate(blogArticle.getCreatedate());
            blogArticleCustom.setDescz(blogArticle.getDescz());
            blogArticleCustom.setId(blogArticle.getId());
            blogArticleCustom.setIsrecommend(blogArticle.getIsrecommend());
            blogArticleCustom.setTags(blogArticle.getTags());
            blogArticleCustom.setTitle(blogArticle.getTitle());
            blogArticleCustom.setUpdatedate(blogArticle.getUpdatedate());
            blogArticleCustom.setUpdownframe(blogArticle.getUpdownframe());
            blogArticleCustoms.add(blogArticleCustom);
            caidnum=blogArticleCustom.getCategory();
        }
        PageInfo<BlogArticleCustom> blogArticleCustomPageInfo=new PageInfo<>(blogArticleCustoms);
        blogArticleCustomPageInfo.setHasNextPage(blogArticlePageInfo.isHasNextPage());
        blogArticleCustomPageInfo.setHasPreviousPage(blogArticlePageInfo.isHasPreviousPage());
        blogArticleCustomPageInfo.setNavigatepageNums(blogArticlePageInfo.getNavigatepageNums());
        blogArticleCustomPageInfo.setPageNum(blogArticlePageInfo.getPageNum());
        blogArticleCustomPageInfo.setList(blogArticleCustoms);
        model.addAttribute("num",blogArticlePageInfo.getPageNum());
        model.addAttribute("article", blogArticleCustomPageInfo);
        model.addAttribute("caidnum",caidnum);
        if(caid==0){
            model.addAttribute("canumber",0);
        }else{
            model.addAttribute("canumber",caid);
        }
        /**
         * 查询评论数和回复数
         */
        return "/manager/article";
    }

    /**
     * 跳转文章增加页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/article_add.html")
    public String articleadd(Model model,@RequestParam(value = "articleid") String arid){
        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);

        BlogCategory blogCategory = new BlogCategory();
        blogCategory.setIndexz(3);
        List<BlogCategory> categories = blogCategoryService.queryListbyWhere(blogCategory);
        model.addAttribute("category",categories);
        /**
         * 更新
         */
        if(arid!=null&&arid.length()>=0&&arid!=""&&!arid.equals("0")){
            BlogArticle blogArticle = blogArticleServie.queryIds(arid);
            BlogArticleCustom blogArticleCustom = new BlogArticleCustom();
            blogArticleCustom.setTitle(blogArticle.getTitle());
            blogArticleCustom.setIsrecommend(blogArticle.getIsrecommend());
            blogArticleCustom.setContent(blogArticle.getContent());
            blogArticleCustom.setCategory(blogArticle.getCategory());
            List<BlogImages> images = blogImagesService.querybyarid(blogArticle.getId());
            for (BlogImages blogImages : images) {
                blogArticleCustom.setSrc(blogImages.getSrc());
            }
            blogArticleCustom.setId(blogArticle.getId());
            blogArticleCustom.setDescz(blogArticle.getDescz());
            blogArticleCustom.setTags(blogArticle.getTags());
            model.addAttribute("article",blogArticleCustom);
            return "/manager/article_add";
        }else{
            return "/manager/article_add";
        }
    }

    /**
     * 添加博文或更新
     * @param blogArticle
     * @param images
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public Msg savearticle(BlogArticle blogArticle,MultipartFile images) throws Exception {

        boolean saveandimages = blogArticleServie.saveandimages(blogArticle, images);
        if(saveandimages){
            return Msg.success();
        }
        return Msg.fail();
    }

    /**
     * 置顶和取消置顶
     * @param isrecommend
     * @param arid
     * @return
     */
    @RequestMapping(value = "{zhiding}/{arid}/zhiding",method=RequestMethod.PUT)
    @ResponseBody
    public Msg zhiding(@PathVariable(value = "zhiding") String isrecommend,@PathVariable(value = "arid") String arid){
        BlogArticle blogArticle = new BlogArticle();
        blogArticle.setUpdatedate(new Date());
        blogArticle.setCkickcount(null);
        blogArticle.setCreatedate(null);
        blogArticle.setId(arid);
        blogArticle.setCategory(null);
        blogArticle.setContent(null);
        blogArticle.setDescz(null);
        blogArticle.setIsrecommend(isrecommend);
        blogArticle.setUpdownframe(null);
        blogArticle.setTags(null);
        blogArticle.setTitle(null);
        Integer integer = blogArticleServie.updateSlective(blogArticle);
        if(integer==1){
            return Msg.success();
        }
        return Msg.fail();
    }

    /**
     * 上架或下架
     * @param updown
     * @param arid
     * @return
     */
    @RequestMapping(value = "{updown}/{arid}/updowm",method=RequestMethod.PUT)
    @ResponseBody
    public Msg updown(@PathVariable(value = "updown") String updown,@PathVariable(value = "arid") String arid){
        BlogArticle blogArticle = new BlogArticle();
        blogArticle.setUpdatedate(new Date());
        blogArticle.setCkickcount(null);
        blogArticle.setCreatedate(null);
        blogArticle.setId(arid);
        blogArticle.setCategory(null);
        blogArticle.setContent(null);
        blogArticle.setDescz(null);
        blogArticle.setIsrecommend(null);
        blogArticle.setUpdownframe(updown);
        blogArticle.setTags(null);
        blogArticle.setTitle(null);
        Integer integer = blogArticleServie.updateSlective(blogArticle);
        if(integer==1){
            return Msg.success();
        }
        return Msg.fail();
    }
}
