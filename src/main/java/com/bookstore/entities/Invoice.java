package com.bookstore.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tbl_hoadon")
public class Invoice extends BaseEntity {

    @Column(name = "fullName", nullable = false)
    private String fullName;

    @Column(name = "mobile", nullable = false)
    private String mobile;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "created", nullable = false)
    private Date created;

    @Column(name = "status", nullable = false)
    private Integer status;

    @Column(name = "status_delete", nullable = false)
    private Boolean statusDelete;

    @Column(name = "message", columnDefinition = "text")
    private String message;

    @Column(name = "deliveryAddress", columnDefinition = "text")
    private String deliveryAddress;

    @Column(name = "apptransid")
    private String apptransid;

    @Column(name = "pay")
    private Boolean pay;

    @Column(name = "totalMoney", nullable = false)
    private Integer totalMoney;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Cart> cart = new ArrayList<Cart>();

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idUser", nullable = true)
    private User user;

}
