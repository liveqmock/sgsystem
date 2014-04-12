/**  
 * @Project: jxoa
 * @Title: FileModel.java
 * @Package com.jxoa.commons.model
 * @date 2013-4-22 上午8:55:17
 * @Copyright: 2013 
 */
package com.jxoa.commons.model;


/**
 * 
 * 类名：FileModel
 * 功能：文件保存模型
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-22 上午8:55:17
 *
 */
public class FileModel {
	/**
	 * 文件上传时表单名称name
	 */
	private String key;
	
	/**
	 * 保存时的文件名称
	 */
	private String newName;
	/**
	 * 文件原名称
	 */
	private String name;
	/**
	 * 后缀
	 */
	private String ext;
	/**
	 * 文件大小
	 */
	private String size;

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getNewName() {
		return newName;
	}
	public void setNewName(String newName) {
		this.newName = newName;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}

}
