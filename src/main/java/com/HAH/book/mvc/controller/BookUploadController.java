package com.HAH.book.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("upload")
public class BookUploadController {

	@PostMapping
	String upload(@RequestParam("uploadFile") MultipartFile multipartFile) {
		System.out.println(multipartFile.getName());
		return "home";
	}
}
