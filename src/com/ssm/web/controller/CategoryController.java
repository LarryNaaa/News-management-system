package com.ssm.web.controller;

import com.ssm.po.Category;
import com.ssm.po.User;
import com.ssm.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/*
 * Category控制类
 */
@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/findCategoryList.action")
    public String findCategoryList(Model model, Integer categoryListRoleId, String keywords){
        //获取新闻类别集合列表
        List<Category> categoryList = categoryService.findCategoryList();

        model.addAttribute("categoryList", categoryList);
        model.addAttribute("categoryListRoleId", categoryListRoleId);
        model.addAttribute("keywords", keywords);
        return "category/category_list";
    }

    @RequestMapping(value = "/toAddCategory.action")
    public String toAddCategory(Model model){
        return "category/add_category";
    }

    @RequestMapping(value = "/addCategory.action", method = RequestMethod.POST)
    public String addCategory(Category category, Model model){
        int rows = categoryService.addCategory(category);
        if(rows > 0){
            return "redirect:findCategoryList.action";
        }else {
            return "category/add_category";
        }
    }

    @RequestMapping(value = "/toEditCategory.action")
    public String toEditCategory(Integer categoryId, Model model){
        Category category = categoryService.findCategoryById(categoryId);
        if (category != null){
            model.addAttribute("category", category);
            return "category/edit_category";
        }else {
            return "redirect:findCategoryList.action";
        }
    }

    @RequestMapping(value = "/editCategory.action")
    public String editCategory(Category category, Model model){
        int rows = categoryService.editCategory(category);
        if(rows > 0){
            return "redirect:findCategoryList.action";
        }else {
            return "category/edit_category";
        }
    }

    @RequestMapping(value = "/delCategory.action")
    @ResponseBody
    public Category delCategory(@RequestBody Category category, Model model) {
        int rows = categoryService.delCategory(category.getCategoryId());
        if (rows>0) {
            return category;
        }else{
            //此处设置userId为0，只是作为操作失败的标记用
            category.setCategoryId(0);
            return category;
        }
    }
}
