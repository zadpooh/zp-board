package com.dn.spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.expression.SecurityExpressionHandler;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.access.vote.RoleHierarchyVoter;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	ApplicationContext applicationContext;
	
	@Autowired
	SecurityService securityService;

	
	@Override
    public void configure(WebSecurity web) throws Exception {
        web
            .ignoring()
                .antMatchers("/content/**", "/blog/**", "/ace/**", "/resources/**", "/webjars/**","/favicon.ico");
    }
	
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	
    	http.csrf().disable();
    	
    	http.headers().frameOptions().disable();
    	
    	http
	        .authorizeRequests()
                .antMatchers("/dnmanager").hasAuthority("SUPERVISOR")
                .antMatchers("/dnmanager/**").hasAuthority("SUPERVISOR")
                .antMatchers("/").permitAll()
                .antMatchers("/**").permitAll()
	            .anyRequest().authenticated()
	            .and()
	        .formLogin()
	            .loginPage("/dnmanager/user/login")
	            .failureUrl("/dnmanager/user/login?error=500")
	            .loginProcessingUrl("/dnmanager/user/auth-login")
	            .defaultSuccessUrl("/dnmanager/main",true)  // true : always-use-default-target
                .usernameParameter("loginId")
	            .permitAll()
	            .and()
	        .logout()
	            .logoutUrl("/dnmanager/user/auth-logout")
	            .logoutSuccessUrl("/dnmanager/user/login")
	            .invalidateHttpSession(true)
	            .deleteCookies("JSESSIONID")
	            .permitAll();
	    http.exceptionHandling().accessDeniedPage("/dnmanager/user/login?error=500");
    }
    
    @Bean
    public RoleHierarchy roleHierarchy() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        roleHierarchy.setHierarchy("SUPERVISOR > ROLE_MANAGER > ROLE_ADMIN > ROLE_USER");
        return roleHierarchy;
    }

    @SuppressWarnings("unused")
	private SecurityExpressionHandler<FilterInvocation> webExpressionHandler() {
        DefaultWebSecurityExpressionHandler defaultWebSecurityExpressionHandler = new DefaultWebSecurityExpressionHandler();
        defaultWebSecurityExpressionHandler.setApplicationContext(applicationContext);
        defaultWebSecurityExpressionHandler.setRoleHierarchy(roleHierarchy());
        return defaultWebSecurityExpressionHandler;
    }

    @Bean
    public RoleHierarchyVoter roleHierarchyVoter() {
      return new RoleHierarchyVoter(roleHierarchy());
    }
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
         auth.userDetailsService(securityService)
                 .passwordEncoder(securityService.passwordEncoder());
    }
    
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
         return super.authenticationManagerBean();
    }
    
}
