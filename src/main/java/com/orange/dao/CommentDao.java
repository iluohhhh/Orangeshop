package com.orange.dao;

import java.util.List;

import com.orange.bean.order.Comment;

public interface CommentDao {

    void save(Comment comment);

    List<Comment> getComments(Comment comment);

}
