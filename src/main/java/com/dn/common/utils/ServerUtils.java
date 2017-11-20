package com.dn.common.utils;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class ServerUtils {
	
	private static Logger logger = LoggerFactory.getLogger(StringUtils.class);
	
	public static HttpServletRequest getRequest(){
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}
	
	public static String serverHostName() {
		return "http://"+getRequest().getServerName() + ( getRequest().getLocalPort() == 80 ? "" : ":"+getRequest().getLocalPort() ) ;
	}

	public static String localHostName() {
		return "http://"+getRequest().getLocalName() + ( getRequest().getLocalPort() == 80 ? "" : ":"+getRequest().getLocalPort() ) ;
	}

	public static String referer() {
		return getRequest().getHeader("referer") == null ? "" : getRequest().getHeader("referer").split("\\?")[0];
	}
	
	public static String remoteIp() {
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String recentLoginIp = req.getHeader("X-FORWARDED-FOR");
	    if (recentLoginIp == null) {
        	recentLoginIp = req.getRemoteAddr();
        }
	    return recentLoginIp;
	}
	
	

}
