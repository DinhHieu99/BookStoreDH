package com.bookstore.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tbl_PhieuNhap")
public class PhieuNhap extends BaseEntity {
	@Column(name = "nameProduct", nullable = false)
	private String name;
	
	@Column(name = "quantity", nullable = false)
	private Integer quantity;

	@Column(name = "created", nullable = false)
	private Date createDate;

	@Column(name = "price", nullable = false)
	private Integer price;

	@Column(name = "amount", nullable = false)
	private Integer amount;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idAdmin")
	private Admin admin;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idProduct")
	private Products product;

}
