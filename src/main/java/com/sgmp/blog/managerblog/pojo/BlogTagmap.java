package com.sgmp.blog.managerblog.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "blog_tagmap")
public class BlogTagmap {
    @Id
    private Integer id;

    private String arid;

    private Integer taid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getArid() {
        return arid;
    }

    public void setArid(String arid) {
        this.arid = arid == null ? null : arid.trim();
    }

    public Integer getTaid() {
        return taid;
    }

    public void setTaid(Integer taid) {
        this.taid = taid;
    }
}