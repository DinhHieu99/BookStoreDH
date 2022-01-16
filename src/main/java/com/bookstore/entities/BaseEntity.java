package com.bookstore.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@MappedSuperclass
public class BaseEntity {
	
	@Id // xác định đây là khoá chính.
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increment.
	@Column(name = "id")
	private Integer id; // primary-key
}
