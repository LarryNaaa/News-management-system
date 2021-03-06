package com.ssm.dao;
import java.util.List;
import com.ssm.po.Category;
/*
 * 新闻类别DAO层接口
 */
public interface CategoryDao {
	//查询所有新闻类别
	public List<Category> selectCategoryList();
	//根据新闻类别ID查询新闻类别
	public Category getCategoryById(Integer categoryId);
	//添加新闻类别
	public int addCategory(Category category);
	//修改新闻类别
	public int updateCategory(Category category);
	//删除新闻类别
	public int delCategory(Integer categoryId);
}