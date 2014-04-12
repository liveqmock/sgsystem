package com.jxoa.manager.fj.bean;

/**
 * Dwzp entity. @author MyEclipse Persistence Tools
 */

public class Dwzp implements java.io.Serializable {

	// Fields

	private String dwzpguid;
	private String dwmc;
	private String dwdz;
	private String xqgw;
	private String xqrs;
	private String xzdy;
	private String xbyq;
	private String lxr;
	private String lxrdh;

	// Constructors

	/** default constructor */
	public Dwzp() {
	}

	/** full constructor */
	public Dwzp(String dwmc, String dwdz, String xqgw, String xqrs,
			String xzdy, String xbyq, String lxr, String lxrdh) {
		this.dwmc = dwmc;
		this.dwdz = dwdz;
		this.xqgw = xqgw;
		this.xqrs = xqrs;
		this.xzdy = xzdy;
		this.xbyq = xbyq;
		this.lxr = lxr;
		this.lxrdh = lxrdh;
	}

	// Property accessors

	public String getDwzpguid() {
		return this.dwzpguid;
	}

	public void setDwzpguid(String dwzpguid) {
		this.dwzpguid = dwzpguid;
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

	public String getXqgw() {
		return this.xqgw;
	}

	public void setXqgw(String xqgw) {
		this.xqgw = xqgw;
	}

	public String getXqrs() {
		return this.xqrs;
	}

	public void setXqrs(String xqrs) {
		this.xqrs = xqrs;
	}

	public String getXzdy() {
		return this.xzdy;
	}

	public void setXzdy(String xzdy) {
		this.xzdy = xzdy;
	}

	public String getXbyq() {
		return this.xbyq;
	}

	public void setXbyq(String xbyq) {
		this.xbyq = xbyq;
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

}