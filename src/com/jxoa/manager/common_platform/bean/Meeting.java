package com.jxoa.manager.common_platform.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Meeting entity. @author MyEclipse Persistence Tools
 */

public class Meeting implements java.io.Serializable {

	// Fields

	private String id;
	private Room room;
	private String MType;
	private String MName;
	private String MHost;
//	@DateTimeFormat(pattern="yyyy-MM-dd")
//	@DateTimeFormat(iso=ISO.DATE) 
	private Date MDate;
	private String MStatime;
	private String MEndtime;
	private String MSummary;
	private String MRemark;
	private String MPublished;
	private String MUid;
	private String deptid;
	private String dtid;//�޸�ʱ�õ����ɵĲ���ID
	private String userid;
	private String uid;//�޸�ʱ�õ����ɵ���ԱID
	private String rName;
//	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date MDate2;//������ѯʱʹ�� ��Χ����
	private String roomName;//������ѯʱʹ��  ����������
	// Constructors

	/** default constructor */
	public Meeting() {
	}

	/** full constructor */
	public Meeting(Room room,String MUid, String MType, String MName, String MHost,
			Date MDate, String MStatime, String MEndtime, String MSummary,
			String MRemark, String MPublished) {
		this.room = room;
		this.MUid=MUid;
		this.MType = MType;
		this.MName = MName;
		this.MHost = MHost;
		this.MDate = MDate;
		this.MStatime = MStatime;
		this.MEndtime = MEndtime;
		this.MSummary = MSummary;
		this.MRemark = MRemark;
		this.MPublished = MPublished;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	


	public String getMUid() {
		return MUid;
	}

	public void setMUid(String mUid) {
		MUid = mUid;
	}

	public String getMType() {
		return this.MType;
	}

	public void setMType(String MType) {
		this.MType = MType;
	}

	public String getMName() {
		return this.MName;
	}

	public void setMName(String MName) {
		this.MName = MName;
	}

	public String getMHost() {
		return this.MHost;
	}

	public void setMHost(String MHost) {
		this.MHost = MHost;
	}

	public Date getMDate() {
		return this.MDate;
	}

	public void setMDate(Date MDate) {
		
		 this.MDate = MDate;
	}



	public String getMStatime() {
		return MStatime;
	}

	public void setMStatime(String mStatime) {
		MStatime = mStatime;
	}

	public String getMEndtime() {
		return MEndtime;
	}

	public void setMEndtime(String mEndtime) {
		MEndtime = mEndtime;
	}

	public String getMSummary() {
		return this.MSummary;
	}

	public void setMSummary(String MSummary) {
		this.MSummary = MSummary;
	}

	public String getMRemark() {
		return this.MRemark;
	}

	public void setMRemark(String MRemark) {
		this.MRemark = MRemark;
	}

	public String getMPublished() {
		return this.MPublished;
	}

	public void setMPublished(String MPublished) {
		this.MPublished = MPublished;
	}

	public String getDeptid() {
		return deptid;
	}

	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getDtid() {
		return dtid;
	}

	public void setDtid(String dtid) {
		this.dtid = dtid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Date getMDate2() {
		return MDate2;
	}

	public void setMDate2(Date mDate2) {
		MDate2 = mDate2;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
}