package com.bookstore.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AdminDto {

    private Integer id;
    private String name;
    private String address;
    private Boolean status;
    private Integer idRole;
    private String role;
    private String mobile;
    private String email;
    private String avatar;
    private String username;
    private String password;
    private Boolean status_login;
}
