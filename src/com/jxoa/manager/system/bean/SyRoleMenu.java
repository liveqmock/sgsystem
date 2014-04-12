package com.jxoa.manager.system.bean;

/**
 * 角色--菜单关联
 */

public class SyRoleMenu implements java.io.Serializable {

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
	 * 菜单id
	 */
	private String menuId;

	// Constructors

	/** default constructor */
	public SyRoleMenu() {
	}

	/** full constructor */
	public SyRoleMenu(String roleId, String menuId) {
		this.roleId = roleId;
		this.menuId = menuId;
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

	public String getMenuId() {
		return this.menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

}