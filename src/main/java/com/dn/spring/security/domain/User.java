package com.dn.spring.security.domain;

import lombok.Data;

import java.util.ArrayList;

@Data
public class User{

	private int userId;

	private String loginId;
	private String password;
	private String username;
	private String loginDate;
	private String creationDate;
	private String updatedDate;
	private String updatedUserId;

	private ArrayList<UserRole> userRoles;

}
