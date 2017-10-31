package com.dn.spring.category.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Category {
	private int categoryId;
	private String categoryCode;
	private String categoryName;
	private String userId;
	private String remoteIp;
	private String registDe;
	
	private ArrayList<CategorySub> categorySub;

}
