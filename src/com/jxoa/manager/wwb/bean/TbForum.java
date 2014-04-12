package com.jxoa.manager.wwb.bean;

import java.sql.Timestamp;

/**
 * TbForum entity. @author MyEclipse Persistence Tools
 */

public class TbForum implements java.io.Serializable {

	// Fields

	private String id;
	private String subject;
	private String content;
	private String username;
	private Timestamp publishTime;
	/**
	 * 是否置顶, 1:置顶，0，不置顶
	 */
	private Short isTop;
	// Constructors

	/** default constructor */
	public TbForum() {
	}

	/** minimal constructor */
	public TbForum(String subject, String username, Timestamp publishTime) {
		this.subject = subject;
		this.username = username;
		this.publishTime = publishTime;
	}

	/** full constructor */
	public TbForum(String subject, String content, String username,
			Timestamp publishTime) {
		this.subject = subject;
		this.content = content;
		this.username = username;
		this.publishTime = publishTime;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Timestamp getPublishTime() {
		return this.publishTime;
	}

	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}

	public Short getIsTop() {
		return isTop;
	}

	public void setIsTop(Short isTop) {
		this.isTop = isTop;
	}
	
	

}