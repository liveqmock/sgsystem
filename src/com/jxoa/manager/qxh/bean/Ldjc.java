package com.jxoa.manager.qxh.bean;

/**
 * Ldjc entity. @author MyEclipse Persistence Tools
 */

public class Ldjc implements java.io.Serializable {

	// Fields

	private String ldjcguid;
	private String dwmc;
	private String dwdz;
	private String lxr;
	private String lxrdh;
	private String jcr;
	private String sssq;
	private String sfhg;
	private String ldjcbz;

	// Constructors

	/** default constructor */
	public Ldjc() {
	}

	/** full constructor */
	public Ldjc(String dwmc, String dwdz, String lxr, String lxrdh, String jcr,
			String sssq, String sfhg, String ldjcbz) {
		this.dwmc = dwmc;
		this.dwdz = dwdz;
		this.lxr = lxr;
		this.lxrdh = lxrdh;
		this.jcr = jcr;
		this.sssq = sssq;
		this.sfhg = sfhg;
		this.ldjcbz = ldjcbz;
	}

	// Property accessors

	public String getLdjcguid() {
		return this.ldjcguid;
	}

	public void setLdjcguid(String ldjcguid) {
		this.ldjcguid = ldjcguid;
	}

	public String getDwmc() {
		return this.dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getDwdz() {
		return this.dwdz;
	}

	public void setDwdz(String dwdz) {
		this.dwdz = dwdz;
	}

	public String getLxr() {
		return this.lxr;
	}

	public void setLxr(String lxr) {
		this.lxr = lxr;
	}

	public String getLxrdh() {
		return this.lxrdh;
	}

	public void setLxrdh(String lxrdh) {
		this.lxrdh = lxrdh;
	}

	public String getJcr() {
		return this.jcr;
	}

	public void setJcr(String jcr) {
		this.jcr = jcr;
	}

	public String getSssq() {
		return this.sssq;
	}

	public void setSssq(String sssq) {
		this.sssq = sssq;
	}

	public String getSfhg() {
		return this.sfhg;
	}

	public void setSfhg(String sfhg) {
		this.sfhg = sfhg;
	}

	public String getLdjcbz() {
		return this.ldjcbz;
	}

	public void setLdjcbz(String ldjcbz) {
		this.ldjcbz = ldjcbz;
	}

}