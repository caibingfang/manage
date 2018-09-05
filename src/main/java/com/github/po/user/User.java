package com.github.po.user;

import com.github.enums.Gender;
import com.github.po.BaseEntity;

public class User extends BaseEntity {

	private String username;
	private String password;
	private String realName;
	private Gender gender;


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
