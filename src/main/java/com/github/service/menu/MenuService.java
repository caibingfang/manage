package com.github.service.menu;

import java.util.List;

import com.github.po.menu.Menu;
import com.github.service.BaseService;
import com.github.vo.menu.MenuVO;

public interface MenuService extends BaseService<Menu> {

	List<MenuVO> selectMenu();
	
}
