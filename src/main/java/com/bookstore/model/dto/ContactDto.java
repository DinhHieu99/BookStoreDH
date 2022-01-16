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
public class ContactDto {
    private Integer id;
    private String fullName;
    private String email;
    private String avatar;
    private String subject;
    private String content;
    private Integer status;
    private Date createDate;
}
