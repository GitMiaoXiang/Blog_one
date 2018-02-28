package com.sgmp.blog.managerblog.pojo;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "blog_article")
public class BlogArticle {
    @Id
    private String id;

    private String title;

    private String isrecommend;

    private Integer ckickcount;

    private Date createdate;

    private Date updatedate;

    private Integer category;

    private String tags;

    private String updownframe;

    private String descz;

    private String content;

    public String getDescz() {
        return descz;
    }

    public void setDescz(String descz) {
        this.descz = descz == null ? null : descz.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getIsrecommend() {
        return isrecommend;
    }

    public void setIsrecommend(String isrecommend) {
        this.isrecommend = isrecommend == null ? null : isrecommend.trim();
    }

    public Integer getCkickcount() {
        return ckickcount;
    }

    public void setCkickcount(Integer ckickcount) {
        this.ckickcount = ckickcount;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags == null ? null : tags.trim();
    }

    public String getUpdownframe() {
        return updownframe;
    }

    public void setUpdownframe(String updownframe) {
        this.updownframe = updownframe == null ? null : updownframe.trim();
    }
}