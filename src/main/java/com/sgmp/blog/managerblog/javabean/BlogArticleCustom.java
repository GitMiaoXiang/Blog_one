package com.sgmp.blog.managerblog.javabean;

import com.sgmp.blog.managerblog.pojo.BlogArticle;

public class BlogArticleCustom extends BlogArticle {

    private String src;

    private Integer Count;

    private Integer cmtcount;

    public Integer getCmtcount() {
        return cmtcount;
    }

    public void setCmtcount(Integer cmtcount) {
        this.cmtcount = cmtcount;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public Integer getCount() {
        return Count;
    }

    public void setCount(Integer count) {
        Count = count;
    }
}
