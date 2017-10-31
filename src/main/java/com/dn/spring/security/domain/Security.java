package com.dn.spring.security.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

@SuppressWarnings("serial")
public class Security implements UserDetails {

    private User user;
    private Collection<? extends GrantedAuthority> authorities;

    private int id;


    public Security(User user, Collection<? extends GrantedAuthority> authorities) {
        this.user = user;
        this.authorities = authorities;
        this.id = user.getUserId();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    public String getUsername() {
        return user.getLoginId();
    }


    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }


    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }


    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }


    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true;
    }

    public User getUser() {
        return user;
    }

    /*public void setUserDetail(Object userDetail) {
        this.user.setUserDetail(userDetail);
    }*/


    @Override
    public String getPassword() {
        return user.getPassword();
    }

    public int getId() {
        return this.id;
    }


    public void setId(int id) {
        this.id = id;
    }


}
