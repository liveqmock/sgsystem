package com.jxoa.manager.common_platform.bean;

import java.sql.Timestamp;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

/**
 * 系统公告表对应实体
 */

public class XtAffiche implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * 标题
	 */
	@Length(min=1, max=50, message="标题长度限制在1-50")
	private String afficheTitle;
	/**
	 * 公告类型，字典值id
	 */
	@Pattern(regexp="^[A-Za-z0-9]{32}$",message="类型格式错误")
	private String afficheType;
	/**
	 * 发布时间
	 */
	private Timestamp createTime;
	/**
	 * 发布人id
	 */
	private String userId;
	/**
	 * 公告内容
	 */
	@Length(min=1, max=65530, message="内容不能为空，限制65530字节")
	private String afficheContent;
	/**
	 * 是否置顶, 1:置顶，0，不置顶
	 */
	private Short isTop;

	// Constructors

	/** default constructor */
	public XtAffiche() {
	}

	/** full constructor */
	public XtAffiche(String afficheTitle, String afficheType,
			Timestamp createTime, String userId, String afficheContent,
			Short isTop) {
		this.afficheTitle = afficheTitle;
		this.afficheType = afficheType;
		this.createTime = createTime;
		this.userId = userId;
		this.afficheContent = afficheContent;
		this.isTop = isTop;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAfficheTitle() {
		return this.afficheTitle;
	}

	public void setAfficheTitle(String afficheTitle) {
		this.afficheTitle = afficheTitle;
	}

	public String getAfficheType() {
		return this.afficheType;
	}

	public void setAfficheType(String afficheType) {
		this.afficheType = afficheType;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAfficheContent() {
		return this.afficheContent;
	}

	public void setAfficheContent(String afficheContent) {
		this.afficheContent = afficheContent;
	}

	public Short getIsTop() {
		return this.isTop;
	}

	public void setIsTop(Short isTop) {
		this.isTop = isTop;
	}

}