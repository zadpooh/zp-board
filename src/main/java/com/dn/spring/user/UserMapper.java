package com.dn.spring.user;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.dn.spring.user.domain.UserInfo;
import com.dn.spring.user.support.UserInfoParam;

@Mapper
public interface UserMapper {

	public UserInfo selectUserInfoById(UserInfo userInfo);
	
	public UserInfo selectUserInfoByIdAndJoinTy(UserInfo userInfo);
	
	public void insertUserInfo(UserInfo userInfo);
	
	public void updateUserInfo(UserInfo userInfo);
	
	public void updateUserInfoLogIn(UserInfo userInfo);
	
	public int selectAllUserCount(UserInfoParam userInfoParam);
	
	public int selectSearchUserCount(UserInfo userInfo);
	
	public ArrayList<UserInfo> selectUserList(UserInfoParam userInfoParam);
	
	public ArrayList<UserInfo> selectUserSearchList(UserInfoParam userInfoParam);
	
	public ArrayList<UserInfo> selectUserDetailList(UserInfo userInfo);
	
	public void selectUserDelete(String userId);
	
	public int selectUserIdCheck(UserInfo userInfo);
	
	public int selectUserNikNmwkCheck(UserInfo userInfo);
	
	public int selectUserNikMax();
	
	public void updateUserInfoPassword(UserInfo userInfo);
	
	public void deleteUserInfo(UserInfo userInfo);
	
	public void deleteUserToken(UserInfo userInfo);
	
	public ArrayList<UserInfo> selectUserDiapauseList();
	
	public void updateDiapauseUserInfo(UserInfo userInfo);
}
