package com.jxoa.manager.personalOffice.bean;

/**
 * DetailMonth entity. @author MyEclipse Persistence Tools
 */

public class DetailMonth implements java.io.Serializable {

	// Fields

	private String id;
	private String dmStaff;
	private String dmDate;
	private Integer dmMinute;
	
	private String rank;

	// Constructors

	/** default constructor */
	public DetailMonth() {
	}

	/** full constructor */
	public DetailMonth(String dmStaff, String dmDate, Integer dmMinute) {
		this.dmStaff = dmStaff;
		this.dmDate = dmDate;
		this.dmMinute = dmMinute;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDmStaff() {
		return this.dmStaff;
	}

	public void setDmStaff(String dmStaff) {
		this.dmStaff = dmStaff;
	}

	public String getDmDate() {
		return this.dmDate;
	}

	public void setDmDate(String dmDate) {
		this.dmDate = dmDate;
	}

	public Integer getDmMinute() {
		return this.dmMinute;
	}

	public void setDmMinute(Integer dmMinute) {
		this.dmMinute = dmMinute;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

}