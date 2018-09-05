package com.github.mapper.user;


import java.util.List;
import java.util.Map;

import com.github.po.user.User;

public interface UserMapper {

    int insert(User record);

    int updateByPrimaryKey(User record);
    
    User selectByPrimaryKey(Long id);
    
    User selectByUsername(String username);
    
    List<User> findUser(User user);
    
    void deleteByPrimaryKey(Long id);
    
    void deleteByIds(Map map);
    
}