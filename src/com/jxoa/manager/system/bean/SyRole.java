package com.jxoa.manager.system.bean;

import javax.validation.constraints.Pattern;




/**
 * 角色表对应实体
 * 
 * 
 */

public class SyRole implements java.io.Serializable{

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	// Fields

	private String id;
	/**
	 * 角色名称
	 */
	@Pattern(regexp="^([\u2E80-\u9FFF]|\\w){1,20}$",message="角色名称只能由汉字、数字、字母或者下划线组成，长度在1-20之间。")
	private String roleName;
	/**
	 * 角色说明
	 */
	private String roleDesc;
	

	// Constructors

	/** default constructor */
	public SyRole() {
	}

	/** minimal constructor */
	public SyRole(String roleName) {
		this.roleName = roleName;
	}
	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return this.roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

 
	

}