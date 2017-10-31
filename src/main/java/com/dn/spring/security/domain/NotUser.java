package com.dn.spring.security.domain;

public class NotUser extends User {
	private static final long serialVersionUID = 1L;

	public NotUser() {
		//setUserId("");
		setUsername("");
	}
	
	public boolean isAnonymous() {
		return true;
	}
}
