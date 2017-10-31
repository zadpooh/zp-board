package com.dn.spring.board.domain;

import lombok.Data;

@Data
public class Board {
	
	private String boardId;
	private String boardType;
	private String boardTitle;
	private String boardContent;
	private String fileName;
	private String fileUploadPath;
	private String fileUrl;
	private String registDe;
	private int boardHits;
	private String userId;
}
