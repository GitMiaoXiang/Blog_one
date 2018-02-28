package com.sgmp.blog.managerblog.pojo;

public class BlogCommentCustom extends BlogComment {

    private BlogArticle blogArticle;

    private BlogCmtreply blogReply;

    public BlogArticle getBlogArticle() {
        return blogArticle;
    }

    public void setBlogArticle(BlogArticle blogArticle) {
        this.blogArticle = blogArticle;
    }

    public BlogCmtreply getBlogReply() {
        return blogReply;
    }

    public void setBlogReply(BlogCmtreply blogReply) {
        this.blogReply = blogReply;
    }
}
