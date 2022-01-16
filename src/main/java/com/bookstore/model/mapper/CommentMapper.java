package com.bookstore.model.mapper;

import com.bookstore.entities.ReviewProduct;
import com.bookstore.model.dto.CommentDto;

import java.util.ArrayList;
import java.util.List;

public class CommentMapper {
    public static CommentDto toCommentDto(ReviewProduct reviewProduct){
        CommentDto commentDto = new CommentDto();

        commentDto.setId(reviewProduct.getId());
        commentDto.setComment(reviewProduct.getComment());
        commentDto.setRating(reviewProduct.getRating());
        commentDto.setFullName(reviewProduct.getUser().getName());
        commentDto.setDate(reviewProduct.getDate());
        commentDto.setIdUser(reviewProduct.getUser().getId());
        commentDto.setIdProduct(reviewProduct.getProduct().getId());
        commentDto.setAvatar(reviewProduct.getUser().getAvatar());
        if(reviewProduct.getReviewProduct() == null){
            commentDto.setIdComment(null);
        }else{
            commentDto.setIdComment(reviewProduct.getReviewProduct().getId());
        }


        return commentDto;
    }

    public static List<CommentDto> convertCommentDto(List<ReviewProduct> reviewProductList){
        List<CommentDto> commentDtos = new ArrayList<CommentDto>();

        for (int i = 0; i < reviewProductList.size(); i++) {
            commentDtos.add(toCommentDto(reviewProductList.get(i)));
        }
        return commentDtos;
    }
}
