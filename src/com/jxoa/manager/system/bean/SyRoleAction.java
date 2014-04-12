package com.jxoa.manager.system.bean;

/**
 * 角色--操作关联
 */

public class SyRoleAction implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * 角色id
	 */
	private String roleId;
	/**
	 * 操作id
	 */
	private String actionId;

	// Constructors

	/** default constructor */
	public SyRoleAction() {
	}

	/** full constructor */
	public SyRoleAction(String roleId, String actionId) {
		this.roleId = roleId;
		this.actionId = actionId;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getActionId() {
		return this.actionId;
	}

	public void setActionId(String actionId) {
		this.actionId = actionId;
	}

}