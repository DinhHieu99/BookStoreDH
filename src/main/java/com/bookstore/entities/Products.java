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
@Table(name = "tbl_SanPham")
public class Products extends BaseEntity {
	@Column(name = "nameProduct", columnDefinition = "text", nullable = false)
	private String name;

	@Column(name = "status")
	private Boolean status;

	@Column(name = "describes", columnDefinition = "text")
	private String describe;

	@Column(name = "quantity")
	private Integer quantity;

	@Transient
	private Integer soLuongNhap;

	@Column(name = "price")
	private Integer price;

	@Column(name = "percentDiscount")
	private Integer percentDiscount;

	@Column(name = "discount")
	private Integer discount;

	@Column(name = "imgProduct")
	private String imgProduct;

	@Column(name = "author", columnDefinition = "text")
	private String author;

	@Column(name = "createDate")
	private Date createDate;

	@Column(name = "view", columnDefinition = "text")
	private Integer view;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idNCC")
	private Supplier nhaCC;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idDM")
	private Categories categories;

	@OneToMany(mappedBy = "products", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Cart> cart = new ArrayList<Cart>();

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<PhieuNhap> phieuNhap = new ArrayList<PhieuNhap>();
	
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<ReviewProduct> review = new ArrayList<ReviewProduct>();



}
