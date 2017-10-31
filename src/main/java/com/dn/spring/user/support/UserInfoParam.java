package com.dn.spring.user.support;

import com.dn.common.domain.SearchParam;

import lombok.Data;

@Data
public class UserInfoParam extends SearchParam{
	
	private String flagUserId;
	private String flagUserNikNm;
	private String checkType;
	private String userNewId;
	private String pswdNew;
}
