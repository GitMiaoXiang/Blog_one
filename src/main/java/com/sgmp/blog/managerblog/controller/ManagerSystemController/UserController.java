package com.sgmp.blog.managerblog.controller.ManagerSystemController;

import com.github.pagehelper.PageInfo;
import com.sgmp.blog.managerblog.controller.Msg;
import com.sgmp.blog.managerblog.pojo.BlogUser;
import com.sgmp.blog.managerblog.serviceimpl.BlogCommentServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogMessageServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/manager/user")
public class UserController {

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    @Autowired
    private BlogUserServiceImpl blogUserService;

    @RequestMapping(value = "/user_findall.html")
    public String aritlcefindall(Model model, @RequestParam(value = "page",defaultValue = "1")Integer page){
        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);
        PageInfo<BlogUser> blogUserPageInfo = blogUserService.queryPageListByWhere(new BlogUser(), page, 5);
        model.addAttribute("user",blogUserPageInfo);
        return "/manager/user";
    }

    /**
     * 处理异常
     * @param model
     * @return
     */
    @RequestMapping(value = "/{status}/{userid}/yichangchuli")
    public Msg yichangchuli(Model model, @PathVariable(value = "status")String status,@PathVariable(value = "userid")Integer userid){
        BlogUser blogUser=new BlogUser();
        blogUser.setCreatedate(null);
        blogUser.setAvatar(null);
        blogUser.setMailbox(null);
        blogUser.setName(null);
        blogUser.setPwd(null);
        blogUser.setStatus(status);
        blogUser.setId(userid);
        blogUser.setTel(null);
        Integer integer = blogUserService.updateSlective(blogUser);
        if(integer==1){
            return Msg.success();
        }
        return Msg.fail();
    }
}
