package com.sgmp.blog.managerblog.javabean;

import com.sgmp.blog.managerblog.pojo.BlogMessage;

import java.util.List;

public class BlogMessageCustom extends BlogMessage {

    private String formtdate;

    private List<BlogMsgRepalyCustom> msgreplie;

    public List<BlogMsgRepalyCustom> getMsgreplie() {
        return msgreplie;
    }

    public void setMsgreplie(List<BlogMsgRepalyCustom> msgreplie) {
        this.msgreplie = msgreplie;
    }

    public String getFormtdate() {
        return formtdate;
    }

    public void setFormtdate(String formtdate) {
        this.formtdate = formtdate;
    }
}
