package com.HAH.book.root.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import com.HAH.book.root.dto.Category;

@Service
public class CategoryService {

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	public List<Category> getAll() {

		return jdbcTemplate.query("select * from category", new BeanPropertyRowMapper<>(Category.class));
	}

}
