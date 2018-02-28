package com.sgmp.blog.managerblog.javabean;

import java.util.Map;

public class ImagesMap {

    private Map<String,MultipartFileBean> image;

    public Map<String, MultipartFileBean> getImage() {
        return image;
    }

    public void setImage(Map<String, MultipartFileBean> image) {
        this.image = image;
    }
}
