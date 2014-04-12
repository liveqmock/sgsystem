package com.jxoa.manager.common_platform.bean;

import java.sql.Timestamp;
import java.util.Date;

import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;

/**
 * Newscomment entity. @author MyEclipse Persistence Tools
 */

public class Newscomment implements java.io.Serializable {

	// Fields

	private String id;
	@NotBlank(message="评论内容不能为空")
	private String newscomments;
	private String conmmentsnameId;
	private Date conmmentsdate;
	private String newsid;
	private String bycommentnameId;

	// Constructors

	/** default constructor */
	public Newscomment() {
	}

	/** full constructor */
	public Newscomment(String newscomments, String conmmentsnameId,
			Date conmmentsdate, String newsid, String bycommentnameId) {
		this.newscomments = newscomments;
		this.conmmentsnameId = conmmentsnameId;
		this.conmmentsdate = conmmentsdate;
		this.newsid = newsid;
		this.bycommentnameId = bycommentnameId;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNewscomments() {
		return this.newscomments;
	}

	public void setNewscomments(String newscomments) {
		this.newscomments = newscomments;
	}

	public String getConmmentsnameId() {
		return this.conmmentsnameId;
	}

	public void setConmmentsnameId(String conmmentsnameId) {
		this.conmmentsnameId = conmmentsnameId;
	}

	public Date getConmmentsdate() {
		return this.conmmentsdate;
	}

	public void setConmmentsdate(Date conmmentsdate) {
		this.conmmentsdate = conmmentsdate;
	}

	public String getNewsid() {
		return this.newsid;
	}

	public void setNewsid(String newsid) {
		this.newsid = newsid;
	}

	public String getBycommentnameId() {
		return this.bycommentnameId;
	}

	public void setBycommentnameId(String bycommentnameId) {
		this.bycommentnameId = bycommentnameId;
	}

}