package com.sgmp.blog.managerblog.mapper;



import com.sgmp.blog.managerblog.pojo.BlogCmtreply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BlogCmtreplyMapperCustom {
    List<BlogCmtreply> query();

    BlogCmtreply querybyreid(Integer id);
}