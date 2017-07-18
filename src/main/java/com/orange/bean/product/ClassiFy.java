package com.orange.bean.product;

import com.orange.bean.PageBean;

import java.io.Serializable;


public class ClassiFy extends PageBean implements Serializable{
    private static final long serialVersionUID = -5517834455581135917L;
    private String name;
    private Integer id;
    private Integer parentId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}
