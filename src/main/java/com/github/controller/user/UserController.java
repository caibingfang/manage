package com.github.controller.user;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.po.user.User;
import com.github.service.user.UserService;
import com.github.vo.ResultVO;
import com.github.vo.user.UserEditVO;
import com.github.vo.user.UserQueryVO;

@Controller
@RequestMapping("/ajax/user")
public class UserController {

	Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@RequestMapping("/list")
	public String toPage(UserQueryVO vo, Model model) {
		PageHelper.startPage(vo.getPageNum(), vo.getPageSize());
		User user = new User();
		BeanUtils.copyProperties(vo, user);
		List<User> userList = userService.findUser(user);
		PageInfo<User> page = new PageInfo<User>(userList);
		model.addAttribute("page", page);
		model.addAttribute("query", vo);
		return "user/list";
	}

	@RequestMapping("/form")
	public String toPage() {

		return "user/user";
	}

	@RequestMapping("/add")
	public String toAdd() {

		return "user/edit";
	}

	@RequestMapping("/save")
	@ResponseBody
	public ResultVO toSave(@Validated UserEditVO vo) {
		User user = new User();
		BeanUtils.copyProperties(vo, user);
		if(vo.getId()==null){
			userService.insert(user);
		} else {
			userService.updateByPrimaryKey(user);
		}
		
		ResultVO result = ResultVO.getSuccessResult();
		logger.info(vo.toString());
		return result;
	}

	@RequestMapping("/edit")
	public String toEdit(Long id,Model model) {
		User user = userService.selectByPrimaryKey(id);
		UserEditVO editVO = new UserEditVO();
		BeanUtils.copyProperties(user, editVO);
		model.addAttribute("user", editVO);
		return "user/edit";
	}

	@RequestMapping("/delete")
	public String toDelete(String ids) {
		userService.deleteByIds(ids);
		return "redirect:/ajax/user/list";
	}

}
