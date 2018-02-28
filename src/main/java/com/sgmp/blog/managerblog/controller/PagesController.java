package com.sgmp.blog.managerblog.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.pagehelper.PageInfo;
import com.sgmp.blog.managerblog.javabean.BlogArticleCustom;
import com.sgmp.blog.managerblog.javabean.BlogCategoryCustom;
import com.sgmp.blog.managerblog.javabean.BlogMessageDiv;
import com.sgmp.blog.managerblog.javabean.BlogMsgRepalyCustom;
import com.sgmp.blog.managerblog.pojo.*;
import com.sgmp.blog.managerblog.serviceimpl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/web")
public class PagesController {

    @Autowired
    private BlogCategoryServiceImpl blogCategoryService;

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogImagesServiceImpl bLogImagesServie;

    @Autowired
    private BlogArticleServieImpl blogArticleService;

    @Autowired
    private BlogCmtrepalyServiceImpl blogCmtrepalyService;

    @Autowired
    private BlogImagesServiceImpl blogImagesService;

    @Autowired
    private BlogTagServiceImpl blogTagService;

    @Autowired
    private BlogTagMapServiceImpl blogTagMapService;

    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    @Autowired
    private BlogMsgReplyServiceImpl blogMsgReplyService;

    /**
     * 跳转首页
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/index.html")
    public String index(Model model,@RequestParam(value = "taid",defaultValue = "") Integer tagid,@RequestParam(value = "caid",defaultValue = "") Integer caid, @RequestParam(value = "page",defaultValue = "1") Integer page) throws JsonProcessingException {
        /**
         * 查询栏目
         */
        List<BlogCategory> categories = blogCategoryService.querydelindexz();
        model.addAttribute("category", categories);
        /**
         * 查询文章，并查询总记录数和文章图片
         */
        List<BlogArticleCustom> blogArticleCustoms = new ArrayList<>();
        BlogArticle blogArticle1=new BlogArticle();
        blogArticle1.setCategory(caid);
        blogArticle1.setUpdownframe("1");
        PageInfo<BlogArticle> blogArticlePageInfo = blogArticleService.queryPageListByWhere(blogArticle1, page, 3);
        for (BlogArticle blogArticle:blogArticlePageInfo.getList()) {
                BlogArticleCustom blogArticleCustom = new BlogArticleCustom();
                blogArticleCustom.setCount(blogCommentService.count(blogArticle.getId()));
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
                blogArticleCustoms.add(blogArticleCustom);
        }
        PageInfo<BlogArticleCustom> blogArticleCustomPageInfo=new PageInfo<>(blogArticleCustoms);
        blogArticleCustomPageInfo.setHasNextPage(blogArticlePageInfo.isHasNextPage());
        blogArticleCustomPageInfo.setHasPreviousPage(blogArticlePageInfo.isHasPreviousPage());
        blogArticleCustomPageInfo.setNavigatepageNums(blogArticlePageInfo.getNavigatepageNums());
        blogArticleCustomPageInfo.setPageNum(blogArticlePageInfo.getPageNum());
        blogArticleCustomPageInfo.setList(blogArticleCustoms);
        model.addAttribute("article", blogArticleCustomPageInfo );

        /**
         * 查询最近文章
         */
        List<BlogArticleCustom> querybydatatime = blogArticleService.querybydatatime();
        model.addAttribute("articletime",querybydatatime);

        /**
         * 查询文章归档（如：java(6)）
         */
        List<BlogCategoryCustom> querybycategroid = blogArticleService.querybycategroid(3);
        model.addAttribute("categorycount",querybycategroid);

        /**
         * 查询标签
         */
        List<BlogTag> tags = blogTagService.query();
        model.addAttribute("tag",tags);
        return "index";
    }

    /**
     * 跳转文章详情
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "{arid}/{categroy}/detaliAr.html")
    public String detailAr(@PathVariable(value = "arid") String arid,@PathVariable(value = "categroy") String caid, Model model) throws JsonProcessingException {
        List<BlogCategory> categories = blogCategoryService.querydelindexz();
        model.addAttribute("category", categories);
        /**
         * 根据id查询文章，并查询总记录数和文章图片
         */
        BlogArticleCustom blogArticleCustom = new BlogArticleCustom();
        BlogArticle blogArticleWithBLOBs=blogArticleWithBLOBs = blogArticleService.queryIds(arid);
        blogArticleCustom.setCount(blogCommentService.count(blogArticleWithBLOBs.getId()));
        List<BlogImages> images = bLogImagesServie.querybyarid(blogArticleWithBLOBs.getId());
        for (BlogImages blogImages : images) {
            blogArticleCustom.setSrc(blogImages.getSrc());
        }
        blogArticleCustom.setCategory(blogArticleWithBLOBs.getCategory());
        blogArticleCustom.setCkickcount(blogArticleWithBLOBs.getCkickcount());
        blogArticleCustom.setContent(blogArticleWithBLOBs.getContent());
        blogArticleCustom.setCreatedate(blogArticleWithBLOBs.getCreatedate());
        blogArticleCustom.setDescz(blogArticleWithBLOBs.getDescz());
        blogArticleCustom.setId(blogArticleWithBLOBs.getId());
        blogArticleCustom.setIsrecommend(blogArticleWithBLOBs.getIsrecommend());
        blogArticleCustom.setTags(blogArticleWithBLOBs.getTags());
        blogArticleCustom.setTitle(blogArticleWithBLOBs.getTitle());
        blogArticleCustom.setUpdatedate(blogArticleWithBLOBs.getUpdatedate());
        model.addAttribute("article", blogArticleCustom);

        /**
         * 查询相关文章
         */
        List<BlogArticleCustom> blogArticleCustomsbyid = new ArrayList<>();
        List<BlogArticle> query = blogArticleService.querybycaid(caid);
        for (BlogArticle blogArticleWithBLOBsbycaid : query) {
            BlogArticleCustom blogArticleCustombycaid = new BlogArticleCustom();
            blogArticleCustombycaid.setCount(blogCommentService.count(blogArticleWithBLOBsbycaid.getId()));
            List<BlogImages> imagesbycaid = bLogImagesServie.querybyarid(blogArticleWithBLOBsbycaid.getId());
            for (BlogImages blogImages : imagesbycaid) {
                blogArticleCustombycaid.setSrc(blogImages.getSrc());
            }
            blogArticleCustombycaid.setCategory(blogArticleWithBLOBsbycaid.getCategory());
            blogArticleCustombycaid.setCkickcount(blogArticleWithBLOBsbycaid.getCkickcount());
            blogArticleCustombycaid.setContent(blogArticleWithBLOBsbycaid.getContent());
            blogArticleCustombycaid.setCreatedate(blogArticleWithBLOBsbycaid.getCreatedate());
            blogArticleCustombycaid.setDescz(blogArticleWithBLOBsbycaid.getDescz());
            blogArticleCustombycaid.setId(blogArticleWithBLOBsbycaid.getId());
            blogArticleCustombycaid.setIsrecommend(blogArticleWithBLOBsbycaid.getIsrecommend());
            blogArticleCustombycaid.setTags(blogArticleWithBLOBsbycaid.getTags());
            blogArticleCustombycaid.setTitle(blogArticleWithBLOBsbycaid.getTitle());
            blogArticleCustombycaid.setUpdatedate(blogArticleWithBLOBsbycaid.getUpdatedate());
            blogArticleCustomsbyid.add(blogArticleCustombycaid);
        }
        model.addAttribute("articlebaid",blogArticleCustomsbyid);
        /**
         * 查询评论和回复
         */
        List<BlogComment> querybyarid = blogCommentService.querybyarid(arid);
        List<BlogCmtreply> blogCmtreplies = blogCmtrepalyService.query();
        model.addAttribute("blogcomment",querybyarid);
        model.addAttribute("blogcmtrepaly",blogCmtreplies);

        /**
         * 查询最近文章
         */
        List<BlogArticleCustom> querybydatatime = blogArticleService.querybydatatime();
        model.addAttribute("articletime",querybydatatime);

        /**
         * 查询文章归档（如：java(6)）
         */
        List<BlogCategoryCustom> querybycategroid = blogArticleService.querybycategroid(3);
        model.addAttribute("categorycount",querybycategroid);

        /**
         * 查询标签
         */
        List<BlogTag> tags = blogTagService.query();
        model.addAttribute("tag",tags);
        return "article_detail";
    }

    /**
     * 跳转标签详情页
     */
    @RequestMapping(value = "{tagname}/{tagid}/tag.html")
    public String tagdeatail(Model model,@PathVariable(value = "tagid") Integer tagid,@PathVariable(value = "tagname") String name) throws JsonProcessingException {
        /**
         * 查询栏目
         */
        List<BlogCategory> categories = blogCategoryService.querydelindexz();
        model.addAttribute("category", categories);

        /**
         * 查询最近文章
         */
        List<BlogArticleCustom> querybydatatime = blogArticleService.querybydatatime();
        model.addAttribute("articletime",querybydatatime);

        /**
         * 查询文章归档（如：java(6)）
         */
        List<BlogCategoryCustom> querybycategroid = blogArticleService.querybycategroid(3);
        model.addAttribute("categorycount",querybycategroid);

        /**
         * 查询标签
         */
        List<BlogTag> tags = blogTagService.query();
        model.addAttribute("tag",tags);
        List<BlogArticle> articleList=new ArrayList<>();
        List<BlogArticleCustom> blogArticleCustoms=new ArrayList<>();
        List<BlogTagmap> querybytagid = blogTagMapService.querybytagid(tagid);
        for (BlogTagmap blogTagmap:querybytagid) {
            BlogArticle blogArticle = blogArticleService.queryIds(blogTagmap.getArid());
            articleList.add(blogArticle);
        }
        for (BlogArticle blogArticle:articleList) {
            BlogArticleCustom blogArticleCustombycaid = new BlogArticleCustom();
            blogArticleCustombycaid.setCount(blogCommentService.count(blogArticle.getId()));
            List<BlogImages> imagesbycaid = bLogImagesServie.querybyarid(blogArticle.getId());
            for (BlogImages blogImages : imagesbycaid) {
                blogArticleCustombycaid.setSrc(blogImages.getSrc());
            }
            blogArticleCustombycaid.setCategory(blogArticle.getCategory());
            blogArticleCustombycaid.setCkickcount(blogArticle.getCkickcount());
            blogArticleCustombycaid.setContent(blogArticle.getContent());
            blogArticleCustombycaid.setCreatedate(blogArticle.getCreatedate());
            blogArticleCustombycaid.setDescz(blogArticle.getDescz());
            blogArticleCustombycaid.setId(blogArticle.getId());
            blogArticleCustombycaid.setIsrecommend(blogArticle.getIsrecommend());
            blogArticleCustombycaid.setTags(blogArticle.getTags());
            blogArticleCustombycaid.setTitle(blogArticle.getTitle());
            blogArticleCustombycaid.setUpdatedate(blogArticle.getUpdatedate());
            blogArticleCustoms.add(blogArticleCustombycaid);
        }
        model.addAttribute("article",blogArticleCustoms);
        model.addAttribute("tagname",name);
        return "tag_detail";
    }

    /**
     * 跳转画廊
     *
     * @return
     */
    @RequestMapping(value = "/gallery.html")
    public String gallery(Model model) throws JsonProcessingException {
        /**
         * 导航
         */
        List<BlogCategory> categories = blogCategoryService.querydelindexz();
        model.addAttribute("category", categories);
        /**
         * 查询相册
         */
        List<BlogImages> query = blogImagesService.querybygallery("1");
        model.addAttribute("ImagesGallery",query);
        return "gallery";
    }

    /**
     * 跳转留言
     * @param model
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping(value = "/message.html")
    public String message(Model model) throws JsonProcessingException {
        List<BlogCategory> categories = blogCategoryService.querydelindexz();
        model.addAttribute("category", categories);
        /**
         * 查询最近文章
         */
        List<BlogArticleCustom> querybydatatime = blogArticleService.querybydatatime();
        model.addAttribute("articletime",querybydatatime);

        /**
         * 查询文章归档（如：java(6)）
         */
        List<BlogCategoryCustom> querybycategroid = blogArticleService.querybycategroid(3);
        model.addAttribute("categorycount",querybycategroid);

        /**
         * 查询标签
         */
        List<BlogTag> tags = blogTagService.query();
        model.addAttribute("tag",tags);

        /**
         * 查询留言内容
         */
        List<BlogMessageDiv> queryforname1 = blogMessageService.queryforname();
        List<BlogMsgRepalyCustom> queryforname = blogMsgReplyService.queryforname();
        Integer count = blogMessageService.count();
        model.addAttribute("message",queryforname1);
        model.addAttribute("msgreply",queryforname);
        model.addAttribute("count",count);
        return "message";
    }


    /**
     * 跳转评论
     * @param arid
     * @param model
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping(value = "{arid}/comment.html")
    public String comment(@PathVariable(value = "arid") String arid, Model model) throws JsonProcessingException {
        List<BlogComment> querybyarid = blogCommentService.querybyarid(arid);
        List<BlogCmtreply> blogCmtreplies = blogCmtrepalyService.query();
        model.addAttribute("blogcomment",querybyarid);
        model.addAttribute("blogcmtrepaly",blogCmtreplies);
        return "comment";
    }
}
