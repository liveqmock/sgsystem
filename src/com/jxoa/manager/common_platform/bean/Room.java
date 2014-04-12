package com.jxoa.manager.common_platform.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Room entity. @author MyEclipse Persistence Tools
 */

public class Room implements java.io.Serializable {

	// Fields

	private String id;
	private String mrNo;
	private String mrName;
	private String mrNum;
	private String mrRemark;
	private Set mtMeetings = new HashSet(0);

	// Constructors

	/** default constructor */
	public Room() {
	}

	/** full constructor */
	public Room(String mrNo, String mrName, String mrNum, String mrRemark,
			Set mtMeetings) {
		this.mrNo = mrNo;
		this.mrName = mrName;
		this.mrNum = mrNum;
		this.mrRemark = mrRemark;
		this.mtMeetings = mtMeetings;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMrNo() {
		return this.mrNo;
	}

	public void setMrNo(String mrNo) {
		this.mrNo = mrNo;
	}

	public String getMrName() {
		return this.mrName;
	}

	public void setMrName(String mrName) {
		this.mrName = mrName;
	}

	public String getMrNum() {
		return this.mrNum;
	}

	public void setMrNum(String mrNum) {
		this.mrNum = mrNum;
	}

	public String getMrRemark() {
		return this.mrRemark;
	}

	public void setMrRemark(String mrRemark) {
		this.mrRemark = mrRemark;
	}

	public Set getMtMeetings() {
		return this.mtMeetings;
	}

	public void setMtMeetings(Set mtMeetings) {
		this.mtMeetings = mtMeetings;
	}

}