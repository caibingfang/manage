package com.github.vo.user;

import com.github.enums.Gender;
import com.github.vo.PageQueryVO;

public class UserQueryVO extends PageQueryVO {

	private String username;
	private String realName;
	private Gender gender;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

}
