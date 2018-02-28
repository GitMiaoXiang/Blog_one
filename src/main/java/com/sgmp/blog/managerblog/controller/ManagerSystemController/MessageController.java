package com.sgmp.blog.managerblog.controller.ManagerSystemController;

import com.sgmp.blog.managerblog.controller.Msg;
import com.sgmp.blog.managerblog.javabean.BlogMessageCustom;
import com.sgmp.blog.managerblog.pojo.BlogMessage;
import com.sgmp.blog.managerblog.pojo.BlogMsgreply;
import com.sgmp.blog.managerblog.serviceimpl.BlogCommentServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogMessageServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogMsgReplyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/manager/message")
public class MessageController {

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogMsgReplyServiceImpl blogMsgReplyService;

    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    /**
     * 跳转未读留言
     * @param model
     * @return
     */
    @RequestMapping(value = "/message_findall.html")
    public String aritlcefindall(Model model) throws Exception {
        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);

        /**
         * 查询留言回复
         */
        List<BlogMessageCustom> querybystatuesdesc = blogMessageService.querybystatuesdesc();
        model.addAttribute("message",querybystatuesdesc);
        return "/manager/message";
    }

    @RequestMapping(value = "/sendmsgmanager",method = RequestMethod.POST)
    @ResponseBody
    public Msg sendmsgrepalymanager(BlogMsgreply blogMsgreply){
        blogMsgreply.setFromuserid(2);
        blogMsgreply.setTime(new Date());
        blogMsgreply.setTouserid(2);
        Integer save = blogMsgReplyService.getMapper().insertUseGeneratedKeys(blogMsgreply);
        if(save==1){
            BlogMessage blogMessage = new BlogMessage();
            blogMessage.setStatus("0");
            blogMessage.setTime(null);
            blogMessage.setContent(null);
            blogMessage.setId(blogMsgreply.getMessageid());
            blogMessage.setUserid(null);
            Integer integer = blogMessageService.updateSlective(blogMessage);
            if(integer==1){
                return Msg.success();
            }else{
                return Msg.fail();
            }
        }
        return Msg.fail();
    }


}
