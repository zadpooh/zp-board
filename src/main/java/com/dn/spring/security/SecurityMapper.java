package com.dn.spring.security;

import com.dn.spring.security.domain.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SecurityMapper {
	public User getUserByLoginId(String username);
}
