package com.orange.bean;


public class PageBean {
    //页号
    private Integer pageNo = 1;
    //开始行
    private Integer startRow;
    //每页数
    private Integer pageSize = 5;

    private boolean nameLike;


    public Integer getPageNo() {
        return pageNo;
    }


    public void setPageSize(Integer pageSize) {
        //计算一次开始行
        this.startRow = (pageNo - 1) * pageSize;
        this.pageSize = pageSize;
    }

    public void setPageNo(Integer pageNo) {
        //计算一次开始行
        this.startRow = (pageNo - 1) * pageSize;
        this.pageNo = pageNo;
    }

    public void setStartRow(Integer startRow) {
        this.startRow = startRow;
    }

    public Integer getStartRow() {
        return startRow;
    }

    public Integer getPageSize() {
        return pageSize;
    }
}
