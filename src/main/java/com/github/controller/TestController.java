package com.github.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
//@RequestMapping("/assets")
public class TestController {
//	@RequestMapping("/js/jquery.validate.min.js")
	@ResponseBody
	public String page(HttpServletRequest request, HttpServletResponse response) {
		return "test";
	}
}
