package com.HAH.book.mvc.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.HAH.book.root.dto.Book;
import com.HAH.book.root.service.BookService;

import lombok.Getter;

@Controller
@RequestMapping({ "/home", "/book" })
public class HomeController {

	@Autowired
	private BookService bookService;

	@GetMapping
	String index(@RequestParam(required = false) Integer category, @RequestParam(required = false) String keyword,
			ModelMap model) {

		// search books with request parameters
		var bookLists = bookService.search(category, keyword);

		// add result data to model
		model.put("bookLists", bookLists);

		return "home";
	}

	@GetMapping("edit")
	String edit() {
		return "book-edit";
	}

	@GetMapping("details")
	String details() {
		return "book-details";
	}

	@PostMapping
	String save(@Validated @ModelAttribute Book book, BindingResult result, RedirectAttributes redirect) {

		if (result.hasErrors()) {
			return "book-edit";
		}

		var id = bookService.save(book);
		redirect.addAttribute("id", id);

		return "redirect:/book/details";
	}

	@ModelAttribute("book")
	public Book getBook(@RequestParam Optional<Integer> id) {
		return id.flatMap(a -> bookService.findById(a)).orElse(new Book());
	}

}
