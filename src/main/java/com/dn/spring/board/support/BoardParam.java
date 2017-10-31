package com.dn.spring.board.support;

import com.dn.common.domain.SearchParam;

import lombok.Data;

@Data
public class BoardParam extends SearchParam {
	
	private String boardId;
	private String boardTitle;
	private String boardContent;
	private String fileName;
	private String fileUploadPath;
	private String fileUrl;
	private String registDe;
	private String userId;
	private String mode = "create";
}
