package com.jxoa.manager.personalOffice.bean;

/**
 * RankYear entity. @author MyEclipse Persistence Tools
 */

public class RankYear implements java.io.Serializable {

	// Fields

	private String id;
	private String rank;
	private String deptId;
	private String name;
	private Integer minute;
	private String date;
	private Integer minute2;

	// Constructors

	/** default constructor */
	public RankYear() {
	}

	/** full constructor */
	public RankYear(String deptId, String name, Integer minute, String date) {
		this.deptId = deptId;
		this.name = name;
		this.minute = minute;
		this.date = date;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDeptId() {
		return this.deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}





	public Integer getMinute() {
		return minute;
	}

	public void setMinute(Integer minute) {
		this.minute = minute;
	}

	public Integer getMinute2() {
		return minute2;
	}

	public void setMinute2(Integer minute2) {
		this.minute2 = minute2;
	}

	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}



}