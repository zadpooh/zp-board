package com.dn.spring.user.domain;

import com.dn.spring.user.support.UserInfoParam;

import lombok.Data;

@Data
public class UserInfo extends UserInfoParam {
	
	private String userId;
	private String userNikNm;
	private String pswd;
	private String userPhoto;
	private String userGreeting;
	private String tmprPswdAt;
	private String joinTy;
	private String snsId;
	private int userLvl = 0;
	private String recentLoginDe;
	private String recentLoginIp;
	private String useYn;
	private String registDe;
	private String registUser;
	private String updtDe;
	private String updtUser;
	
	@Override
    public String toString() {
        return String.format(
                "Customer[userId=%s, userNikNm='%s', recentLoginDe='%s']",
                userId, userNikNm, recentLoginDe);
    }
	
}
