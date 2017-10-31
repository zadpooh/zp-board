package com.dn.spring.security;

import com.dn.common.utils.ValidationUtils;
import com.dn.spring.security.domain.NotUser;
import com.dn.spring.security.domain.Security;
import com.dn.spring.security.domain.User;
import com.dn.spring.security.domain.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class SecurityService implements UserDetailsService {

	@Autowired
	private SecurityMapper securityMapper;

	private RoleHierarchy roleHierarchy = null;

	private Md5PasswordEncoder passwordEncoder = new Md5PasswordEncoder();

	public UserDetails loadUserByUsername(String loginId) throws UsernameNotFoundException {

		User user = securityMapper.getUserByLoginId(loginId);

		if( ValidationUtils.isNull(user)) {
			throw new UsernameNotFoundException(loginId + " 에 해당하는 사용자가 존재하지 않습니다.");
		}

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		// 권한 설정
		for (UserRole userRole : user.getUserRoles()) {
			authorities.add(new SimpleGrantedAuthority(userRole.getAuthority()));
		}

		/*Collection<? extends GrantedAuthority> roleHierarchyAuthorities = roleHierarchy.getReachableGrantedAuthorities(authorities);*/

        return new Security(user, authorities);
   }

	public User getCurrentUser() {

		if(SecurityContextHolder.getContext().getAuthentication() == null)
			return null;
		Object princial = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (princial instanceof UserDetails) {
			User user = ((Security) princial).getUser();
			return user;
		}
		else {
			return new NotUser();
		}
	}

	public Md5PasswordEncoder passwordEncoder() {
		return this.passwordEncoder;
	}



}
