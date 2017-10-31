package com.dn.spring.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dn.common.utils.DateUtils;
import com.dn.spring.ConfigProperties;
import com.dn.spring.file.domain.FileUpload;

@Service
public class FileService {

	@Autowired
	private ConfigProperties config;
	
	public static final String DEFAULT_UPLOAD_PATH = "upload";
	
	public ResponseEntity<?> fileUploadRespone(MultipartFile sourceFile) throws IOException{
		return new ResponseEntity<>(fileUpload(sourceFile) , HttpStatus.OK);
	}
	
	public ResponseEntity<?> fileUploadRespone(MultipartFile[] sourceFiles) throws IOException{
		return new ResponseEntity<>(fileUpload(sourceFiles), HttpStatus.OK);
	}
	
	public JSONObject fileUploadJson(MultipartFile sourceFile) throws IOException{
		return new JSONObject().put("fileUpload",fileUpload(sourceFile));
	}
	
	public JSONObject fileUploadJson(MultipartFile[] sourceFiles) throws IOException{
		JSONObject jsonObject = new JSONObject();
		for(FileUpload fileUpload : fileUpload(sourceFiles)){
			jsonObject.put("fileUpload", fileUpload);
		}
		return jsonObject;
	}
	
	public FileUpload fileUpload(MultipartFile sourceFile) throws IOException{
		
		String sourceFilePath = DEFAULT_UPLOAD_PATH + "/" + sourceFile.getContentType() + "/" + DateUtils.getToday() + "/"; 
		String sourceFileName = sourceFile.getOriginalFilename(); 
		String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
		File destinationFile; 
		String destinationFileName;
		
		do { 
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
			destinationFile = new File( config.getFileUploadPath() + sourceFilePath + destinationFileName); 
		} while (destinationFile.exists()); 
		destinationFile.getParentFile().mkdirs(); 
		sourceFile.transferTo(destinationFile); 
		
		FileUpload response = new FileUpload();
		response.setFileOriginalFilename(sourceFile.getOriginalFilename()); 
		response.setFileName(destinationFileName); 
		response.setFileSize(sourceFile.getSize()); 
		response.setFileContentType(sourceFile.getContentType()); 
		response.setFileUploadPath(config.getFileUploadPath() + sourceFilePath);
		response.setFileUrl("/" + sourceFilePath + destinationFileName);
		//response.setFileUrl("http://"+config.getServerDomain() + "/" + sourceFilePath + destinationFileName);
		
		return response;
	}
	
	public ArrayList<FileUpload> fileUpload(MultipartFile[] sourceFiles) throws IOException{
		
		ArrayList<FileUpload> list = new ArrayList<FileUpload>(); 
		
		for(MultipartFile sourceFile : sourceFiles){
			String sourceFilePath = DEFAULT_UPLOAD_PATH + "/" + sourceFile.getContentType() + "/" + DateUtils.getToday() + "/";
			String sourceFileName = sourceFile.getOriginalFilename(); 
			String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
			File destinationFile; 
			String destinationFileName;
			
			do { 
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
				destinationFile = new File( config.getFileUploadPath() + sourceFilePath + destinationFileName); 
			} while (destinationFile.exists()); 
			destinationFile.getParentFile().mkdirs(); 
			sourceFile.transferTo(destinationFile); 
			
			FileUpload response = new FileUpload(); 
			response.setFileOriginalFilename(sourceFile.getOriginalFilename()); 
			response.setFileName(destinationFileName); 
			response.setFileSize(sourceFile.getSize()); 
			response.setFileContentType(sourceFile.getContentType()); 
			response.setFileUploadPath(config.getFileUploadPath() + sourceFilePath);
			response.setFileUrl("/" + sourceFilePath + destinationFileName);
//			response.setFileUrl("http://"+config.getServerDomain() + "/" + sourceFilePath + destinationFileName);
			
			list.add(response);
		}
		
		return list;
	}

}
