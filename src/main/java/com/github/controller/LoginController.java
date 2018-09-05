package com.github.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.po.user.User;
import com.github.service.user.UserService;
import com.github.vo.LoginVO;
import com.github.vo.ResultVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	Logger logger = LoggerFactory.getLogger(IndexController.class);

	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/form")
	@ResponseBody
	public ResultVO login(@Validated LoginVO loginVO,HttpSession httpSession) {
		ResultVO result = ResultVO.getSuccessResult();

		User user = userService.selectByUsername(loginVO.getUsername());
		if(user==null){
			result = ResultVO.getFailureResult();
			result.setMessage("该用户不存在");
		} else if(!loginVO.getPassword().equals(user.getPassword())) {
			result = ResultVO.getFailureResult();
			result.setMessage("密码错误");
		} else {
			httpSession.setAttribute("username", user.getUsername());
		}
		
		return result;
	}

	@RequestMapping
	public String login(HttpServletRequest request, HttpServletResponse response) {
		return "login";
	}
	
	
	@RequestMapping("/out")
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:/login";
	}
	
	
}
