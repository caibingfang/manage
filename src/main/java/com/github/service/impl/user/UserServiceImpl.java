package com.github.service.impl.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.mapper.user.UserMapper;
import com.github.po.user.User;
import com.github.service.user.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public void insert(User t) {
		userMapper.insert(t);
	}

	@Override
	public User selectByPrimaryKey(Long id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateByPrimaryKey(User t) {
		userMapper.updateByPrimaryKey(t);
	}

	@Override
	public void deleteByPrimaryKey(Long id) {
		userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public User selectByUsername(String username) {
		return userMapper.selectByUsername(username);
	}

	@Override
	public List<User> findUser(User user) {
		List<User> findUser = userMapper.findUser(user);
		return findUser;
	}

	@Override
	public void deleteByIds(String ids) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("ids", ids);
		userMapper.deleteByIds(map);
	}

}
