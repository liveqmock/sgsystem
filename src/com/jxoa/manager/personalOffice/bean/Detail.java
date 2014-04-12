package com.jxoa.manager.personalOffice.bean;

import java.sql.Timestamp;

/**
 * Detail entity. @author MyEclipse Persistence Tools
 */

public class Detail implements java.io.Serializable {

	// Fields

	private String id;
	private String deSort;
	private String deStaff;
	private String deGroup;
	private String deName;
	private Integer deMinute;
	private Integer deStatus;
	private String deRemark;
	private Timestamp deDate;
	private Timestamp deChdate;
	private String deUid;
	private String deCheck;
	private String deChRemark;
	private Integer deMinute2;
	private String minute;

	// Constructors

	/** default constructor */
	public Detail() {
	}

	/** full constructor */
	public Detail(String deSort, String deStaff, String deGroup, String deName,
			Integer deMinute, Integer deStatus,String deRemark, Timestamp deDate,Timestamp deChdate, String deUid, String deCheck,String deChRemark) {
		this.deSort = deSort;
		this.deStaff = deStaff;
		this.deGroup = deGroup;
		this.deName = deName;
		this.deMinute = deMinute;
		this.deStatus=deStatus;
		this.deRemark = deRemark;
		this.deDate = deDate;
		this.deChdate=deChdate;
		this.deUid = deUid;
		this.deCheck=deCheck;
		this.deChRemark=deChRemark;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDeSort() {
		return this.deSort;
	}

	public void setDeSort(String deSort) {
		this.deSort = deSort;
	}

	public String getDeStaff() {
		return this.deStaff;
	}

	public void setDeStaff(String deStaff) {
		this.deStaff = deStaff;
	}

	public String getDeGroup() {
		return this.deGroup;
	}

	public void setDeGroup(String deGroup) {
		this.deGroup = deGroup;
	}

	public String getDeName() {
		return this.deName;
	}

	public void setDeName(String deName) {
		this.deName = deName;
	}

	public Integer getDeMinute() {
		return this.deMinute;
	}

	public void setDeMinute(Integer deMinute) {
		this.deMinute = deMinute;
	}

	public Integer getDeStatus() {
		return deStatus;
	}

	public void setDeStatus(Integer deStatus) {
		this.deStatus = deStatus;
	}

	public String getDeRemark() {
		return this.deRemark;
	}

	public void setDeRemark(String deRemark) {
		this.deRemark = deRemark;
	}

	public Timestamp getDeDate() {
		return this.deDate;
	}

	public Timestamp getDeChdate() {
		return deChdate;
	}

	public void setDeChdate(Timestamp deChdate) {
		this.deChdate = deChdate;
	}

	public void setDeDate(Timestamp deDate) {
		this.deDate = deDate;
	}

	public String getDeUid() {
		return this.deUid;
	}

	public void setDeUid(String deUid) {
		this.deUid = deUid;
	}

	public String getDeCheck() {
		return deCheck;
	}

	public void setDeCheck(String deCheck) {
		this.deCheck = deCheck;
	}

	public Integer getDeMinute2() {
		return deMinute2;
	}

	public void setDeMinute2(Integer deMinute2) {
		this.deMinute2 = deMinute2;
	}

	public String getMinute() {
		return minute;
	}

	public void setMinute(String minute) {
		this.minute = minute;
	}

	public String getDeChRemark() {
		return deChRemark;
	}

	public void setDeChRemark(String deChRemark) {
		this.deChRemark = deChRemark;
	}

}