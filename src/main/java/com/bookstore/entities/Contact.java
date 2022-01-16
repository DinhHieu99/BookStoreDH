package com.bookstore.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tbl_lienhe")
public class Contact extends BaseEntity {
	@Column(name ="fullname")
	private String fullName;
	
	@Column(name ="email")
	private String email;

	@Column(name ="avatar")
	private String avatar;
	
	@Column(name ="subject",columnDefinition = "text")
	private String subject;
	@Lob
	@Column(name ="content", nullable = false, columnDefinition = "text" )
	private String content;

	@Lob
	@Column(name ="feedback", nullable = false, columnDefinition = "text" )
	private String feedback;

	@Column(name ="status")
	private Integer status;
	
	@Column(name = "create_date")
	private Date createdDate;

}
