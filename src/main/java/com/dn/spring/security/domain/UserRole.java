package com.dn.spring.security.domain;

import lombok.Data;

import java.io.Serializable;

@Data
@SuppressWarnings("serial")
public class UserRole implements Serializable  {

	private int userId;
	private String authority;

	public UserRole() {}

	public UserRole(int userId, String authority) {
		this.userId = userId;
		this.authority = authority;
	}

}
