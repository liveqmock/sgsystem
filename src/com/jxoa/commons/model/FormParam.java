/**  
 * @Project: jxoa
 * @Title: FormParam.java
 * @Package com.jxoa.commons.model
 * @date 2013-4-2 上午10:09:33
 * @Copyright: 2013 
 */
package com.jxoa.commons.model;


/**
 * 
 * 类名：FormParam
 * 功能：分页
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-2 上午10:09:33
 *
 */
public class FormParam {
	/**
	 * 当前页数
	 */
	private Integer pageNum=1;
	/**
	 * 每页显示条数
	 */
	private Integer numPerPage=20;
	/**
	 * 页标数字个数
	 */
	private Integer pageNumShown=5;
	
	/**
	 * 排序的参数名称
	 */
	private	String orderField;
	
	/**
	 * 排序方式
	 */
	private String orderDirection="asc";
	/**
	 * 
	 * 总条数
	 */
	private Long allCount=(long)0;
	/**
	 *	总页数
	 */
	private Integer pageCount ;
	
	/**
	 * get方法计算总页数
	 * @return
	 */
	public Integer getPageCount() {
		if(this.allCount!=null&&numPerPage!=0){
			 //总页数=(总记录数+每页行数-1)/每页行数
			 this.pageCount = (int) ((this.allCount+this.numPerPage-1) / this.numPerPage);
		}else{
			pageCount=0;
		}
		return pageCount;
	}
	
	
	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(Integer numPerPage) {
		this.numPerPage = numPerPage;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderDirection() {
		return orderDirection;
	}

	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}

	

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}


	public Long getAllCount() {
		return allCount;
	}


	public void setAllCount(Long allCount) {
		this.allCount = allCount;
	}


	public Integer getPageNumShown() {
		return pageNumShown;
	}


	public void setPageNumShown(Integer pageNumShown) {
		this.pageNumShown = pageNumShown;
	}

	
	
}
