/**  
 * @Project: jxoa
 * @Title: OnLineUser.java
 * @Package com.jxoa.commons.model
 * @date 2013-4-10 下午5:10:10
 * @Copyright: 2013 
 */
package com.jxoa.commons.model;

/**
 * 
 * 类名：OnLineUser
 * 功能：全局变量存储用户在线基本信息
 * 详细：用户在线统计
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-10 下午5:10:10
 *
 */
public class OnLineUser implements java.io.Serializable{
	
	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;

	/**
	 * 用户id
	 */
	private String id;
	/**
	 * 真实姓名
	 */
	private String trueName;
	/**
	 * 用户当前在线会话 sessionId
	 */
	private String sessionId;
	/**
	 * 性别 男,女
	 */
	private String sex;
	/**
	 * 用户备注
	 */
	private String desc;
	/**
	 * 登陆ip
	 */
	private String ip;
	/**
	 * 登录信息 
	 * @return
	 */
	private IpInfo ipInfo;
	/**
	 * 部门id
	 */
	private String deptId;
	/**
	 * 部门名称
	 */
	private String deptName;
	
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public IpInfo getIpInfo() {
		return ipInfo;
	}
	public void setIpInfo(IpInfo ipInfo) {
		this.ipInfo = ipInfo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
