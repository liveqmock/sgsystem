package com.jxoa.manager.personalOffice.bean;

import java.sql.Timestamp;

/**
 * 即时消息表对应实体
 */

public class PerInstantMessage implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * 发送人id
	 */
	private String sendUid;
	/**
	 * 接收人id
	 */
	private String receiveUid;
	/**
	 * 发送时间
	 */
	private Timestamp createTime;
	/**
	 * 消息内容
	 */
	private String messageContent;
	/**
	 * 消息读取状态，1：已读，0：未读
	 */
	private Short readState;

	// Constructors

	/** default constructor */
	public PerInstantMessage() {
	}

	/** minimal constructor */
	public PerInstantMessage(String sendUid, String receiveUid,
			Timestamp createTime, Short readState) {
		this.sendUid = sendUid;
		this.receiveUid = receiveUid;
		this.createTime = createTime;
		this.readState = readState;
	}

	/** full constructor */
	public PerInstantMessage(String sendUid, String receiveUid,
			Timestamp createTime, String messageContent, Short readState) {
		this.sendUid = sendUid;
		this.receiveUid = receiveUid;
		this.createTime = createTime;
		this.messageContent = messageContent;
		this.readState = readState;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSendUid() {
		return this.sendUid;
	}

	public void setSendUid(String sendUid) {
		this.sendUid = sendUid;
	}

	public String getReceiveUid() {
		return this.receiveUid;
	}

	public void setReceiveUid(String receiveUid) {
		this.receiveUid = receiveUid;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getMessageContent() {
		return this.messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Short getReadState() {
		return this.readState;
	}

	public void setReadState(Short readState) {
		this.readState = readState;
	}

}