package com.orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.orange.bean.order.Comment;
import com.orange.dao.CommentDao;
import com.orange.service.CommentService;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    @Resource
    private CommentDao commentDao;


    @Override
    public void save(Comment comment) {

        if (null != comment) {
            try {
                commentDao.save(comment);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Comment> getComments(Comment comment) {
        if (comment != null) {
            try {
                return commentDao.getComments(comment);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Comment> getCommentsByProductNo(String pno) {
        Comment comment = new Comment();
        comment.setPid(pno);
        return this.getComments(comment);
    }

}
