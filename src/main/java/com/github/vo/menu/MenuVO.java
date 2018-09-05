package com.github.vo.menu;

import java.util.List;

public class MenuVO {
	
	private String name;

    private String address;

    private String description;

    private List<MenuVO> menuVO;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<MenuVO> getMenuVO() {
		return menuVO;
	}

	public void setMenuVO(List<MenuVO> menuVO) {
		this.menuVO = menuVO;
	}

}
