package com.dn.spring.boardConfig.domain;

import lombok.Data;

@Data
public class BoardConfig {

	private int boardConfigId;
	private String boardCode;
	private String boardConfigMetaData;
	private String createdDate;
	private int createdUserId;
	private String updatedDate;
	private int updatedUserId;
}
