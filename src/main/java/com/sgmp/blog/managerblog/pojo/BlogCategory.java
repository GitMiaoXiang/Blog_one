package com.sgmp.blog.managerblog.pojo;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "blog_category")
public class BlogCategory {
    @Id
    private Integer id;

    private String name;

    private Integer indexz;

    private String sortz;

    private String hrefz;

    private String descz;

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
        this.name = name;
    }

    public Integer getIndexz() {
        return indexz;
    }

    public void setIndexz(Integer indexz) {
        this.indexz = indexz;
    }

    public String getSortz() {
        return sortz;
    }

    public void setSortz(String sortz) {
        this.sortz = sortz;
    }

    public String getHrefz() {
        return hrefz;
    }

    public void setHrefz(String hrefz) {
        this.hrefz = hrefz;
    }

    public String getDescz() {
        return descz;
    }

    public void setDescz(String descz) {
        this.descz = descz;
    }
}