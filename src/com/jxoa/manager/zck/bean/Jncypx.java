package com.jxoa.manager.zck.bean;

/**
 * Jncypx entity. @author MyEclipse Persistence Tools
 */

public class Jncypx implements java.io.Serializable {

	// Fields

	private String jncypxguid;
	private String rkjbguid;
	private String pxcs;
	private String pxsj;
	private String pxlx;
	private String xmnr;
	private String xm;
	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	private String xb;
	private String bz;
	private String lxdh;
	private String xm2;
	private String rkjbguid2;

	// Constructors

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

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
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
	public Jncypx() {
	}

	/** full constructor */
	public Jncypx(String rkjbguid, String pxcs, String pxsj, String pxlx,
			String xmnr) {
		this.rkjbguid = rkjbguid;
		this.pxcs = pxcs;
		this.pxsj = pxsj;
		this.pxlx = pxlx;
		this.xmnr = xmnr;
	}

	// Property accessors

	public String getJncypxguid() {
		return this.jncypxguid;
	}

	public void setJncypxguid(String jncypxguid) {
		this.jncypxguid = jncypxguid;
	}

	public String getRkjbguid() {
		return this.rkjbguid;
	}

	public void setRkjbguid(String rkjbguid) {
		this.rkjbguid = rkjbguid;
	}

	public String getPxcs() {
		return this.pxcs;
	}

	public void setPxcs(String pxcs) {
		this.pxcs = pxcs;
	}

	public String getPxsj() {
		return this.pxsj;
	}

	public void setPxsj(String pxsj) {
		this.pxsj = pxsj;
	}

	public String getPxlx() {
		return this.pxlx;
	}

	public void setPxlx(String pxlx) {
		this.pxlx = pxlx;
	}

	public String getXmnr() {
		return this.xmnr;
	}

	public void setXmnr(String xmnr) {
		this.xmnr = xmnr;
	}

}