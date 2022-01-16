package com.bookstore.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tbl_danhgia")
public class ReviewProduct extends BaseEntity{

	@Column(name = "comment",columnDefinition = "text", nullable = false)
	private String comment;
	
	@Column(name = "rating")
	private int rating;

	@Column(name = "date")
	private Date date;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idProduct")
	private Products product;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idUser")
	private User user;

	@ManyToOne(cascade={CascadeType.ALL})
	@JoinColumn(name="idComment")
	private ReviewProduct reviewProduct;

	@OneToMany(mappedBy="reviewProduct")
	private Set<ReviewProduct> reviewProducts = new HashSet<ReviewProduct>();

}
