package com.bookstore.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CommentDto {
    private Integer id;
    private String comment;
    private Integer rating;
    private String fullName;
    private Date date;
    private Integer idUser;
    private Integer idProduct;
    private Integer idComment;
    private String avatar;
}
