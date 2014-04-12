/**  
 * @Project: jxoa
 * @Title: IPublic.java
 * @Package com.jxoa.manager.PublicOffice.addressBook.Public.service
 * @date 2013-5-21 下午02:24:10
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.PublicAddressBook;

/**
 * 
 * 类名：IPublicAddressBookService
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-23 下午02:24:10
 *
 */
public interface IPublicAddressBookService extends IBaseService{
	/**
	 * 公共通讯录条件查询
	 * @param param
	 * @return
	 */
	public List selectPublic(FormParam param,PublicAddressBook p);
	public PublicAddressBook selectPublic(String id);
	/**
	 * 字段值条件查询 计算总数
	 * @return
	 */
	public Long selectPublicCount(PublicAddressBook p);
	/**
	 * 添加公共通讯录
	 * @return
	 */
	public String addPublic(PublicAddressBook p);
	/**
	 * 修改公共通讯录
	 * @return
	 */
	public String updatePublic(PublicAddressBook p);
	/**
	 * 批量删除公共通讯录
	 * @param ids
	 * @return
	 */
	public boolean deletePublic(String[] ids);
	
	
	/**
	 * 导入公共通讯录
	 * @return
	 */
	public String addExcelPublic(List<PublicAddressBook> list,String group);
	/**
	 * 查询分组 
	 * @return
	 */
	public List selectGroup();
	
}
