package com.HAH.book.root.dto;

import java.util.HashMap;
import java.util.Map;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class Book {

	private int id;
	@NotBlank(message = "{book.title.notNull}")
	private String title;
	@NotBlank(message = "{book.author.notNull}")
	private String author;
	@NotNull(message = "{book.category.notBlank}")
	private Category category;
	@Min(value = 5000, message = "book.price.min")
	private int price;
	private String remark;

	public Map<String, Object> getInsertParams() {
		var map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("author", author);
		map.put("category_id", category.getId());
		map.put("price", price);
		map.put("remark", remark);
		return map;
	}

	public Map<String, Object> getUpdateParams() {
		var map = getInsertParams();
		map.put("id", id);
		return map;
	}

}
