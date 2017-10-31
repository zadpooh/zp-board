package com.dn.spring.user;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dn.common.utils.ServerUtils;
import com.dn.common.utils.StringUtils;
import com.dn.common.utils.ValidationUtils;
import com.dn.spring.ConfigProperties;
import com.dn.spring.email.EmailService;
import com.dn.spring.email.domain.Email;
import com.dn.spring.file.FileService;
import com.dn.spring.file.domain.FileUpload;
import com.dn.spring.user.domain.UserInfo;
import com.dn.spring.user.support.UserInfoParam;

@Service
public class UserService {

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	ConfigProperties config;
	
	/**
	 * 회원 상세정보
	 * @param userInfo
	 * @return User
	 */
	public UserInfo selectUserInfoById(UserInfo userInfo){
		return userMapper.selectUserInfoById(userInfo);
	}
	
	/**
	 * 회원 상세정보 조회후 패스워드 검증
	 * @param userInfo
	 * @return User
	 * @throws UnsupportedEncodingException 
	 */
	public boolean LoginAndPassword(UserInfo userInfo) throws UnsupportedEncodingException{
		
		try {
			
			UserInfo userDetail = userMapper.selectUserInfoById(userInfo);
			return StringUtils.equals(userDetail.getPswd(), StringUtils.encodePassword(userInfo.getPswd(), "MD5"));
			
		} catch (Exception e) {
			
			return false;
		}
	}
	
	/**
	 * 회원 상세정보 SNS 타입
	 * @param userInfo
	 * @return User
	 */
	public UserInfo selectUserInfoByIdAndJoinTy(UserInfo userInfo){
		
		selectUserCheckAndInsert(userInfo);
		return userMapper.selectUserInfoByIdAndJoinTy(userInfo);
	}
	
	/**
	 * 회원가입
	 * @param userInfo
	 */
	public void insertUserInfo(UserInfo userInfo){
		userMapper.insertUserInfo(userInfo);
	}
	
	/**
	 * 회원수정
	 * @param userInfo
	 */
	public void updateUserInfo(UserInfo userInfo){
		userMapper.updateUserInfo(userInfo);
	}
	
	/**
	 * 회원수정
	 * @param userInfo
	 */
	public String updateUserInfoAndNikNmCheck(UserInfo userInfo, HttpSession session, MultipartFile uploadFile){
		// 회원 정보 조회
		UserInfo userOldInfo = (UserInfo) session.getAttribute("user");
		userOldInfo = userMapper.selectUserInfoById(userOldInfo);
		userInfo.setUserId(userOldInfo.getUserId());
		try{
			
			if( LoginAndPassword(userInfo) == false && StringUtils.equals(userOldInfo.getJoinTy(), "ninano")){
				return "UIN0003";
			}
			
			FileUpload fileUpload = new FileUpload();
			
			if( uploadFile != null && uploadFile.getSize() > 0 ){
				
				File file = new File(config.getFileUploadPath()+userOldInfo.getUserPhoto());
				if(!file.delete()){
					//return "FUP9998";
				}
				
				fileUpload = fileService.fileUpload(uploadFile);
				userInfo.setUserPhoto(fileUpload.getFileUrl());
				
			}
			
			if( StringUtils.equals(userOldInfo.getUserNikNm(), userInfo.getUserNikNm()) == false ){
				
				if( userMapper.selectUserNikNmwkCheck(userInfo) > 0 || StringUtils.equals(userInfo.getFlagUserNikNm(), "Y") == false ) {
					return "UIN0002";
				}
				
				userMapper.updateUserInfo(userInfo);
				
				
			} else {
				userMapper.updateUserInfo(userInfo);
			}
			
			
		} catch(Exception e) {
			return "UIN0000";
		}
		
		return "SUCCESS";
	}
	
	/**
	 * 회원가입
	 * @param userInfo
	 */
	public String insertUserInfoAndIdCheckToNikNm(UserInfo userInfo){
		
		
		try{
			if( StringUtils.equals(IdCheckToNikNm(userInfo), "SUCCESS")  ) {
				userMapper.insertUserInfo(userInfo);
			} else {
				return IdCheckToNikNm(userInfo);
			}
			
		} catch(Exception e) {
			return "UIN0000";
		}
		
		return "SUCCESS";
	}
	
	public String IdCheckToNikNm(UserInfo userInfo){
		
		String result = "SUCCESS";
		
		if( userMapper.selectUserIdCheck(userInfo) > 0 || StringUtils.equals(userInfo.getFlagUserId(), "Y") == false ) {
			result = "UIN0001";
		}
		
		if( userMapper.selectUserNikNmwkCheck(userInfo) > 0 || StringUtils.equals(userInfo.getFlagUserNikNm(), "Y") == false ) {
			result = "UIN0002";
		}
		
		return result; 
	}
	
	public String IdCheckToNikNm(UserInfo userInfo, String type){
		
		String result = "SUCCESS";
		
		if( StringUtils.equals(type, "userId") ) {
			if( userMapper.selectUserIdCheck(userInfo) > 0 ) {
				result = "UIN0001";
			}
		}
		
		if( StringUtils.equals(type, "userNikNm") ) {
			if( userMapper.selectUserNikNmwkCheck(userInfo) > 0 ) {
				result = "UIN0002";
			}
		}
		
		return result; 
	}
	
	/**
	 * 로그인 정보 업데이트
	 * @param userInfo
	 */
	public void updateUserInfoLogIn(UserInfo userInfo){
		userMapper.updateUserInfoLogIn(userInfo);
	}
	
	/**
	 * 회원 상세정보 조회후 없으면 등록
	 * @param userInfo
	 * @return
	 */
	public void selectUserCheckAndInsert(UserInfo userInfo){
		
        String recentLoginIp = ServerUtils.remoteIp();
   
		UserInfo userInfo2 = userMapper.selectUserInfoById(userInfo);
		
		if( userInfo2 == null ) {
			userInfo.setUserNikNm("니나노"+userMapper.selectUserNikMax());
			userInfo.setRecentLoginIp(recentLoginIp);
			userMapper.insertUserInfo(userInfo);
		} else {
			userInfo.setRecentLoginIp(recentLoginIp);
			userMapper.updateUserInfoLogIn(userInfo);
		}
		
	}
	
	/**
	 * 회원 정보
	 * @param userInfo
	 * @return User
	 */
	public int selectAllUserCount(UserInfoParam userInfoParam){
		return userMapper.selectAllUserCount(userInfoParam);
	}
	
	
	/**
	 * 회원 정보
	 * @param userInfo
	 * @return User
	 */
	public ArrayList<UserInfo> selectUserList(UserInfoParam userInfoParam){
		return userMapper.selectUserList(userInfoParam);
	}
	
	/**
	 * 회원 상세정보
	 * @param userInfo
	 * @return User
	 */
	public ArrayList<UserInfo> selectUserDetailList(UserInfo userInfo){
		return userMapper.selectUserDetailList(userInfo);
	}
	
	/**
	 * 회원 삭제
	 * @param userInfo
	 * @return User
	 */
	public void selectUserDelete(String userId){
		userMapper.selectUserDelete(userId);
	}
	
	/**
	 * 회원 정보
	 * @param userInfo
	 * @return User
	 */
	public int selectUserNikMax(){
		return userMapper.selectUserNikMax();
	}
	
	/**
	 * 
	 * @param userInfoParam
	 * @return
	 */
	public String selectPasswordSearch(UserInfo userInfo){
		
		if(ValidationUtils.isNull(userInfo.getUserId())){
			return "PWD0001"; //입력된 이메일이 없습니다.
		}
		
		userInfo = userMapper.selectUserInfoById(userInfo);
		
		if(ValidationUtils.isNull(userInfo)){
			return "PWD0003"; //회원 데이터가 존재 하지않습니다.
		}
		
		if(StringUtils.equals(userInfo.getJoinTy(), "ninano") == false){
			return "PWD0002"; //SNS 회원은 해당 SNS에서 찾기 바랍니다.
		}
		
		String newPassword = StringUtils.randomString();
		userInfo.setPswd(newPassword);
		
		userMapper.updateUserInfoPassword(userInfo);
		
		Email email = new Email();
		
		email.setEmailTemplate("email-password");
		email.setToUserEmail(userInfo.getUserId());
		email.setFromUserEmail("ninanomusic0907@gmail.com");
		email.setTitle("[니나노] 비밀번호 분실로 인한 새비밀번호 입니다.");
		email.setContent(newPassword);
		
		emailService.mailHtmlSender(email);
		
		return "SUCCESS";
	}
	
	/**
	 * 회원 삭제
	 * @param userInfo
	 */
	public void deleteUserInfo(UserInfo userInfo){
		userMapper.deleteUserInfo(userInfo);
	}
	
	/**
	 * 회원 토큰 삭제
	 * @param userInfo
	 */
	public void deleteUserToken(UserInfo userInfo){
		userMapper.deleteUserToken(userInfo);
	}
	
	/**
	 * 휴면 회원 조회
	 * @return
	 */
	public ArrayList<UserInfo> selectUserDiapauseList(){
		return userMapper.selectUserDiapauseList();
	}
	
	/**
	 * 휴면회원으로 변경 
	 * @param userInfo
	 */
	public void updateDiapauseUserInfo(UserInfo userInfo){
		userMapper.updateDiapauseUserInfo(userInfo);
		
		Email email = new Email();
		
		email.setEmailTemplate("email-diapause");
		email.setToUserEmail(userInfo.getUserId());
		email.setFromUserEmail("ninanomusic0907@gmail.com");
		email.setTitle("[니나노] 3개월동안 로그인 기록이 없어서 휴면계정으로 전환됩니다.");
		email.setContent("3개월동안 로그인 기록이 없어서 휴면계정으로 전환됩니다.");
		
		emailService.mailHtmlSender(email);
		
	}
}
