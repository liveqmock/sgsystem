package com.jxoa.manager.wwb.bean;

import java.io.Serializable;

public class Type implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private  int id;//问题类型ID
	private String name ;//问题类型名称
	
	public Type(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
	

}
