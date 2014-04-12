package com.jxoa.manager.zck.bean;

/**
 * Syrygl entity. @author MyEclipse Persistence Tools
 */

public class Syrygl implements java.io.Serializable {

	// Fields

	private String syryglguid;
	private String rkjbguid;
	private String sysj;
	private String syqdw;
	private String syrybz;
	
	private String xm;
	private String jg;
	private String sfzh;
	private String xb;
	private String lxdh;

	private String bz;
	// Constructors

	private String rkjbguid2;
	private String xm2;
	public String getXm2() {
		return xm2;
	}

	public void setXm2(String xm2) {
		this.xm2 = xm2;
	}

	public String getRkjbguid2() {
		return rkjbguid2;
	}

	public void setRkjbguid2(String rkjbguid2) {
		this.rkjbguid2 = rkjbguid2;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getJg() {
		return jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getXb() {
		return xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	/** default constructor */
	public Syrygl() {
	}

	/** full constructor */
	public Syrygl(String rkjbguid, String sysj, String syqdw, String syrybz) {
		this.rkjbguid = rkjbguid;
		this.sysj = sysj;
		this.syqdw = syqdw;
		this.syrybz = syrybz;
	}

	// Property accessors

	public String getSyryglguid() {
		return this.syryglguid;
	}

	public void setSyryglguid(String syryglguid) {
		this.syryglguid = syryglguid;
	}

	public String getRkjbguid() {
		return this.rkjbguid;
	}

	public void setRkjbguid(String rkjbguid) {
		this.rkjbguid = rkjbguid;
	}

	public String getSysj() {
		return this.sysj;
	}

	public void setSysj(String sysj) {
		this.sysj = sysj;
	}

	public String getSyqdw() {
		return this.syqdw;
	}

	public void setSyqdw(String syqdw) {
		this.syqdw = syqdw;
	}

	public String getSyrybz() {
		return this.syrybz;
	}

	public void setSyrybz(String syrybz) {
		this.syrybz = syrybz;
	}

}