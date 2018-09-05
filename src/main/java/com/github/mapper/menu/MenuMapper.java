package com.github.mapper.menu;

import java.util.List;

import com.github.po.menu.Menu;

public interface MenuMapper {

	List<Menu> selectFirstLevelMenu();
	
	List<Menu> selectByParentId(Long parentId);
}
