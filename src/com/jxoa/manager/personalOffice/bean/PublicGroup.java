package com.jxoa.manager.personalOffice.bean;

/**
 * PublicGroup entity. @author MyEclipse Persistence Tools
 */

public class PublicGroup implements java.io.Serializable {

	// Fields

	private String id;
	private String gaName;
	private String gaRemark;

	// Constructors

	/** default constructor */
	public PublicGroup() {
	}

	/** full constructor */
	public PublicGroup(String gaName, String gaRemark) {
		this.gaName = gaName;
		this.gaRemark = gaRemark;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGaName() {
		return this.gaName;
	}

	public void setGaName(String gaName) {
		this.gaName = gaName;
	}

	public String getGaRemark() {
		return this.gaRemark;
	}

	public void setGaRemark(String gaRemark) {
		this.gaRemark = gaRemark;
	}

}