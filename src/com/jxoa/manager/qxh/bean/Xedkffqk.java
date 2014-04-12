package com.jxoa.manager.qxh.bean;

/**
 * Xedkffqk entity. @author MyEclipse Persistence Tools
 */

public class Xedkffqk implements java.io.Serializable {

	// Fields

	private String xedkffqkguid;
	private String rkjbguid;
	private String ffsj;
	private String dkje;
	private String hksj;
	private String xyd;
	private String jyxm;

	// Constructors

	/** default constructor */
	public Xedkffqk() {
	}

	/** full constructor */
	public Xedkffqk(String rkjbguid, String ffsj, String dkje, String hksj,
			String xyd, String jyxm) {
		this.rkjbguid = rkjbguid;
		this.ffsj = ffsj;
		this.dkje = dkje;
		this.hksj = hksj;
		this.xyd = xyd;
		this.jyxm = jyxm;
	}

	// Property accessors

	public String getXedkffqkguid() {
		return this.xedkffqkguid;
	}

	public void setXedkffqkguid(String xedkffqkguid) {
		this.xedkffqkguid = xedkffqkguid;
	}

	public String getRkjbguid() {
		return this.rkjbguid;
	}

	public void setRkjbguid(String rkjbguid) {
		this.rkjbguid = rkjbguid;
	}

	public String getFfsj() {
		return this.ffsj;
	}

	public void setFfsj(String ffsj) {
		this.ffsj = ffsj;
	}

	public String getDkje() {
		return this.dkje;
	}

	public void setDkje(String dkje) {
		this.dkje = dkje;
	}

	public String getHksj() {
		return this.hksj;
	}

	public void setHksj(String hksj) {
		this.hksj = hksj;
	}

	public String getXyd() {
		return this.xyd;
	}

	public void setXyd(String xyd) {
		this.xyd = xyd;
	}

	public String getJyxm() {
		return this.jyxm;
	}

	public void setJyxm(String jyxm) {
		this.jyxm = jyxm;
	}

}