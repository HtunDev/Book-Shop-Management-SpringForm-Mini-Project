package com.HAH.book.mvc.controller.advice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.HAH.book.root.dto.Category;
import com.HAH.book.root.service.CategoryService;

@ControllerAdvice
public class CategoryControllerAdvice {
	
	@Autowired
	private CategoryService categoryService;
	
	@ModelAttribute("categories")
	public List<Category> categories(){
		return categoryService.getAll();
	}

}
