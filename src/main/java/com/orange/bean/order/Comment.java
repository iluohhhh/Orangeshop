package com.orange.bean.order;

import com.orange.util.Constants;

public class Comment {

    private Integer id;
    private Integer oid;
    // 商品编号
    private String pid;
    // 品论内容
    private String contrnt;
    private String imgUrl;

    private String buyer;

    public String getAllUrl() {
        return Constants.IMAGE_URL + this.imgUrl;
    }

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getContrnt() {
        return contrnt;
    }

    public void setContrnt(String contrnt) {
        this.contrnt = contrnt;
    }

    public String getImgUrl() {
        return this.imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

}
