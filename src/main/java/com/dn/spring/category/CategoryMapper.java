package com.dn.spring.category;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.dn.spring.category.domain.Category;
import com.dn.spring.category.support.CategoryParam;

@Mapper
public interface CategoryMapper {
	
	public ArrayList<Category> selectCategoryList(CategoryParam categoryParam);
	
	public int selectCategoryCount(CategoryParam categoryParam);
	
	public ArrayList<Category> selectCategoryLevelList(CategoryParam categoryParam);
	
	public ArrayList<Category> selectCategoryGropList();
	
}
