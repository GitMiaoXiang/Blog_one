package com.sgmp.blog.managerblog.serviceimpl;

import com.sgmp.blog.managerblog.dao.BlogManagerMapper;
import com.sgmp.blog.managerblog.pojo.BlogManager;
import com.sgmp.blog.managerblog.sampleconfigmybatis.BaseDao;
import com.sgmp.blog.managerblog.servicedao.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogManagerServiceImple extends BaseService<BlogManager> {

    @Autowired
    private BlogManagerMapper blogManagerMapper;

    @Override
    public BaseDao<BlogManager> getMapper() {
        return this.blogManagerMapper;
    }

  /*  @Autowired
    private BlogManagerMapper blogManagerMapper;


    public List<BlogManager> query() {
        List<BlogManager> blogManagers = blogManagerMapper.selectByExample(null);
        if (blogManagers==null) {
            return null;
        }
        return blogManagers;
    }*/
}
