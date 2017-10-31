package com.dn.spring.category.support;

import lombok.Data;

@Data
public class CategoryParam {
	private int categoryId;
	private String categoryCode;
	private String categoryName;
	private int categoryLevel;
}
