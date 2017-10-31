package com.dn.spring.email.domain;

import lombok.Data;

@Data
public class Email {

	private String toUserEmail;
	private String fromUserEmail;
	private String title;
	private String videoTitle;
	private String content;
	private String userNikNm;
	private String emailTemplate;
	private int videoId;
	private String serverDomain;
}
