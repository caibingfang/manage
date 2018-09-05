package com.github.service.impl.menu;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.mapper.menu.MenuMapper;
import com.github.po.menu.Menu;
import com.github.service.menu.MenuService;
import com.github.vo.menu.MenuVO;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMapper;

	@Override
	public void insert(Menu t) {

	}

	@Override
	public Menu selectByPrimaryKey(Long id) {
		return null;
	}

	@Override
	public void updateByPrimaryKey(Menu t) {

	}

	@Override
	public void deleteByPrimaryKey(Long id) {

	}

	@Override
	public List<MenuVO> selectMenu() {
		List<MenuVO> menuList = new ArrayList<MenuVO>();
		List<Menu> list = menuMapper.selectFirstLevelMenu();
		MenuVO menuVO = null;
		for (Menu menu : list) {
			menuVO = new MenuVO();
			BeanUtils.copyProperties(menu, menuVO);
			menuList.add(menuVO);
			List<MenuVO> sonMenuVOList = new ArrayList<MenuVO>();
			List<Menu> sonMenuList = menuMapper.selectByParentId(menu.getId());
			MenuVO sonMenuVO = null;
			for (Menu sonMenu : sonMenuList) {
				sonMenuVO = new MenuVO();
				BeanUtils.copyProperties(sonMenu, sonMenuVO);
				sonMenuVOList.add(sonMenuVO);
			}
			menuVO.setMenuVO(sonMenuVOList);
		}
		return menuList;
	}

}
