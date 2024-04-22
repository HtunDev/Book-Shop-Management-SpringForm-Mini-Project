package com.HAH.book.root.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.HAH.book.root.dto.Book;

@Service
public class BookService {

	public List<Book> search(int category, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	public Optional<Book> findById(Integer a) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	public int save(Book book) {
		// TODO Auto-generated method stub
		return 0;
	}

}
