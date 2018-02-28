package com.sgmp.blog.managerblog.javabean;

import org.springframework.web.multipart.MultipartFile;

public class MultipartFileBean {

    private String key;

    private MultipartFile value;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public MultipartFile getValue() {
        return value;
    }

    public void setValue(MultipartFile value) {
        this.value = value;
    }
}
