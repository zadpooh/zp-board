package com.dn.spring.user.domain;

import com.dn.spring.user.support.UserInfoParam;

import lombok.Data;

@Data
public class UserInfo {
	
	private String userId;
	private String userNikNm;
	private String pswd;
	private String userPhoto = "";
	private String userGreeting = "";
	private String posting;

}
