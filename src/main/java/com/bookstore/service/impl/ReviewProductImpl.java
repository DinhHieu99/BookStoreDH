package com.bookstore.service.impl;

import com.bookstore.entities.ReviewProduct;
import com.bookstore.model.dto.CommentDto;
import com.bookstore.model.mapper.CommentMapper;
import com.bookstore.repositories.ReviewProductRepositories;
import com.bookstore.service.ReviewProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Component
@Transactional
public class ReviewProductImpl implements ReviewProductServices {
    @PersistenceContext
    protected EntityManager entityManager;

    @Autowired
    ReviewProductRepositories reviewProductRepositories;

    @Override
    public List<CommentDto> findAllByIdProduct(Integer id) {
        String sql = "SELECT * FROM tbl_danhgia WHERE idProduct = " + id + " AND idComment IS NULL ORDER BY id DESC";
        Query query = entityManager.createNativeQuery(sql, ReviewProduct.class);
        return CommentMapper.convertCommentDto(query.getResultList());
    }

    @Override
    public List<CommentDto> findCommentByIdComment(Integer idComment) {
        String sql = "SELECT * FROM tbl_danhgia WHERE idComment = " + idComment + " ORDER BY id DESC";
        Query query = entityManager.createNativeQuery(sql, ReviewProduct.class);
        return CommentMapper.convertCommentDto(query.getResultList());
    }

    @Modifying
    @Override
    public void saveCommentLv1(ReviewProduct comment) {
        Query query = entityManager.createNativeQuery("INSERT INTO tbl_danhgia (comment, idProduct," +
                        " idUser, date, rating) VALUES(?,?,?,?,?)")
                .setParameter(1, comment.getComment())
                .setParameter(2, comment.getProduct())
                .setParameter(3, comment.getUser())
                .setParameter(4, comment.getDate())
                .setParameter(5, comment.getRating());
        query.executeUpdate();
    }
    @Modifying
    @Override
    public void saveCommentLv2(ReviewProduct comment) {

        Query query = entityManager.createNativeQuery("INSERT INTO tbl_danhgia (comment, idProduct, idUser, date, idComment, rating) " +
                "VALUES(?,?,?,?,?,?) ").setParameter(1, comment.getComment())
                .setParameter(2, comment.getProduct())
                .setParameter(3, comment.getUser())
                .setParameter(4, comment.getDate())
                .setParameter(5, comment.getReviewProduct())
                .setParameter(6, 0);
        query.executeUpdate();
    }
    @Modifying
    @Override
    public void deleteCommentLV1(Integer idComment) {
        String sql ="DELETE FROM tbl_danhgia WHERE idComment = "+ idComment;
        Query query = entityManager.createNativeQuery(sql, ReviewProduct.class);
        query.executeUpdate();
    }

    @Override
    public int countComment(int id) {
        return reviewProductRepositories.countComment(id);
    }
}
