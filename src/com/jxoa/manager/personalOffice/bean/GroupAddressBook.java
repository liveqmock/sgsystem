package com.jxoa.manager.personalOffice.bean;

/**
 * Group entity. @author MyEclipse Persistence Tools
 */

public class GroupAddressBook implements java.io.Serializable {

	// Fields

	private String id;
	private String grNo;
	private String grName;
	private String grRemark;
	private String grUid;

	// Constructors

	/** default constructor */
	public GroupAddressBook() {
	}

	/** full constructor */
	public GroupAddressBook(String grName, String grNo,String grUid,String grRemark) {
		this.grName = grName;
		this.grRemark = grRemark;
		this.grNo=grNo;
		this.grUid=grUid;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGrName() {
		return this.grName;
	}



	public String getGrNo() {
		return grNo;
	}

	public void setGrNo(String grNo) {
		this.grNo = grNo;
	}

	public void setGrName(String grName) {
		this.grName = grName;
	}

	public String getGrRemark() {
		return this.grRemark;
	}

	public void setGrRemark(String grRemark) {
		this.grRemark = grRemark;
	}

	public String getGrUid() {
		return grUid;
	}

	public void setGrUid(String grUid) {
		this.grUid = grUid;
	}

}