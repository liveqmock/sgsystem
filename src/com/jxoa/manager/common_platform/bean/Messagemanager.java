package com.jxoa.manager.common_platform.bean;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Messagemanager entity. @author MyEclipse Persistence Tools
 */

public class Messagemanager implements java.io.Serializable {

	// Fields

	private String id;
	private String typeid;
	private String mestitle;
	private String mesplot;
	private Integer status;
	private String promulgator;
	private Timestamp createdtime;
	private Timestamp modifiedate;
	private String replycontent;
	private Timestamp replydatetime;
	private String fwmyd;
	private String replypep;

	private Date endDate;
	private Date startDate;
	// Constructors

	

	/** default constructor */
	public Messagemanager() {
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	/** minimal constructor */
	public Messagemanager(String typeid, String mestitle,
			Timestamp createdtime, Timestamp modifiedate) {
		this.typeid = typeid;
		this.mestitle = mestitle;
		this.createdtime = createdtime;
		this.modifiedate = modifiedate;
	}

	/** full constructor */
	public Messagemanager(String typeid, String mestitle, String mesplot,
			Integer status, String promulgator, Timestamp createdtime,
			Timestamp modifiedate, String replycontent,
			Timestamp replydatetime, String fwmyd, String replypep) {
		this.typeid = typeid;
		this.mestitle = mestitle;
		this.mesplot = mesplot;
		this.status = status;
		this.promulgator = promulgator;
		this.createdtime = createdtime;
		this.modifiedate = modifiedate;
		this.replycontent = replycontent;
		this.replydatetime = replydatetime;
		this.fwmyd = fwmyd;
		this.replypep = replypep;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTypeid() {
		return this.typeid;
	}

	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}

	public String getMestitle() {
		return this.mestitle;
	}

	public void setMestitle(String mestitle) {
		this.mestitle = mestitle;
	}

	public String getMesplot() {
		return this.mesplot;
	}

	public void setMesplot(String mesplot) {
		this.mesplot = mesplot;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPromulgator() {
		return this.promulgator;
	}

	public void setPromulgator(String promulgator) {
		this.promulgator = promulgator;
	}

	public Timestamp getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Timestamp createdtime) {
		this.createdtime = createdtime;
	}

	public Timestamp getModifiedate() {
		return this.modifiedate;
	}

	public void setModifiedate(Timestamp modifiedate) {
		this.modifiedate = modifiedate;
	}

	public String getReplycontent() {
		return this.replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	public Timestamp getReplydatetime() {
		return this.replydatetime;
	}

	public void setReplydatetime(Timestamp replydatetime) {
		this.replydatetime = replydatetime;
	}

	public String getFwmyd() {
		return this.fwmyd;
	}

	public void setFwmyd(String fwmyd) {
		this.fwmyd = fwmyd;
	}

	public String getReplypep() {
		return this.replypep;
	}

	public void setReplypep(String replypep) {
		this.replypep = replypep;
	}

}