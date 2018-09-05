package com.github.service;

public interface BaseService<T> {

	public void insert(T t);
	
	public T selectByPrimaryKey(Long id);
	
	public void updateByPrimaryKey(T t);
	
	public void deleteByPrimaryKey(Long id);
}
