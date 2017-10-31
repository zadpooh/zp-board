package com.dn.spring.annotations;

import java.io.Serializable;

public class RequestPropertyData implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5950179124782818503L;
	
	private String title;
	private String template;
	private String layout;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLayout() {
		return layout;
	}
	public void setLayout(String layout) {
		this.layout = layout;
	}
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}
	

}
