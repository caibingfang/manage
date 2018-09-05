package com.github.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.service.menu.MenuService;
import com.github.vo.menu.MenuVO;

@Controller
public class IndexController {

	Logger logger = LoggerFactory.getLogger(IndexController.class);

	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/")
	public String page(HttpServletRequest request, HttpServletResponse response) {
		return "redirect:index";
	}

	@RequestMapping("/index")
	public String index(HttpServletRequest request, HttpServletResponse response) {
		String username = (String) request.getSession().getAttribute("username");
		if (username == null) {
			return "redirect:login";
		}
		return "redirect:ajax";
	}

	@RequestMapping("/ajax")
	public String ajax(HttpServletRequest request, Model model) {
		String username = (String) request.getSession().getAttribute("username");
		model.addAttribute("username", username);
		
		List<MenuVO> menuList = menuService.selectMenu();
		model.addAttribute("menuList", menuList);
		return "ajax";
	}

	@RequestMapping("/ajax/**")
	public String notfound(HttpServletRequest request, HttpServletResponse response) {
		logger.info("404:" + request.getServletPath());
		return "404";
	}

	@RequestMapping("/404")
	public String adminErrorTenant(HttpServletRequest request) {
		logger.info("404page:" + request.getServletPath());
		return "404";
	}

}
