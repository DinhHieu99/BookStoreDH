package com.bookstore.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tbl_giohang")
public class Cart extends BaseEntity {

	@Column(name = "quantity", nullable = false)
	private Integer quantity;

	@Column(name = "discount")
	private Integer discount;

	@Column(name = "money", nullable = false)
	private Integer money;

	@Column(name = "status")
	private Integer status;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idOrder")
	private Invoice order;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idProducts")
	private Products products;

}
