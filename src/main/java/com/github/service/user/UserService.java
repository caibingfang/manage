package com.github.service.user;

import java.util.List;

import com.github.po.user.User;
import com.github.service.BaseService;

public interface UserService extends BaseService<User>{

	User selectByUsername(String username);
	
	List<User> findUser(User user);
	
	void deleteByIds(String ids);
	
}
