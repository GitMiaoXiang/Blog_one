package com.sgmp.blog.managerblog.javabean;

import java.util.Date;
import java.util.Map;

public class BlogDivComment{

    private Integer id;

    private String articleid;

    private Integer userid;

    private Date time;

    private String contentz;

    private Map<String,Object> map;

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getArticleid() {
        return articleid;
    }

    public void setArticleid(String articleid) {
        this.articleid = articleid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContentz() {
        return contentz;
    }

    public void setContentz(String contentz) {
        this.contentz = contentz;
    }
}
