package com.dn.spring.file.domain;

import lombok.Data;

@Data 
public class FileUpload {

	private String fileOriginalFilename; 
	private String fileName; 
	private String fileUploadPath; 
	private long fileSize; 
	private String fileContentType; 
	private String fileUrl;
}
