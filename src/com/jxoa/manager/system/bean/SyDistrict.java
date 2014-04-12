package com.jxoa.manager.system.bean;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Range;

/**
 * 地区表对应实体
 */

public class SyDistrict implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * 上级id
	 */
	private String superId;
	/**
	 * 排序号
	 */
	@NotNull(message="序号不能为空")
	@Range(min=1,max=9999,message="顺序号必须为1-9999的整数")
	private Short disSort;
	/**
	 * 地区名称
	 */
	@Pattern(regexp="^([\u2E80-\u9FFF]|\\w){1,50}$",message="名称只能由汉字、数字、字母或者下划线组成，长度在1-50之间。")
	private String disName;
	/**
	 * 地区说明
	 */
	private String disDesc;

	// Constructors

	/** default constructor */
	public SyDistrict() {
	}

	/** minimal constructor */
	public SyDistrict(Short disSort, String disName) {
		this.disSort = disSort;
		this.disName = disName;
	}

	/** full constructor */
	public SyDistrict(String superId, Short disSort, String disName,
			String disDesc) {
		this.superId = superId;
		this.disSort = disSort;
		this.disName = disName;
		
		this.disDesc = disDesc;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSuperId() {
		return this.superId;
	}

	public void setSuperId(String superId) {
		this.superId = superId;
	}

	public Short getDisSort() {
		return this.disSort;
	}

	public void setDisSort(Short disSort) {
		this.disSort = disSort;
	}

	public String getDisName() {
		return this.disName;
	}

	public void setDisName(String disName) {
		this.disName = disName;
	}

	public String getDisDesc() {
		return this.disDesc;
	}

	public void setDisDesc(String disDesc) {
		this.disDesc = disDesc;
	}

}