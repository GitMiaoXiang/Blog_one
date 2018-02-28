package com.sgmp.blog.managerblog.controller.ManagerSystemController;

import com.github.pagehelper.PageInfo;
import com.sgmp.blog.managerblog.controller.Msg;
import com.sgmp.blog.managerblog.pojo.BlogManager;
import com.sgmp.blog.managerblog.serviceimpl.BlogCommentServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogManagerServiceImple;
import com.sgmp.blog.managerblog.serviceimpl.BlogMessageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@Controller
@RequestMapping(value = "/manager/manager")
public class ManagerController {

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    @Autowired
    private BlogManagerServiceImple blogManagerServiceImple;

    @RequestMapping(value = "{status}/manager_findall.html")
    public String aritlcefindall(Model model, @RequestParam(value = "page",defaultValue = "1") Integer page, @PathVariable(value = "status")String status){

        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);
        /**
         * 查询管理员
         */
        BlogManager blogManager = new BlogManager();
        if(status.equals("1")||status.equals("0")){
            blogManager.setStatus(status);
        }
        PageInfo<BlogManager> blogManagerPageInfo = blogManagerServiceImple.queryPageListByWhere(blogManager, page, 10);
        model.addAttribute("manager",blogManagerPageInfo);
        model.addAttribute("status",status);
        return "/manager/manager";
    }

    /**
     * 跳转增加页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/manager_add.html")
    public String articleadd(Model model){

        return "/manager/manager_add";
    }

    /**
     * 增加管理员
     * @param blogManager
     * @return
     */
    @RequestMapping(value = "/savemanager",method = RequestMethod.POST)
    @ResponseBody
    public Msg savemanager(BlogManager blogManager){
        blogManager.setLastlogin(new Date());
        Integer save = blogManagerServiceImple.save(blogManager);
        if(save==1){
            return Msg.success();
        }
        return Msg.fail();
    }
}
