package com.sgmp.blog.managerblog.pojo;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "blog_images")
public class BlogImages {

    @Id
    private Integer id;

    private String name;

    private String title;

    private Date uploadtime;

    private String arid;

    private String indexpic;

    private String gallery;

    private String updown;

    private String isrecommend;

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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public String getArid() {
        return arid;
    }

    public void setArid(String arid) {
        this.arid = arid == null ? null : arid.trim();
    }

    public String getIndexpic() {
        return indexpic;
    }

    public void setIndexpic(String indexpic) {
        this.indexpic = indexpic == null ? null : indexpic.trim();
    }

    public String getGallery() {
        return gallery;
    }

    public void setGallery(String gallery) {
        this.gallery = gallery == null ? null : gallery.trim();
    }

    public String getUpdown() {
        return updown;
    }

    public void setUpdown(String updown) {
        this.updown = updown == null ? null : updown.trim();
    }

    public String getIsrecommend() {
        return isrecommend;
    }

    public void setIsrecommend(String isrecommend) {
        this.isrecommend = isrecommend == null ? null : isrecommend.trim();
    }
}