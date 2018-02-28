package com.sgmp.blog.managerblog.javabean;

import com.sgmp.blog.managerblog.pojo.BlogComment;

import java.util.List;

public class BlogCommentCustom extends BlogComment {

    private String formtime;

    private List<BlogCommentRepalyCustom> customs;

    public List<BlogCommentRepalyCustom> getCustoms() {
        return customs;
    }

    public void setCustoms(List<BlogCommentRepalyCustom> customs) {
        this.customs = customs;
    }

    public String getFormtime() {
        return formtime;
    }

    public void setFormtime(String formtime) {
        this.formtime = formtime;
    }
}
