package com.jxoa.manager.system.bean;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

/**
 * 用户表对应实体
 */

public class SyUsers implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * 用户登录名称
	 */
	@Pattern(regexp="^\\w{3,15}$",message="用户名只能由数字、字母或者下划线组成，长度在3-15之间。")
	private String userName;
	/**
	 * 用户密码
	 */
	private String userPassword;
	/**
	 * 注册时间
	 */
	private Timestamp registerTime;
	/**
	 * 最后登陆时间
	 */
	private Timestamp lastLoginTime;
	/**
	 * 最后登陆ip
	 */
	private String lastLoginIp;
	/**
	 * 登陆时密码输入错误时间(最后一次)
	 */
	private Timestamp errorTime;
	/**
	 * 密码输入错误次数，当输入正确一次时清零
	 */
	private Short errorCount;
	/**
	 * 用户状态，1：可用，0：不可用，禁止登陆系统
	 */
	@NotNull(message="状态不能为空")
	@Range(min=0,max=1,message="状态格式错误")
	private Short userStatus;
	/**
	 * 用户所属部门id
	 */
	private String deptId;
	/**
	 * 用户真实姓名
	 */
	@Pattern(regexp="^([\u2E80-\u9FFF]|\\w){2,10}$",message="真实姓名只能由汉字、数字、字母或者下划线组成，长度在2-10之间。")
	private String trueName;
	/**
	 * 备注
	 */
	@Length(min=0, max=50, message="用户备注长度不能大于50。")
	private String userDesc;
	/**
	 * 性别,1:男，0：女
	 */
	@NotNull(message="性别不能为空")
	@Range(min=0,max=1,message="性别格式错误")
	private Short userSex;
	/**
	 * 注册用户人id
	 */
	private String registerUid;
	/**
	 * 手机号
	 */
	@Pattern(regexp="^|\\d{11}$",message="手机号格式错误")
	private String mobilePhoneNumber;
    /**
     * 学历类型
     */
	private String xltypeid;
	/**
	 * 党员类型
	 */
	private String dytypeid;
	/**
	 * 入职时间
	 */
	private String joindate;
	/**
	 * 职务类型
	 */
	private String zwtypeid;

	// Constructors

	/** default constructor */
	public SyUsers() {
	}

	/** minimal constructor */
	public SyUsers(String userName, String userPassword, Short userStatus,
			String deptId, String trueName, Short userSex, String registerUid) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.userStatus = userStatus;
		this.deptId = deptId;
		this.trueName = trueName;
		this.userSex = userSex;
		this.registerUid = registerUid;
		
	}

	/** full constructor */
	public SyUsers(String userName, String userPassword,
			Timestamp registerTime, Timestamp lastLoginTime,
			String lastLoginIp, Timestamp errorTime, Short errorCount,
			Short userStatus, String deptId, String trueName, String userDesc,
			Short userSex, String registerUid,String mobilePhoneNumber,String xltypeid,String dytypeid,String joindate,String zwtypeid) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.registerTime = registerTime;
		this.lastLoginTime = lastLoginTime;
		this.lastLoginIp = lastLoginIp;
		this.errorTime = errorTime;
		this.errorCount = errorCount;
		this.userStatus = userStatus;
		this.deptId = deptId;
		this.trueName = trueName;
		this.userDesc = userDesc;
		this.userSex = userSex;
		this.registerUid = registerUid;
		this.mobilePhoneNumber=mobilePhoneNumber;
		this.xltypeid = xltypeid;
		this.dytypeid = dytypeid;
		this.joindate = joindate;
		this.zwtypeid = zwtypeid;
		
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Timestamp getRegisterTime() {
		return this.registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	public Timestamp getLastLoginTime() {
		return this.lastLoginTime;
	}

	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getLastLoginIp() {
		return this.lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public Timestamp getErrorTime() {
		return this.errorTime;
	}

	public void setErrorTime(Timestamp errorTime) {
		this.errorTime = errorTime;
	}

	public Short getErrorCount() {
		return this.errorCount;
	}

	public void setErrorCount(Short errorCount) {
		this.errorCount = errorCount;
	}

	public Short getUserStatus() {
		return this.userStatus;
	}

	public void setUserStatus(Short userStatus) {
		this.userStatus = userStatus;
	}

	public String getDeptId() {
		return this.deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getTrueName() {
		return this.trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getUserDesc() {
		return this.userDesc;
	}

	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}

	public Short getUserSex() {
		return this.userSex;
	}

	public void setUserSex(Short userSex) {
		this.userSex = userSex;
	}

	public String getRegisterUid() {
		return this.registerUid;
	}

	public void setRegisterUid(String registerUid) {
		this.registerUid = registerUid;
	}

	public String getMobilePhoneNumber() {
		return mobilePhoneNumber;
	}

	public void setMobilePhoneNumber(String mobilePhoneNumber) {
		this.mobilePhoneNumber = mobilePhoneNumber;
	}

	public String getXltypeid() {
		return xltypeid;
	}

	public void setXltypeid(String xltypeid) {
		this.xltypeid = xltypeid;
	}

	public String getDytypeid() {
		return dytypeid;
	}

	public void setDytypeid(String dytypeid) {
		this.dytypeid = dytypeid;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public String getZwtypeid() {
		return zwtypeid;
	}

	public void setZwtypeid(String zwtypeid) {
		this.zwtypeid = zwtypeid;
	}




}