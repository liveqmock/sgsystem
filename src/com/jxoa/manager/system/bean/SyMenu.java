package com.jxoa.manager.system.bean;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

/**
 * 菜单表对应实体
 */

public class SyMenu implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * 上级菜单id
	 */
	@Pattern(regexp="^[A-Za-z0-9]{32}$",message="上级菜单格式错误")
	private String menuSuperId;
	/**
	 * 菜单状态 是否可用，1:可用，0：不可用
	 */
	@NotNull(message="状态不能为空")
	@Range(min=0,max=1,message="状态格式错误")
	private Short menuStatus;
	/**
	 * 排序号
	 */
	@NotNull(message="菜单序号不能为空")
	@Range(min=1,max=999,message="菜单序号必须为1-999的整数")
	private Short menuSort;
	/**
	 * 菜单名称
	 */
	@Pattern(regexp="^([\u2E80-\u9FFF]|\\w){1,20}$",message="菜单名称只能由汉字、数字、字母或者下划线组成，长度在1-20之间。")
	private String menuName;
	/**
	 * 菜单图片url
	 */
	@Length(min=0, max=100, message="菜单图片URL长度不能大于100。")
	private String menuIcon;
	/**
	 * 菜单url
	 */
	@Length(min=0, max=255, message="url长度不能大于255.")
	private String menuUrl;
	/**
	 * 页面打开区域，dwz参数：navTab(在标签中),dialog(弹出窗口);_blank(在浏览器新窗口)
	 */
	@Length(min=0, max=10, message="target长度不能大于10")
	private String menuTarget;
	/**
	 * dwz参数,rel为打开页面所在标签或弹出窗口的id，如果重复，将在同一标签打开
	 */
	@Length(min=0, max=20, message="rel长度不能大于20")
	private String menuRel;
	/**
	 * 默认是否打开，true或false
	 */
	@Pattern(regexp="^true|false$",message="是否打开格式错误")
	private String menuOpen;
	/**
	 * dwz参数,为external="true"或者href是外网连接时，以iframe方式打开navTab页面
	 */
	@Pattern(regexp="^true|false$",message="external格式错误")
	private String menuExternal;
	/**
	 * dwz参数,表示重复打开navTab时是否重新加载数据
	 */
	@Pattern(regexp="^true|false$",message="fresh格式错误")
	private String menuFresh;

	// Constructors

	/** default constructor */
	public SyMenu() {
	}

	/** full constructor */
	public SyMenu(String menuSuperId, Short menuStatus, Short menuSort,
			String menuName, String menuIcon, String menuUrl,
			String menuTarget, String menuRel, String menuOpen,
			String menuExternal, String menuFresh) {
		this.menuSuperId = menuSuperId;
		this.menuStatus = menuStatus;
		this.menuSort = menuSort;
		this.menuName = menuName;
		this.menuIcon = menuIcon;
		this.menuUrl = menuUrl;
		this.menuTarget = menuTarget;
		this.menuRel = menuRel;
		this.menuOpen = menuOpen;
		this.menuExternal = menuExternal;
		this.menuFresh = menuFresh;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMenuSuperId() {
		return this.menuSuperId;
	}

	public void setMenuSuperId(String menuSuperId) {
		this.menuSuperId = menuSuperId;
	}

	public Short getMenuStatus() {
		return this.menuStatus;
	}

	public void setMenuStatus(Short menuStatus) {
		this.menuStatus = menuStatus;
	}

	public Short getMenuSort() {
		return this.menuSort;
	}

	public void setMenuSort(Short menuSort) {
		this.menuSort = menuSort;
	}

	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuIcon() {
		return this.menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getMenuUrl() {
		return this.menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getMenuTarget() {
		return this.menuTarget;
	}

	public void setMenuTarget(String menuTarget) {
		this.menuTarget = menuTarget;
	}

	public String getMenuRel() {
		return this.menuRel;
	}

	public void setMenuRel(String menuRel) {
		this.menuRel = menuRel;
	}

	public String getMenuOpen() {
		return this.menuOpen;
	}

	public void setMenuOpen(String menuOpen) {
		this.menuOpen = menuOpen;
	}

	public String getMenuExternal() {
		return this.menuExternal;
	}

	public void setMenuExternal(String menuExternal) {
		this.menuExternal = menuExternal;
	}

	public String getMenuFresh() {
		return this.menuFresh;
	}

	public void setMenuFresh(String menuFresh) {
		this.menuFresh = menuFresh;
	}

}