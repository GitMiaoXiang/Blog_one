package com.sgmp.blog.managerblog.javabean;

import com.sgmp.blog.managerblog.pojo.BlogMsgreply;

public class BlogMsgRepalyCustom extends BlogMsgreply{

    private String fonttime;

    private String fromname;

    private String toname;

    public String getFromname() {
        return fromname;
    }

    public void setFromname(String fromname) {
        this.fromname = fromname;
    }

    public String getToname() {
        return toname;
    }

    public void setToname(String toname) {
        this.toname = toname;
    }

    public String getFonttime() {
        return fonttime;
    }

    public void setFonttime(String fonttime) {
        this.fonttime = fonttime;
    }
}
