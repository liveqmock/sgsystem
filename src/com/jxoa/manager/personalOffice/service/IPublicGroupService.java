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
import com.jxoa.manager.personalOffice.bean.GroupAddressBook;
import com.jxoa.manager.personalOffice.bean.PublicGroup;

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
public interface IPublicGroupService extends IBaseService{
	/**
	 * 通讯录分组条件查询
	 * @param param
	 * @return
	 */
	public List selectGroup(FormParam param,PublicGroup g);
	public PublicGroup  selectGroup(String id);
	/**
	 * 字段值条件查询 计算总数
	 * @return
	 */
	public Long selectGroupCount(PublicGroup g);
	/**
	 * 添加通讯录分组
	 * @return
	 */
	public String addGroup(PublicGroup g);
	/**
	 * 修改通讯录分组
	 * @return
	 */
	public String updateGroup(PublicGroup g);
	/**
	 * 批量删除通讯录分组
	 * @param ids
	 * @return
	 */
	public String deleteGroup(String[] ids);
	
	
}
