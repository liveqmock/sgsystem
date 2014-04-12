package com.jxoa.manager.coordination.bean;

import java.sql.Timestamp;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

/**
 * 通知表对应实体
 */

public class XtNotice implements java.io.Serializable {

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	// Fields

	private String id;
	/**
	 * 标题
	 */
	@Length(min=1, max=100, message="标题长度限制在1-100")
	private String noticeTitle;
	/**
	 * 通知类型，字典值id
	 */
	@Pattern(regexp="^[A-Za-z0-9]{32}$",message="类型格式错误")
	private String noticeType;
	/**
	 * 创建人
	 */
	private String noticeSendId;
	/**
	 * 创建时间
	 */
	private Timestamp noticeCreateTime;

	// Constructors

	/** default constructor */
	public XtNotice() {
	}

	/** minimal constructor */
	public XtNotice(String noticeTitle, String noticeType) {
		this.noticeTitle = noticeTitle;
		this.noticeType = noticeType;
	}

	/** full constructor */
	public XtNotice(String noticeTitle, String noticeType, String noticeSendId,
			Timestamp noticeCreateTime) {
		this.noticeTitle = noticeTitle;
		this.noticeType = noticeType;
		this.noticeSendId = noticeSendId;
		this.noticeCreateTime = noticeCreateTime;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNoticeTitle() {
		return this.noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeType() {
		return this.noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	public String getNoticeSendId() {
		return this.noticeSendId;
	}

	public void setNoticeSendId(String noticeSendId) {
		this.noticeSendId = noticeSendId;
	}

	public Timestamp getNoticeCreateTime() {
		return this.noticeCreateTime;
	}

	public void setNoticeCreateTime(Timestamp noticeCreateTime) {
		this.noticeCreateTime = noticeCreateTime;
	}

}