package com.orange.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 对查询结果的封装
 * 因为easy ui的datagrid分页需要结果所有条数total和当前页数据rows
 * @param <T> 查询结果的类型
 */
public class ResultInfo<T> {

    private Integer total = 0;
    private List<T> rows = new ArrayList<>();

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
