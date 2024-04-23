package com.HAH.book.root.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.HAH.book.root.dto.Book;
import com.HAH.book.root.rowmapper.BookRowMapper;

@Service
public class BookService {

	@Autowired
	private SimpleJdbcInsert bookInsert;

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	private BookRowMapper bookRowMapper;

	private static final String SELECT = """
			select b.id, b.title, b.author, b.price, b.remark,
			c.id categoryId, c.name categoryName from book b join category c
			on c.id = b.category_id where 1 = 1
			""";
	
	private static final String UPDATE = """
			update book set title = :title,
			author = :author, category_id = :category_id,
			price = :price, remark = :remark 
			where id = :id
			""";

	public List<Book> search(Integer category, String keyword) {

		StringBuffer sb = new StringBuffer(SELECT);

		Map<String, Object> params = new HashMap<>();

		if (null != category) {
			sb.append(" and c.id = :categoryId");
			params.put("categoryId", category);
		}

		if (StringUtils.hasLength(keyword)) {
			sb.append("""
					and (
					lower(b.title) like :keyword
					or lower(b.author) like :keyword
					or lower(c.name) like :keyword
					)""");
			params.put("keywoord", keyword.toLowerCase().concat("%"));
		}
		return jdbcTemplate.query(sb.toString(), params, bookRowMapper);
	}

	public Optional<Book> findById(int id) {

		return jdbcTemplate.queryForStream(SELECT.concat(" and b.id = :id"), Map.of("id", id), bookRowMapper)
				.findFirst();
	}

	public int save(Book book) {

		if (book.getId() == 0) {
			return bookInsert.executeAndReturnKeyHolder(book.getInsertParams()).getKey().intValue();
		}

		jdbcTemplate.update(UPDATE, book.getUpdateParams());
		return 0;
	}

}
