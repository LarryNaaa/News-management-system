package com.ssm.service;
import java.util.List;
import com.ssm.po.Category;
/*
 * 新闻类别Service层接口
 */
public interface CategoryService {
	public List<Category> findCategoryList();
	public Category findCategoryById(Integer categoryId);
	public int addCategory(Category category);
	public int editCategory(Category category);
	public int delCategory(Integer categoryId);
}