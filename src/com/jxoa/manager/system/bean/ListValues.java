package com.jxoa.manager.system.bean;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;


/**
 * 数据类型字典表对应实体
 *
 */
public class ListValues implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;

	private String id;
	/**
	 * 字典值类型
	 */
	@NotNull(message="类型不能为空")
	private Integer listType;
	/**
	 * 字典值
	 */
	@Pattern(regexp="^([\u2E80-\u9FFF]|\\w){1,50}$",message="字典值只能由汉字、数字、字母或者下划线组成，长度在1-50之间。")
	private String listValue;
	/**
	 * 备注
	 */
	@Length(min=0, max=50, message="备注长度不能大于50。")
	private String listDesc;

	// Constructors

	/** default constructor */
	public ListValues() {
	}

	/** minimal constructor */
	public ListValues(Integer listType, String listValue) {
		this.listType = listType;
		this.listValue = listValue;
	}

	/** full constructor */
	public ListValues(Integer listType, String listValue, String listDesc) {
		this.listType = listType;
		this.listValue = listValue;
		this.listDesc = listDesc;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getListType() {
		return this.listType;
	}

	public void setListType(Integer listType) {
		this.listType = listType;
	}

	public String getListValue() {
		return this.listValue;
	}

	public void setListValue(String listValue) {
		this.listValue = listValue;
	}

	public String getListDesc() {
		return this.listDesc;
	}

	public void setListDesc(String listDesc) {
		this.listDesc = listDesc;
	}

}