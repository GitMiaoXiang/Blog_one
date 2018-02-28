package com.sgmp.blog.managerblog.serviceimpl;

import com.sgmp.blog.managerblog.dao.BlogCmtreplyMapper;
import com.sgmp.blog.managerblog.javabean.BlogCommentRepalyCustom;
import com.sgmp.blog.managerblog.pojo.BlogCmtreply;
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
public class BlogCmtrepalyServiceImpl extends BaseService<BlogCmtreply> {

    @Autowired
    private BlogCmtreplyMapper blogCmtreplyMapper;

    @Override
    public BaseDao<BlogCmtreply> getMapper() {
        return this.blogCmtreplyMapper;
    }

    public BlogCmtreply sendrepalylist(BlogCmtreply blogCmtreply) {
        blogCmtreply.setTime(new Date());
        int i =getMapper().insertUseGeneratedKeys(blogCmtreply);
        if(i==1){
            BlogCmtreply querybyreid = super.queryId(blogCmtreply.getId());
            return querybyreid;
        }
         return null;
    }

    /**
     * 查询回复数
     * @param id
     * @return
     */
    public Integer count(Integer id) {
        Example example = new Example(BlogCmtreply.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("commentid",id);
        int i = this.getMapper().selectCountByExample(example);
        return i;
    }

    public List<BlogCommentRepalyCustom> querycommentid(Integer id) {
        Example example = new Example(BlogCmtreply.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("commentid",id);
        List<BlogCmtreply> blogCmtreplies = getMapper().selectByExample(example);
        String timeFormat="yy-MM-dd:HH:mm:ss";
        DateFormat format = new SimpleDateFormat(timeFormat);
        List<BlogCommentRepalyCustom> blogCommentRepalyCustoms=new ArrayList<>();
        for (BlogCmtreply blogCmtreply:blogCmtreplies) {
            BlogCommentRepalyCustom blogCommentRepalyCustom = new BlogCommentRepalyCustom();
            String time= format.format(new Date());
            String commenttime=format.format(blogCmtreply.getTime());
            blogCommentRepalyCustom.setFortime(getDifferenceTime.getDifferenceTime(time,commenttime,timeFormat));
            blogCommentRepalyCustom.setCommentid(blogCmtreply.getCommentid());
            blogCommentRepalyCustom.setTouserid(blogCmtreply.getTouserid());
            blogCommentRepalyCustom.setRepalyid(blogCmtreply.getRepalyid());
            blogCommentRepalyCustom.setContent(blogCmtreply.getContent());
            blogCommentRepalyCustom.setFromuserid(blogCmtreply.getFromuserid());
            blogCommentRepalyCustom.setId(blogCmtreply.getId());
            blogCommentRepalyCustoms.add(blogCommentRepalyCustom);
        }
        return blogCommentRepalyCustoms;
    }
    
}
