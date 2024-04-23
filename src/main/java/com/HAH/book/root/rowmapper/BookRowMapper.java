package com.HAH.book.root.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.HAH.book.root.dto.Book;
import com.HAH.book.root.dto.Category;

@Component
public class BookRowMapper implements RowMapper<Book> {

	@Override
	public Book mapRow(ResultSet rs, int rowNum) throws SQLException {

		var book = new Book();
		book.setCategory(new Category());
		book.getCategory().setId(rs.getInt("categoryId"));
		book.getCategory().setName(rs.getString("categoryName"));
		book.setTitle(rs.getString("title"));
		book.setAuthor(rs.getString("author"));
		book.setPrice(rs.getInt("price"));
		book.setRemark(rs.getString("remark"));
		book.setId(rs.getInt("id"));
		return book;
	}

}
