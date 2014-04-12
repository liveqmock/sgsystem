package com.jxoa.manager.system.bean;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

/**
 * �Զ����ӡ�������ñ�ʵ��
 */

public class SyTableCustom implements java.io.Serializable {

	// Fields

	/**
	 * @Fields serialVersionUID : 
	 */
	
	private static final long serialVersionUID = 1L;
	private String id;
	/**
	 * ���ͣ���ͬ���Ͷ�Ӧ��ͬ��
	 */
	@NotNull(message="���Ͳ���Ϊ��")
	private Short tbType;
	/**
	 * ˳���
	 */
	@NotNull(message="˳��Ų���Ϊ��")
	@Range(min=1,max=999,message="˳��ű���Ϊ1-999������")
	private Short fieldSort;
	/**
	 * ���ֶζ�Ӧ��javaBean��������
	 */
	@Length(min=1,max=30,message="������������1-30֮�䡣")
	private String fieldName;
	/**
	 * ��������
	 */
	@NotNull(message="�������Ͳ���Ϊ��")
	private Short fieldType;
	/**
	 * Ĭ�ϵ���ʾ��
	 */
	@Length(min=1,max=20,message="��ʾ��������1-20֮�䡣")
	private String fieldTitle;
	/**
	 * ��ʾ�ı��������û������ʾĬ������
	 */
	@Length(min=0,max=20,message="����������0-20֮�䡣")
	private String fieldAnotherTitle;
	/**
	 * �Ƿ񵼳���1��������0��������
	 */
	private Short isExport;
	/**
	 * �Ƿ��ӡ,1:��ӡ��0,����ӡ
	 */
	private Short isPrint;
	/**
	 * �Ƿ���ʾ��1����ʾ��0������ʾ
	 */
	private Short isShow;

	// Constructors

	/** default constructor */
	public SyTableCustom() {
	}

	/** minimal constructor */
	public SyTableCustom(Short tbType, Short fieldSort, String fieldName,
			Short fieldType, String fieldTitle, Short isExport, Short isPrint,
			Short isShow) {
		this.tbType = tbType;
		this.fieldSort = fieldSort;
		this.fieldName = fieldName;
		this.fieldType = fieldType;
		this.fieldTitle = fieldTitle;
		this.isExport = isExport;
		this.isPrint = isPrint;
		this.isShow = isShow;
	}

	/** full constructor */
	public SyTableCustom(Short tbType, Short fieldSort, String fieldName,
			Short fieldType, String fieldTitle, String fieldAnotherTitle,
			Short isExport, Short isPrint, Short isShow) {
		this.tbType = tbType;
		this.fieldSort = fieldSort;
		this.fieldName = fieldName;
		this.fieldType = fieldType;
		this.fieldTitle = fieldTitle;
		this.fieldAnotherTitle = fieldAnotherTitle;
		this.isExport = isExport;
		this.isPrint = isPrint;
		this.isShow = isShow;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Short getTbType() {
		return this.tbType;
	}

	public void setTbType(Short tbType) {
		this.tbType = tbType;
	}

	public Short getFieldSort() {
		return this.fieldSort;
	}

	public void setFieldSort(Short fieldSort) {
		this.fieldSort = fieldSort;
	}

	public String getFieldName() {
		return this.fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public Short getFieldType() {
		return this.fieldType;
	}

	public void setFieldType(Short fieldType) {
		this.fieldType = fieldType;
	}

	public String getFieldTitle() {
		return this.fieldTitle;
	}

	public void setFieldTitle(String fieldTitle) {
		this.fieldTitle = fieldTitle;
	}

	public String getFieldAnotherTitle() {
		return this.fieldAnotherTitle;
	}

	public void setFieldAnotherTitle(String fieldAnotherTitle) {
		this.fieldAnotherTitle = fieldAnotherTitle;
	}

	public Short getIsExport() {
		return this.isExport;
	}

	public void setIsExport(Short isExport) {
		this.isExport = isExport;
	}

	public Short getIsPrint() {
		return this.isPrint;
	}

	public void setIsPrint(Short isPrint) {
		this.isPrint = isPrint;
	}

	public Short getIsShow() {
		return this.isShow;
	}

	public void setIsShow(Short isShow) {
		this.isShow = isShow;
	}

}