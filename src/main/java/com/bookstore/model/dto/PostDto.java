package com.bookstore.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PostDto {

    private Integer id;
    private String title;
    private String description;
    private String details;
    private String image;
    private Boolean status;
    private Date createdDate;
    private Integer view;
    private String author;
}
