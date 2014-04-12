package com.jxoa.manager.system.bean;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;


/**
 * 部门表对应实体
 */

public class SyDept implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * 部门序号
	 */
	@NotNull(message="部门序号不能为空")
	@Range(min=1,max=999,message="部门序号必须为1-999的整数")
	private Short deptSort;
	/**
	 * 部门名称
	 */
	@Pattern(regexp="^([\u2E80-\u9FFF]|\\w){1,50}$",message="部门名称只能由汉字、数字、字母或者下划线组成，长度在1-50之间。")
	private String deptName;
	/**
	 * 部门电话
	 */
	@Pattern(regexp="^|[0-9-]{6,15}$",message="电话格式错误，格式：XXX-XXXXXXX")
	private String deptPhone;
	/**
	 * 部门传真
	 */
	@Pattern(regexp="^|[0-9-]{6,15}$",message="传真格式错误，格式：XXX-XXXXXXX")
	private String deptFax;
	/**
	 * 部门地址
	 */
	@Length(min=0,max=100,message="地址长度不能超过100。")
	private String deptAddress;
	/**
	 * 上级部门
	 */
	@Pattern(regexp="^[0]|[A-Za-z0-9]{32}$",message="上级部门格式错误")
	private String superId;
	/**
	 * 部门主管
	 */
	private String leadUid;
	/**
	 * 部门描述
	 */
	@Length(min=0,max=200,message="备注长度不能超过100。")
	private String deptDesc;
	

	// Constructors

	/** default constructor */
	public SyDept() {
	}

	/** minimal constructor */
	public SyDept(Short deptSort, String deptName, String superId) {
		this.deptSort = deptSort;
		this.deptName = deptName;
		this.superId = superId;
	}

	/** full constructor */
	public SyDept(Short deptSort, String deptName, String deptPhone,
			String deptFax, String deptAddress, String superId, String leadUid,
			String deptDesc) {
		this.deptSort = deptSort;
		this.deptName = deptName;
		this.deptPhone = deptPhone;
		this.deptFax = deptFax;
		this.deptAddress = deptAddress;
		this.superId = superId;
		this.leadUid = leadUid;
		this.deptDesc = deptDesc;
		
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Short getDeptSort() {
		return this.deptSort;
	}

	public void setDeptSort(Short deptSort) {
		this.deptSort = deptSort;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptPhone() {
		return this.deptPhone;
	}

	public void setDeptPhone(String deptPhone) {
		this.deptPhone = deptPhone;
	}

	public String getDeptFax() {
		return this.deptFax;
	}

	public void setDeptFax(String deptFax) {
		this.deptFax = deptFax;
	}

	public String getDeptAddress() {
		return this.deptAddress;
	}

	public void setDeptAddress(String deptAddress) {
		this.deptAddress = deptAddress;
	}

	public String getSuperId() {
		return this.superId;
	}

	public void setSuperId(String superId) {
		this.superId = superId;
	}

	public String getLeadUid() {
		return this.leadUid;
	}

	public void setLeadUid(String leadUid) {
		this.leadUid = leadUid;
	}

	public String getDeptDesc() {
		return this.deptDesc;
	}

	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}



}