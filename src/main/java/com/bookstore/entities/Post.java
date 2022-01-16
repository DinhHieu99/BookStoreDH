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
@Table(name = "tbl_tintuc")
public class Post extends BaseEntity {

	@Column(name = "title", columnDefinition = "text", nullable = false)
	private String title;

	@Column(name = "description", nullable = false, columnDefinition = "text")
	private String description;

	@Column(name = "details", nullable = false, columnDefinition = "text")
	private String details;

	@Column(name = "image")
	private String image;

	@Column(name = "status", nullable = true)
	private Boolean status;

	@Column(name = "create_date")
	private Date createdDate;

	@Column(name = "view")
	private Integer view;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "author")
	private Admin admin;

}
