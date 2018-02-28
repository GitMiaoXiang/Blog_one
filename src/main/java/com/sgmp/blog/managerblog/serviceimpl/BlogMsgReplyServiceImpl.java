package com.sgmp.blog.managerblog.serviceimpl;

import com.sgmp.blog.managerblog.dao.BlogMsgreplyMapper;
import com.sgmp.blog.managerblog.javabean.BlogMsgRepalyCustom;
import com.sgmp.blog.managerblog.pojo.BlogMsgreply;
import com.sgmp.blog.managerblog.pojo.BlogUser;
import com.sgmp.blog.managerblog.sampleconfigmybatis.BaseDao;
import com.sgmp.blog.managerblog.servicedao.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

@Service
public class BlogMsgReplyServiceImpl extends BaseService<BlogMsgreply>{

    @Autowired
    private BlogMsgreplyMapper blogMsgreplyMapper;

    @Autowired
    private BlogUserServiceImpl blogUserService;

    @Override
    public BaseDao<BlogMsgreply> getMapper() {
        return this.blogMsgreplyMapper;
    }

    public List<BlogMsgRepalyCustom> queryforname() {
        List<BlogMsgreply> select = getMapper().select(null);
        List<BlogMsgRepalyCustom> list=new ArrayList<>();
        for (BlogMsgreply blogMsgreply:select) {
            BlogMsgRepalyCustom blogMsgRepalyCustom = new BlogMsgRepalyCustom();
            BlogUser blogUser = blogUserService.queryId(blogMsgreply.getFromuserid());
            BlogUser blogUser1 = blogUserService.queryId(blogMsgreply.getTouserid());
            blogMsgRepalyCustom.setFromname(blogUser.getName());
            blogMsgRepalyCustom.setToname(blogUser1.getName());
            blogMsgRepalyCustom.setReplyid(blogMsgreply.getReplyid());
            blogMsgRepalyCustom.setMessageid(blogMsgreply.getMessageid());
            blogMsgRepalyCustom.setId(blogMsgreply.getId());
            blogMsgRepalyCustom.setContent(blogMsgreply.getContent());
            blogMsgRepalyCustom.setTime(blogMsgreply.getTime());
            list.add(blogMsgRepalyCustom);
        }
        return list;
    }

    public List<BlogMsgreply> querymsgid(Integer id){
        Example example = new Example(BlogMsgreply.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("messageid",id);
        List<BlogMsgreply> blogMsgreplies = getMapper().selectByExample(example);
        return blogMsgreplies;
    }
}
