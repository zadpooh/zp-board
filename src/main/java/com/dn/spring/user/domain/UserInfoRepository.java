package com.dn.spring.user.domain;

import java.util.ArrayList;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserInfoRepository extends MongoRepository<UserInfo, String> {

    public ArrayList<UserInfo> findByUserId(String userId);
    public ArrayList<UserInfo> findByUserNikNm(String userNikNm);

}
