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
public class UserDto {
    private Integer id;
    private String name;
    private String avatar;
    private String mobile;
    private String email;
    private String address;
    private Integer status;
    private Boolean user_status;
    private Date createDate;
}
