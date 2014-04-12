/**  
 * @Project: jxoa
 * @Title: Member.java
 * @Package com.jxoa.commons.model
 * @date 2013-4-1 上午9:31:14
 * @Copyright: 2013 
 */
package com.jxoa.commons.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 
 * 类名：Member
 * 功能：session中存储用户信息model
 * 详细：保存用户常用信息 放入session
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-1 上午9:31:14
 *
 */

public class Member implements java.io.Serializable{
	
	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;

	/**
	 * 用户id
	 */
	private String id;

	
	/**
	 * 登录信息 
	 * @return
	 */
	private IpInfo ipInfo;
	/**
	 * 登录时间
	 */
	private Timestamp loginTime;
	
	/**
	 * 所有权限url
	 */
	private Set<String> urls=new HashSet<String>();
	
	/**
	 * 部门id
	 */
	private String deptId;
	/***
	 * 角色id集合
	 */
	private List<String> roleIds=new ArrayList<String>();
	
	 
	

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
	public Set<String> getUrls() {
		return urls;
	}
	public void setUrls(Set<String> urls) {
		this.urls = urls;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Timestamp getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public List<String> getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(List<String> roleIds) {
		this.roleIds = roleIds;
	}
	  


}
