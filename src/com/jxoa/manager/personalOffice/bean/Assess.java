package com.jxoa.manager.personalOffice.bean;

/**
 * Assess entity. @author MyEclipse Persistence Tools
 */

public class Assess implements java.io.Serializable {

	// Fields

	private String id;
	private String asName;
	private Integer asMinute;
	private Integer asStatus;
	private Integer asGroup;
	private String asRemark;

	// Constructors

	/** default constructor */
	public Assess() {
	}

	/** full constructor */
	public Assess(String asName, Integer asMinute, Integer asStatus,
			Integer asGroup, String asRemark) {
		this.asName = asName;
		this.asMinute = asMinute;
		this.asStatus = asStatus;
		this.asGroup = asGroup;
		this.asRemark = asRemark;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAsName() {
		return this.asName;
	}

	public void setAsName(String asName) {
		this.asName = asName;
	}

	public Integer getAsMinute() {
		return this.asMinute;
	}

	public void setAsMinute(Integer asMinute) {
		this.asMinute = asMinute;
	}

	public Integer getAsStatus() {
		return this.asStatus;
	}

	public void setAsStatus(Integer asStatus) {
		this.asStatus = asStatus;
	}

	public Integer getAsGroup() {
		return this.asGroup;
	}

	public void setAsGroup(Integer asGroup) {
		this.asGroup = asGroup;
	}

	public String getAsRemark() {
		return this.asRemark;
	}

	public void setAsRemark(String asRemark) {
		this.asRemark = asRemark;
	}

}