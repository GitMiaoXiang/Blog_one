package com.sgmp.blog.managerblog.javabean;

import com.sgmp.blog.managerblog.pojo.BlogMessage;

import java.util.Map;

public class BlogMessageDiv extends BlogMessage{

    private Map<String ,Object> map;

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
