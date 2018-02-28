package com.sgmp.blog.managerblog.serviceimpl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.sgmp.blog.managerblog.dao.BlogCategoryMapper;
import com.sgmp.blog.managerblog.pojo.BlogCategory;
import com.sgmp.blog.managerblog.sampleconfigmybatis.BaseDao;
import com.sgmp.blog.managerblog.servicedao.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class BlogCategoryServiceImpl extends BaseService<BlogCategory> {

    @Autowired
    private BlogCategoryMapper blogCategoryMapper;

    @Override
    public BaseDao<BlogCategory> getMapper() {
        return this.blogCategoryMapper;
    }

    public List<BlogCategory> querysun(Integer indexz) {
        Example example = new Example(BlogCategory.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("indexz",indexz);
        List<BlogCategory> categories = getMapper().selectByExample(example);
        return categories;
    }

    public List<BlogCategory> querydelindexz() throws JsonProcessingException {
        List<BlogCategory> categories = query();
        for (BlogCategory blogCategory:categories) {
            if(blogCategory.getIndexz()!=null){
                blogCategory.setName(null);
            }
        }

        return categories;
    }



    /*@Override
    public List<BlogCategory> query() {
        List<BlogCategory> blogCategories = blogCategoryMapper.selectByExample(null);
        for (BlogCategory blogCategory: blogCategories) {
            if(blogCategory.getIndexz()!=null){
                blogCategory.setName(null);
            }
        }
        return blogCategories;
    }

    @Override
    public List<BlogCategory> querysun(Integer ids) {
        BlogCategoryExample blogCategoryExample = new BlogCategoryExample();
        BlogCategoryExample.Criteria criteria = blogCategoryExample.createCriteria();
        criteria.andIndexzEqualTo(ids);
        List<BlogCategory> categories = blogCategoryMapper.selectByExample(blogCategoryExample);
        return categories;
    }*/
}
