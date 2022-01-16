package com.bookstore.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tbl_nhacc")
public class Supplier extends BaseEntity {
	@Column(name = "nameSupplier", columnDefinition = "text", nullable = false)
	private String name;

	@Column(name = "address", columnDefinition = "text", nullable = false)
	private String address;

	@Column(name = "mobile", nullable = false)
	private String mobile;

	@Column(name = "email", columnDefinition = "text", nullable = false)
	private String email;
	
	@Column(name = "status")
	private Boolean status;
	
	@OneToMany(mappedBy = "nhaCC", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Products> products = new ArrayList<Products>();

}
