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
@Table(name = "tbl_danhmuc")
public class Categories extends BaseEntity {
	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "describes", nullable = false)
	private String describe;

	@Column(name = "status", nullable = false)
	private Integer status;
	
	@OneToMany(mappedBy = "categories", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Products> product = new ArrayList<Products>();

}
