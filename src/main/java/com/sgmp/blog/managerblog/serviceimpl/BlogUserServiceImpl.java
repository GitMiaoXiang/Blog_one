package com.sgmp.blog.managerblog.serviceimpl;

import com.sgmp.blog.managerblog.dao.BlogUserMapper;
import com.sgmp.blog.managerblog.pojo.BlogUser;
import com.sgmp.blog.managerblog.sampleconfigmybatis.BaseDao;
import com.sgmp.blog.managerblog.servicedao.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class BlogUserServiceImpl extends BaseService<BlogUser>{

    @Autowired
    private BlogUserMapper blogUserMapper;
    @Override
    public BaseDao<BlogUser> getMapper() {
        return this.blogUserMapper;
    }

    /**
     * 按注册时间降序
     * @return
     */
    public List<BlogUser> querybytime() {
        Example example = new Example(BlogUser.class);
        example.setOrderByClause("createdate desc");
        List<BlogUser> blogUsers = this.getMapper().selectByExample(example);

        return blogUsers;
    }
}
