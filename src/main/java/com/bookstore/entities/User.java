package com.bookstore.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tbl_khachhang")
public class User extends BaseEntity {

    @Column(name = "name", columnDefinition = "text", nullable = false)
    private String name;

    @Column(name = "avatar", columnDefinition = "text")
    private String avatar;

    @Column(name = "address", columnDefinition = "text", nullable = false)
    private String address;

    @Column(name = "mobile", nullable = false)
    private String mobile;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Transient
    private String passwordNew;

    @Transient
    private String confimPassword;

    @Column(name = "status", nullable = false)
    private Integer status;

    @Column(name = "user_status", nullable = false)
    private Boolean user_status;

    @Column(name = "created")
    private Date created;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Invoice> hoaDon = new ArrayList<Invoice>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<ReviewProduct> reviewProduct = new ArrayList<ReviewProduct>();

}
