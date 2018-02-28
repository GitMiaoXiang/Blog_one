package com.sgmp.blog.managerblog.pojo;

public class BlogImagesWithBLOBs extends BlogImages {
    private String descz;

    private String src;

    public String getDescz() {
        return descz;
    }

    public void setDescz(String descz) {
        this.descz = descz == null ? null : descz.trim();
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src == null ? null : src.trim();
    }
}