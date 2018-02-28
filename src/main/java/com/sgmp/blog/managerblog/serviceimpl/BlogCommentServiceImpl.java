package com.sgmp.blog.managerblog.serviceimpl;

import com.sgmp.blog.managerblog.dao.BlogCommentMapper;
import com.sgmp.blog.managerblog.javabean.BlogCommentRepalyCustom;
import com.sgmp.blog.managerblog.mapper.BlogCommentMapperCustom;
import com.sgmp.blog.managerblog.pojo.BlogComment;
import com.sgmp.blog.managerblog.pojo.BlogCommentCustom;
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
public class BlogCommentServiceImpl extends BaseService<BlogComment> {

    @Autowired
    private BlogCommentMapper blogCommentMapper;

    @Autowired
    private BlogCmtrepalyServiceImpl blogCmtrepalyService;

    @Override
    public BaseDao<BlogComment> getMapper() {
        return this.blogCommentMapper;
    }


    @Autowired
    private BlogCommentMapperCustom blogCommentMapperCustom;

    public List<BlogCommentCustom> queryarticclereplay(){

        return blogCommentMapperCustom.queryarticclereplay();
    }

    public BlogComment sendComment(BlogComment blogComment) {
        Integer insert = getMapper().insertUseGeneratedKeys(blogComment);
        if(insert==1){
            BlogComment blogComment1 = blogCommentMapperCustom.querybyid(blogComment.getId());
            return blogComment1;
        }
       return null;
    }

    public Integer count(String id) {
        Example example = new Example(BlogComment.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("articleid",id);
        return getMapper().selectCountByExample(example);
    }

    public List<BlogComment> querybyarid(String arid) {
        Example example = new Example(BlogComment.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("articleid",arid);
        return getMapper().selectByExample(example);
    }

    /**
     * 根据状态查询,第一按状态降序，第二按照时间降序
     * @return
     */
    public List<com.sgmp.blog.managerblog.javabean.BlogCommentCustom> querybystatus() {
        Example example = new Example(BlogComment.class);
        example.setOrderByClause("status desc,time desc");
        List<BlogComment> blogComments = this.getMapper().selectByExample(example);
        List<com.sgmp.blog.managerblog.javabean.BlogCommentCustom> commentCustomList=new ArrayList<com.sgmp.blog.managerblog.javabean.BlogCommentCustom>();
        String timeFormat="yy-MM-dd:HH:mm:ss";
        DateFormat format = new SimpleDateFormat(timeFormat);
        for (BlogComment blogComment:blogComments) {
            String time= format.format(new Date());
            String commenttime=format.format(blogComment.getTime());
            com.sgmp.blog.managerblog.javabean.BlogCommentCustom blogCommentCustom=new com.sgmp.blog.managerblog.javabean.BlogCommentCustom();
            blogCommentCustom.setFormtime(getDifferenceTime.getDifferenceTime(time,commenttime,timeFormat));
            blogCommentCustom.setTime(blogComment.getTime());
            blogCommentCustom.setUserid(blogComment.getUserid());
            blogCommentCustom.setArticleid(blogComment.getArticleid());
            blogCommentCustom.setContent(blogComment.getContent());
            blogCommentCustom.setId(blogComment.getId());
            blogCommentCustom.setStatus(blogComment.getStatus());
            List<BlogCommentRepalyCustom> querycommentid = blogCmtrepalyService.querycommentid(blogComment.getId());
            blogCommentCustom.setCustoms(querycommentid);
            commentCustomList.add(blogCommentCustom);
        }
        return commentCustomList;
    }

    /**
     * 查询未读评论数
     * @return
     */
    public Integer querycount() {
        Example example = new Example(BlogComment.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("status","1");
        Integer i = this.getMapper().selectCountByExample(example);
        return i;
    }
    
}
