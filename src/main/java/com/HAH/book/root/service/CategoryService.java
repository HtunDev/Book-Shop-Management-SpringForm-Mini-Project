package com.HAH.book.root.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import com.HAH.book.root.dto.Category;

@Service
public class CategoryService {

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	private RowMapper<Category> categoryRowMapper;

	public CategoryService() {
		categoryRowMapper = new BeanPropertyRowMapper<>(Category.class);
	}

	public List<Category> getAll() {
		return jdbcTemplate.query("select * from category order by name", categoryRowMapper);
	}

	public Optional<Category> findById(int id) {
		return jdbcTemplate.queryForStream("select * from category where id = :id", Map.of("id", id), categoryRowMapper).findFirst();
	}

}
