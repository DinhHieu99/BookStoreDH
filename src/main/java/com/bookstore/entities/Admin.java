package com.bookstore.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tbl_nhanvien")
public class Admin extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "name", columnDefinition = "text", nullable = false)
	private String name;

	@Column(name = "address", columnDefinition = "text", nullable = false)
	private String address;

	@Column(name = "status", nullable = false)
	private boolean status;

	@Column(name = "mobile", nullable = false)
	private String mobile;

	@Column(name = "email", nullable = false)
	private String email;

	@Column(name = "avatar", columnDefinition = "text")
	private String img;
	
	@Column(name = "username", nullable = false)
	private String username;

	@Column(name = "password", nullable = false)
	private String password;

	@Transient
	private String confimPassword;

	@Transient
	private String passwordNew;

	@Column(name = "status_login", nullable = false)
	private Boolean status_login;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_Role")
	private Role role;
	
	@OneToMany(mappedBy = "admin", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<PhieuNhap> phieuNhap = new ArrayList<PhieuNhap>();
	
	@OneToMany(mappedBy = "admin", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Post> post = new ArrayList<Post>();
}
