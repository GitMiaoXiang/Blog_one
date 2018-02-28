package com.sgmp.blog.managerblog.serviceimpl;

import com.sgmp.blog.managerblog.dao.BlogTagMapper;
import com.sgmp.blog.managerblog.pojo.BlogTag;
import com.sgmp.blog.managerblog.sampleconfigmybatis.BaseDao;
import com.sgmp.blog.managerblog.servicedao.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogTagServiceImpl extends BaseService<BlogTag>{

    @Autowired
    private BlogTagMapper blogTagMapper;

    @Override
    public BaseDao<BlogTag> getMapper() {
        return this.blogTagMapper;
    }


    /**
     * 根据tag名字查询存不存在
     * @param tag
     */
    public BlogTag querybyname(String tag) {
        BlogTag blogTag = new BlogTag();
        blogTag.setName(tag);
        BlogTag selectOne = this.getMapper().selectOne(blogTag);
        if(selectOne!=null){
            return selectOne;
        }
       return null;
    }

    /**
     * 增加tag获取当前tag
     * @return
     */
    public Integer savequerytagid(BlogTag blogTag) {
        int i = this.getMapper().insertUseGeneratedKeys(blogTag);
        if(i==1){
            return blogTag.getId();
        }
        return null;
    }
}
