package com.jxoa.manager.qxh.bean;

/**
 * Txry entity. @author MyEclipse Persistence Tools
 */

public class Txry implements java.io.Serializable {

	// Fields

	private String txryguid;
	private String rkjbguid;
	private String txsj;
	private String txqdw;
	private String dwdh;
	private String jtdh;
	private String qsr;
	private String txrybz;

	// Constructors

	/** default constructor */
	public Txry() {
	}

	/** full constructor */
	public Txry(String rkjbguid, String txsj, String txqdw, String dwdh,
			String jtdh, String qsr, String txrybz) {
		this.rkjbguid = rkjbguid;
		this.txsj = txsj;
		this.txqdw = txqdw;
		this.dwdh = dwdh;
		this.jtdh = jtdh;
		this.qsr = qsr;
		this.txrybz = txrybz;
	}

	// Property accessors

	public String getTxryguid() {
		return this.txryguid;
	}

	public void setTxryguid(String txryguid) {
		this.txryguid = txryguid;
	}

	public String getRkjbguid() {
		return this.rkjbguid;
	}

	public void setRkjbguid(String rkjbguid) {
		this.rkjbguid = rkjbguid;
	}

	public String getTxsj() {
		return this.txsj;
	}

	public void setTxsj(String txsj) {
		this.txsj = txsj;
	}

	public String getTxqdw() {
		return this.txqdw;
	}

	public void setTxqdw(String txqdw) {
		this.txqdw = txqdw;
	}

	public String getDwdh() {
		return this.dwdh;
	}

	public void setDwdh(String dwdh) {
		this.dwdh = dwdh;
	}

	public String getJtdh() {
		return this.jtdh;
	}

	public void setJtdh(String jtdh) {
		this.jtdh = jtdh;
	}

	public String getQsr() {
		return this.qsr;
	}

	public void setQsr(String qsr) {
		this.qsr = qsr;
	}

	public String getTxrybz() {
		return this.txrybz;
	}

	public void setTxrybz(String txrybz) {
		this.txrybz = txrybz;
	}

}