package com.sgmp.blog.managerblog.controller.ManagerSystemController;

import com.github.pagehelper.PageInfo;
import com.sgmp.blog.managerblog.controller.Msg;
import com.sgmp.blog.managerblog.pojo.BlogCategory;
import com.sgmp.blog.managerblog.serviceimpl.BlogCategoryServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogCommentServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogMessageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/manager/category")
public class CategoryController {

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    @Autowired
    private BlogCategoryServiceImpl blogCategoryService;

    @RequestMapping(value = "/category_findall.html")
    public String aritlcefindall(Model model, @RequestParam(value = "page",defaultValue = "1")Integer page){
        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);
        PageInfo<BlogCategory> blogCategoryPageInfo = blogCategoryService.queryPageListByWhere(new BlogCategory(), page, 5);
        model.addAttribute("category",blogCategoryPageInfo);
        return "/manager/category";

    }

    /**
     * 跳转栏目增加页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/category_add.html")
    public String articleadd(Model model, @RequestParam(value = "caid",defaultValue = "")Integer caid){
        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);
        if(caid!=null){
            BlogCategory blogCategory = blogCategoryService.queryId(caid);
            model.addAttribute("category",blogCategory);
        }
        return "/manager/category_add";
    }

    /**
     * 添加栏目或导航或更新
     * @param blogCategory
     * @return
     */
    @RequestMapping(value = "/savecategory",method = RequestMethod.POST)
    @ResponseBody
    public Msg savecategory(BlogCategory blogCategory){
        Integer back=0;
        if(blogCategory.getId()!=null){
            if(blogCategory.getIndexz()==null){
                blogCategory.setIndexz(null);
            }
            back = blogCategoryService.updateSlective(blogCategory);
        }else{
            back = blogCategoryService.save(blogCategory);
        }
        if(back==1){
            return Msg.success();
        }
        return Msg.fail();
    }

    @RequestMapping(value = "{caid}/delete",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deletebyid(@PathVariable(value = "caid")Integer caid){
        Integer integer = blogCategoryService.deleteId(caid);
        if(integer==1){
            return Msg.success();
        }
        return Msg.fail();
    }
}
