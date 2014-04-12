package com.jxoa.manager.system.bean;

import java.sql.Timestamp;

/**
 * 登陆日志对应实体
 */

public class SyLoginLog implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * 用户id
	 */
	private String userId;
	/**
	 * 登陆时间
	 */
	private Timestamp loginTime;
	/**
	 * 登陆ip
	 */
	private String loginIp;
	/**
	 * ip信息：国家
	 */
	private String ipInfoCountry;
	/**
	 * ip信息：省份
	 */
	private String ipInfoRegion;
	/**
	 * ip信息：城市
	 */
	private String ipInfoCity;
	/**
	 * ip信息：运营商
	 */
	private String ipInfoIsp;
	/**
	 * 日志
	 */
	private String loginType;

	// Constructors

	/** default constructor */
	public SyLoginLog() {
	}

	/** minimal constructor */
	public SyLoginLog(String userId, Timestamp loginTime) {
		this.userId = userId;
		this.loginTime = loginTime;
	}

	/** full constructor */
	public SyLoginLog(String userId, Timestamp loginTime, String loginIp,
			String ipInfoCountry, String ipInfoRegion, String ipInfoCity,
			String ipInfoIsp, String loginType) {
		this.userId = userId;
		this.loginTime = loginTime;
		this.loginIp = loginIp;
		this.ipInfoCountry = ipInfoCountry;
		this.ipInfoRegion = ipInfoRegion;
		this.ipInfoCity = ipInfoCity;
		this.ipInfoIsp = ipInfoIsp;
		this.loginType = loginType;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Timestamp getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

	public String getLoginIp() {
		return this.loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getIpInfoCountry() {
		return this.ipInfoCountry;
	}

	public void setIpInfoCountry(String ipInfoCountry) {
		this.ipInfoCountry = ipInfoCountry;
	}

	public String getIpInfoRegion() {
		return this.ipInfoRegion;
	}

	public void setIpInfoRegion(String ipInfoRegion) {
		this.ipInfoRegion = ipInfoRegion;
	}

	public String getIpInfoCity() {
		return this.ipInfoCity;
	}

	public void setIpInfoCity(String ipInfoCity) {
		this.ipInfoCity = ipInfoCity;
	}

	public String getIpInfoIsp() {
		return this.ipInfoIsp;
	}

	public void setIpInfoIsp(String ipInfoIsp) {
		this.ipInfoIsp = ipInfoIsp;
	}

	public String getLoginType() {
		return this.loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

}