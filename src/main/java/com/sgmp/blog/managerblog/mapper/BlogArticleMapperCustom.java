package com.sgmp.blog.managerblog.mapper;

import com.sgmp.blog.managerblog.pojo.BlogCommentCustom;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BlogArticleMapperCustom{
    List<BlogCommentCustom> queryarticclereplay();


}
