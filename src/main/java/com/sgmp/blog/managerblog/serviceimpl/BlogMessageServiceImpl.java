package com.sgmp.blog.managerblog.serviceimpl;

import com.sgmp.blog.managerblog.dao.BlogMessageMapper;
import com.sgmp.blog.managerblog.javabean.BlogMessageCustom;
import com.sgmp.blog.managerblog.javabean.BlogMessageDiv;
import com.sgmp.blog.managerblog.javabean.BlogMsgRepalyCustom;
import com.sgmp.blog.managerblog.pojo.BlogMessage;
import com.sgmp.blog.managerblog.pojo.BlogMsgreply;
import com.sgmp.blog.managerblog.pojo.BlogUser;
import com.sgmp.blog.managerblog.sampleconfigmybatis.BaseDao;
import com.sgmp.blog.managerblog.servicedao.BaseService;
import com.sgmp.blog.managerblog.utils.getDifferenceTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class BlogMessageServiceImpl extends BaseService<BlogMessage>{

    @Autowired
    private BlogMessageMapper blogMessageMapper;
    @Autowired
    private BlogMsgReplyServiceImpl blogMsgReplyService;

    @Autowired
    private BlogUserServiceImpl blogUserService;

    @Override
    public BaseDao<BlogMessage> getMapper() {
        return this.blogMessageMapper;
    }

    /**
     * 查询留言条数
     */
    public Integer count() {
        int count = getMapper().selectCount(null);
        return count;
    }

    /**
     * 添加留言
     * @param blogMessage
     */
    public BlogMessage sendmsg(BlogMessage blogMessage) {
        blogMessage.setTime(new Date());
        blogMessage.setStatus("1");
        int i = blogMessageMapper.insertUseGeneratedKeys(blogMessage);
        if(i==1){
            BlogMessage blogMessage1 = queryId(blogMessage.getId());
            return blogMessage1;
        }
        return null;
    }

    /**
     * 根据留言时间排序,第一按状态降序，第二按照时间降序
     */
    public List<BlogMessageCustom> querybystatuesdesc() throws Exception{
        Example example = new Example(BlogMessage.class);
        example.setOrderByClause("status desc,time desc");
        List<BlogMessage> blogMessages = this.getMapper().selectByExample(example);
        List<BlogMessageCustom> blogMessageCustoms=new ArrayList<BlogMessageCustom>();
        String timeFormat="yy-MM-dd:HH:mm:ss";
        DateFormat format = new SimpleDateFormat(timeFormat);
        for (BlogMessage blogMessage:blogMessages) {
            String time= format.format(new Date());
            String commenttime=format.format(blogMessage.getTime());
            BlogMessageCustom blogMessageCustom=new BlogMessageCustom();
            blogMessageCustom.setFormtdate(getDifferenceTime.getDifferenceTime(time,commenttime,timeFormat));
            blogMessageCustom.setTime(blogMessage.getTime());
            blogMessageCustom.setUserid(blogMessage.getUserid());
            blogMessageCustom.setContent(blogMessage.getContent());
            blogMessageCustom.setId(blogMessage.getId());
            blogMessageCustom.setStatus(blogMessage.getStatus());
            List<BlogMsgreply> msgreplies = blogMsgReplyService.querymsgid(blogMessage.getId());
            List<BlogMsgRepalyCustom> blogMsgRepalyCustoms=new ArrayList<>();
                for (BlogMsgreply blogMsgreply:msgreplies) {
                    BlogMsgRepalyCustom blogMsgRepalyCustom = new BlogMsgRepalyCustom();
                    String time1=format.format(new Date());
                    String ommenttime1=format.format(blogMsgreply.getTime());
                    blogMsgRepalyCustom.setFonttime(getDifferenceTime.getDifferenceTime(time1,ommenttime1,timeFormat));
                    blogMsgRepalyCustom.setFromuserid(blogMsgreply.getFromuserid());
                    blogMsgRepalyCustom.setTouserid(blogMsgreply.getTouserid());
                    blogMsgRepalyCustom.setContent(blogMsgreply.getContent());
                    blogMsgRepalyCustom.setId(blogMsgreply.getId());
                    blogMsgRepalyCustom.setMessageid(blogMsgreply.getMessageid());
                    blogMsgRepalyCustom.setReplyid(blogMsgreply.getReplyid());
                    blogMsgRepalyCustoms.add(blogMsgRepalyCustom);
                }
                blogMessageCustom.setMsgreplie(blogMsgRepalyCustoms);
                blogMessageCustoms.add(blogMessageCustom);
            }

        return blogMessageCustoms;
    }

    /**
     * 查询未读留言数
     */
    public Integer querycount() {
        Example example = new Example(BlogMessage.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("status","1");
        Integer i = this.getMapper().selectCountByExample(example);
        return  i;
    }

    /**
     * 查询留言回复更改名字
     * @return
     */
    public List<BlogMessageDiv> queryforname() {
        List<BlogMessage> query = query();
        List<BlogMessageDiv> list=new ArrayList<>();
        for (BlogMessage blogMessage:query) {
            BlogMessageDiv blogMessageDiv = new BlogMessageDiv();
            BlogUser blogUser = blogUserService.queryId(blogMessage.getUserid());
            blogMessageDiv.setName(blogUser.getName());
            blogMessageDiv.setId(blogMessage.getId());
            blogMessageDiv.setContent(blogMessage.getContent());
            blogMessageDiv.setTime(blogMessage.getTime());
            blogMessageDiv.setStatus(blogMessage.getStatus());
            list.add(blogMessageDiv);
        }
        return list;
    }
}
