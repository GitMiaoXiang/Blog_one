package com.sgmp.blog.managerblog.mapper;

import com.sgmp.blog.managerblog.pojo.BlogComment;
import com.sgmp.blog.managerblog.pojo.BlogCommentCustom;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BlogCommentMapperCustom {
    List<BlogCommentCustom> queryarticclereplay();

    List<BlogCommentCustom> queryarticclereplaybyid(String arid);

    List<BlogComment> query(String arid);

    BlogComment querybyid(Integer cmid);


}
