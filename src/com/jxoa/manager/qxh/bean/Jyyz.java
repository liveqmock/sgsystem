package com.jxoa.manager.qxh.bean;

/**
 * Jyyz entity. @author MyEclipse Persistence Tools
 */

public class Jyyz implements java.io.Serializable {

	// Fields

	private String jyyzguid;
	private String rkjbguid;
	private String sbbt;
	private String jyyzbz;

	// Constructors

	/** default constructor */
	public Jyyz() {
	}

	/** full constructor */
	public Jyyz(String rkjbguid, String sbbt, String jyyzbz) {
		this.rkjbguid = rkjbguid;
		this.sbbt = sbbt;
		this.jyyzbz = jyyzbz;
	}

	// Property accessors

	public String getJyyzguid() {
		return this.jyyzguid;
	}

	public void setJyyzguid(String jyyzguid) {
		this.jyyzguid = jyyzguid;
	}

	public String getRkjbguid() {
		return this.rkjbguid;
	}

	public void setRkjbguid(String rkjbguid) {
		this.rkjbguid = rkjbguid;
	}

	public String getSbbt() {
		return this.sbbt;
	}

	public void setSbbt(String sbbt) {
		this.sbbt = sbbt;
	}

	public String getJyyzbz() {
		return this.jyyzbz;
	}

	public void setJyyzbz(String jyyzbz) {
		this.jyyzbz = jyyzbz;
	}

}