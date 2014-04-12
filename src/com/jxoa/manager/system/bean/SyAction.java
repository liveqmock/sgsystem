package com.jxoa.manager.system.bean;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

/**
 * 操作表对应实体
 */
public class SyAction implements java.io.Serializable {

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	// Fields
	
	private String id;
	/**
	 * 关联菜单id
	 */
	@Pattern(regexp="^[0]|[A-Za-z0-9]{32}$",message="菜单ID格式错误")
	private String menuId;
	/**
	 * 排序号
	 */
	@NotNull(message="操作序号不能为空")
	@Range(min=1,max=999,message="操作序号必须为1-999的整数")
	private Short actionSort;
	/**
	 * 操作名称
	 */
	@Pattern(regexp="^([\u2E80-\u9FFF]|\\w){1,50}$",message="操作名称只能由汉字、数字、字母或者下划线组成，长度在1-20之间。")
	private String actionName;
	/**
	 * 操作url，多个用，连接
	 */
	@Length(min=0, max=500, message="url长度不能大于500.")
	private String actionUrl;

	// Constructors

	/** default constructor */
	public SyAction() {
	}

	/** minimal constructor */
	public SyAction(String menuId, Short actionSort, String actionName) {
		this.menuId = menuId;
		this.actionSort = actionSort;
		this.actionName = actionName;
	}

	/** full constructor */
	public SyAction(String menuId, Short actionSort, String actionName,
			String actionUrl) {
		this.menuId = menuId;
		this.actionSort = actionSort;
		this.actionName = actionName;
		this.actionUrl = actionUrl;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMenuId() {
		return this.menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public Short getActionSort() {
		return this.actionSort;
	}

	public void setActionSort(Short actionSort) {
		this.actionSort = actionSort;
	}

	public String getActionName() {
		return this.actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getActionUrl() {
		return this.actionUrl;
	}

	public void setActionUrl(String actionUrl) {
		this.actionUrl = actionUrl;
	}

}