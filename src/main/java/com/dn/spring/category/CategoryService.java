package com.dn.spring.category;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.spring.category.domain.Category;
import com.dn.spring.category.support.CategoryParam;

@Service
public class CategoryService {

	@Autowired
	CategoryMapper categoryMapper;
	
	public ArrayList<Category> selectCategoryList(CategoryParam categoryParam){
		return categoryMapper.selectCategoryList(categoryParam);
	}
	
	public int selectCategoryCount(CategoryParam categoryParam){
		return categoryMapper.selectCategoryCount(categoryParam);
	}
	
	public ArrayList<Category> selectCategoryLevelList(CategoryParam categoryParam){
		return categoryMapper.selectCategoryLevelList(categoryParam);
	}
	
	public ArrayList<Category> selectCategoryGropList(){
		return categoryMapper.selectCategoryGropList();
	}
	
}
