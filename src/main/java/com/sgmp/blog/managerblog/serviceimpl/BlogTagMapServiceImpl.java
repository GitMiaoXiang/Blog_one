package com.sgmp.blog.managerblog.serviceimpl;

import com.sgmp.blog.managerblog.dao.BlogTagMapMapper;
import com.sgmp.blog.managerblog.pojo.BlogTagmap;
import com.sgmp.blog.managerblog.sampleconfigmybatis.BaseDao;
import com.sgmp.blog.managerblog.servicedao.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class BlogTagMapServiceImpl extends BaseService<BlogTagmap>{

    @Autowired
    private BlogTagMapMapper blogTagMapMapper;

    @Override
    public BaseDao<BlogTagmap> getMapper() {
        return this.blogTagMapMapper;
    }

    /**
     * 根据tagid查询文章tag索引
     * @param tagid
     */
    public List<BlogTagmap> querybytagid(Integer tagid) {
        Example example = new Example(BlogTagmap.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("taid",tagid);
        List<BlogTagmap> blogTagmaps = this.getMapper().selectByExample(example);
        return blogTagmaps;
    }
}
