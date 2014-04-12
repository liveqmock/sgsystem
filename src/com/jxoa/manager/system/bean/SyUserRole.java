package com.jxoa.manager.system.bean;

/**
 * 用户--角色关联表对应实体
 */

public class SyUserRole implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * 用户id
	 */
	private String userId;
	/**
	 * 角色id
	 */
	private String roleId;

	// Constructors

	/** default constructor */
	public SyUserRole() {
	}

	/** full constructor */
	public SyUserRole(String userId, String roleId) {
		this.userId = userId;
		this.roleId = roleId;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

}