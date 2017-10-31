package com.dn.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dn.common.ThreadContext;
import com.dn.spring.annotations.RequestPropertyData;

public class ViewUtils {
	
	private final static Logger logger = LoggerFactory.getLogger(ViewUtils.class);
	
	/**
	 * URI 기반으로 뷰를 지정하여 리턴한다.
	 * @return
	 */
	public static String view() {
		boolean isDnmanager = false;
		String viewName = getUriBaseViewName(isDnmanager);

		if (isDnmanager) {
			return getManagerView(viewName);
		} else { 
			return getView(viewName);
		}
	}
	
	private static String getUriBaseViewName(boolean isDnmanager) {
		String requestUri = ServerUtils.getRequest().getRequestURI();
		String uri = requestUri;
		if (requestUri.indexOf(";") > -1) {
			uri = StringUtils.delimitedListToStringArray(requestUri, ";")[0];
		}
		
		String contextPath = ServerUtils.getRequest().getContextPath();
		
		String[] uris = StringUtils.delimitedListToStringArray(uri, "/");
		StringBuffer sb = new StringBuffer();
		
		for (int i = 1; i < uris.length; i++) {
			if (uris[i].equals("dnmanager")) {
				isDnmanager = true;
				continue;
			}
			
			if (uris[i].equals(contextPath)) {
				continue;
			}
			

			if (i == (uris.length-1) && uris[i].equals("create")) {
				uris[i] = "form";
			}
			
			if (i == (uris.length-2) && uris[i].equals("edit")) {
				uris[i] = "form";
			}
			
			try {
				Integer.parseInt(uris[i]);
				
			} catch (Exception e) {
				sb.append("/" + uris[i]);
			}
		} 
		
		return  sb.toString().replace("/mobile", "");
	}
	
	/**
	 * 뷰 이름을 지정한다.
	 * @since 2011. 6. 2. - ARDEN
	 * @param viewName
	 * @return
	 */
	public static String getView(String viewName) {
		
		String requestUri = ServerUtils.getRequest().getRequestURI();
		
		RequestPropertyData requestPropertyData = (RequestPropertyData) ThreadContext.get("requestPropertyData");
		
		String finalViewName = "";
		
		String layout = "blank";
		String template = "front";
	
		
		if (requestPropertyData != null) {
			if (requestPropertyData.getLayout() != null)
				layout = requestPropertyData.getLayout();
			
			if (requestPropertyData.getTemplate() != null)
				template = requestPropertyData.getTemplate();
		}
		
		finalViewName = "//"+template + "/jsp/" + layout + viewName;
		
		if( requestUri.indexOf("dnmanager") > -1 ) {
			finalViewName = getManagerView(viewName);
		}
		
		return finalViewName;
	}
	
	public static String getManagerView(String viewName) {
		
		RequestPropertyData requestPropertyData = (RequestPropertyData) ThreadContext.get("requestPropertyData");
		
		String layout = "blank";
		String template = "dnmanager";
		
		if (requestPropertyData != null) {
			layout = requestPropertyData.getLayout();
		}
		
		return "//"+template + "/jsp/" + layout + viewName;
	}
	
	public static String redirect(String viewName) {
		return "redirect:" + viewName;
	}

}
