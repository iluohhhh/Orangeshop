package com.orange.service;

import java.util.List;

import com.orange.bean.order.Comment;

public interface CommentService {
    void save(Comment comment);

    List<Comment> getComments(Comment comment);

    /**
     * 根据商品编号获取商品评论
     *
     * @param pno
     * @return
     */
    List<Comment> getCommentsByProductNo(String pno);
}
