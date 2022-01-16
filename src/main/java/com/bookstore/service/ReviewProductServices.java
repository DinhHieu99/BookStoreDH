package com.bookstore.service;

import com.bookstore.entities.ReviewProduct;
import com.bookstore.model.dto.CommentDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ReviewProductServices {
    List<CommentDto> findAllByIdProduct(Integer id);

    List<CommentDto> findCommentByIdComment(Integer idComment);

    void saveCommentLv1(ReviewProduct comment);

    void saveCommentLv2(ReviewProduct comment);

    void deleteCommentLV1(Integer idComment);

    int countComment(int id);
}
