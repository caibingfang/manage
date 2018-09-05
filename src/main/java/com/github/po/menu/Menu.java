package com.github.po.menu;

import com.github.po.BaseEntity;

public class Menu extends BaseEntity {
    
    private String name;

    /**
     *
     */
    private String address;

    /**
     *
     */
    private String description;

    /**
     *
     */
    private Long parentId;

   
    private Integer sort;

    

    /**
     *
     */
    public String getName() {
        return name;
    }

    /**
     *
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     */
    public String getAddress() {
        return address;
    }

    /**
     *
     */
    public void setAddress(String address) {
        this.address = address;
    }


    public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	/**
     *
     */
    public Long getParentId() {
        return parentId;
    }

    /**
     *
     */
    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }


    /**
     *
     */
    public Integer getSort() {
        return sort;
    }

    /**
     *
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }
}