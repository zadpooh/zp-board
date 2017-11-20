package com.dn.spring.boardConfig.domain;

import lombok.Data;

@Data
public class BoardConfig {

	private int boardConfigId;
	private String boardTitle;
	private String boardCode;
	private String boardConfigMetaData;
	private String createdDate;
	private int createdUserId;
	private String updatedDate;
	private int updatedUserId;
	private BoardConfigMetaData boardConfigMetaDataJson;
}
