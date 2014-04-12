package com.jxoa.manager.wwb.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Question implements Serializable {

	/**
	 * 序列化接口
	 */
	private static final long serialVersionUID = 1L;

		private String id ;//问题ID
		private String questionType;//问题类型
		private String questionContent;//问题内容
		private String fileUrl;//问题文件保存路径
		private String questionStatus;//问题状态
		private String questionTitle;//问题标题
		private String 	publisher;//发布人
		private String responser;//回复人
		private Timestamp publishTime;//发布时间
		private Timestamp responseTime;//回复时间
		private String responseContent;//回复内容
		/**
		 * 是否置顶, 1:置顶，0，不置顶
		 */
		private Short isTop;
		/**
		 * 添加无参构造
		 */
		public Question(){
			
		}
		
		/**
		 * get和set方法
		 */
		

		

		public String getQuestionType() {
			return questionType;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public void setQuestionType(String questionType) {
			this.questionType = questionType;
		}

		public String getQuestionContent() {
			return questionContent;
		}

		public void setQuestionContent(String questionContent) {
			this.questionContent = questionContent;
		}

		
		public String getFileUrl() {
			return fileUrl;
		}

		public void setFileUrl(String fileUrl) {
			this.fileUrl = fileUrl;
		}

		public String getQuestionStatus() {
			return questionStatus;
		}

		public void setQuestionStatus(String questionStatus) {
			this.questionStatus = questionStatus;
		}

		public String getQuestionTitle() {
			return questionTitle;
		}

		public void setQuestionTitle(String questionTitle) {
			this.questionTitle = questionTitle;
		}

		public String getPublisher() {
			return publisher;
		}

		public void setPublisher(String publisher) {
			this.publisher = publisher;
		}

		public String getResponser() {
			return responser;
		}

		public void setResponser(String responser) {
			this.responser = responser;
		}

		public Timestamp getPublishTime() {
			return publishTime;
		}

		public void setPublishTime(Timestamp publishTime) {
			this.publishTime = publishTime;
		}

		public Timestamp getResponseTime() {
			return responseTime;
		}

		public void setResponseTime(Timestamp responseTime) {
			this.responseTime = responseTime;
		}

		public String getResponseContent() {
			return responseContent;
		}

		public void setResponseContent(String responseContent) {
			this.responseContent = responseContent;
		}

		public Short getIsTop() {
			return isTop;
		}

		public void setIsTop(Short isTop) {
			this.isTop = isTop;
		}

	
	
		
		
		
		
}
