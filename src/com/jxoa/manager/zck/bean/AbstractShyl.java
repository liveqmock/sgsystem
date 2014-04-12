package com.jxoa.manager.zck.bean;

/**
 * AbstractShyl entity provides the base persistence definition of the Shyl
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractShyl implements java.io.Serializable {

	// Fields

	private String shylguid;
	private String rkjbguid;
	private String stzk;
	private String hllx;
	private String sfdb;
	private String sfpk;
	private String sfkc;
	private String jgyl;
	private String rtyl;
	private String smfw;
	private String lnfz;
	private String yjt;
	private String shylbz;
	private String xm;
	private String rkjbguid1;
	private String xm1;
	private String rkjbguid2;
	private String xm2;
	// Constructors

	/** default constructor */
	public AbstractShyl() {
	}

	/** full constructor */
	public AbstractShyl(String rkjbguid, String stzk, String hllx, String sfdb,
			String sfpk, String sfkc, String jgyl, String rtyl, String smfw,
			String lnfz, String yjt, String shylbz,String rkjbguid2) {
		this.rkjbguid = rkjbguid;
		this.stzk = stzk;
		this.hllx = hllx;
		this.sfdb = sfdb;
		this.sfpk = sfpk;
		this.sfkc = sfkc;
		this.jgyl = jgyl;
		this.rtyl = rtyl;
		this.smfw = smfw;
		this.lnfz = lnfz;
		this.yjt = yjt;
		this.shylbz = shylbz;
		this.rkjbguid2 =rkjbguid2;
	}

	// Property accessors

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getShylguid() {
		return this.shylguid;
	}

	public void setShylguid(String shylguid) {
		this.shylguid = shylguid;
	}

	public String getRkjbguid() {
		return this.rkjbguid;
	}

	public void setRkjbguid(String rkjbguid) {
		this.rkjbguid = rkjbguid;
	}

	public String getStzk() {
		return this.stzk;
	}

	public void setStzk(String stzk) {
		this.stzk = stzk;
	}

	public String getHllx() {
		return this.hllx;
	}

	public void setHllx(String hllx) {
		this.hllx = hllx;
	}

	public String getSfdb() {
		return this.sfdb;
	}

	public void setSfdb(String sfdb) {
		this.sfdb = sfdb;
	}

	public String getSfpk() {
		return this.sfpk;
	}

	public void setSfpk(String sfpk) {
		this.sfpk = sfpk;
	}

	public String getSfkc() {
		return this.sfkc;
	}

	public void setSfkc(String sfkc) {
		this.sfkc = sfkc;
	}

	public String getJgyl() {
		return this.jgyl;
	}

	public void setJgyl(String jgyl) {
		this.jgyl = jgyl;
	}

	public String getRtyl() {
		return this.rtyl;
	}

	public void setRtyl(String rtyl) {
		this.rtyl = rtyl;
	}

	public String getSmfw() {
		return this.smfw;
	}

	public void setSmfw(String smfw) {
		this.smfw = smfw;
	}

	public String getLnfz() {
		return this.lnfz;
	}

	public void setLnfz(String lnfz) {
		this.lnfz = lnfz;
	}

	public String getYjt() {
		return this.yjt;
	}

	public void setYjt(String yjt) {
		this.yjt = yjt;
	}

	public String getShylbz() {
		return this.shylbz;
	}

	public void setShylbz(String shylbz) {
		this.shylbz = shylbz;
	}

	public String getRkjbguid1() {
		return rkjbguid1;
	}

	public void setRkjbguid1(String rkjbguid1) {
		this.rkjbguid1 = rkjbguid1;
	}

	public String getXm1() {
		return xm1;
	}

	public void setXm1(String xm1) {
		this.xm1 = xm1;
	}

	public String getRkjbguid2() {
		return rkjbguid2;
	}

	public void setRkjbguid2(String rkjbguid2) {
		this.rkjbguid2 = rkjbguid2;
	}

	public String getXm2() {
		return xm2;
	}

	public void setXm2(String xm2) {
		this.xm2 = xm2;
	}

}