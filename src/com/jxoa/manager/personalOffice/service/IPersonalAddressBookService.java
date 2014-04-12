/**  
 * @Project: jxoa
 * @Title: IPersonal.java
 * @Package com.jxoa.manager.personalOffice.addressBook.Personal.service
 * @date 2013-5-21 下午02:24:10
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.PersonalAddressBook;

/**
 * 
 * 类名：IPersonalAddressBookService
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-21 下午02:24:10
 *
 */
public interface IPersonalAddressBookService extends IBaseService{
	/**
	 * 个人通讯录条件查询
	 * @param param
	 * @return
	 */
	public List selectPersonal(FormParam param,PersonalAddressBook p);
	public PersonalAddressBook selectPersonal(String id);
	/**
	 * 字段值条件查询 计算总数
	 * @return
	 */
	public Long selectPersonalCount(PersonalAddressBook p);
	/**
	 * 添加个人通讯录
	 * @return
	 */
	public String addPersonal(PersonalAddressBook p);
	/**
	 * 修改个人通讯录
	 * @return
	 */
	public String updatePersonal(PersonalAddressBook p);
	/**
	 * 批量删除个人通讯录
	 * @param ids
	 * @return
	 */
	public boolean deletePersonal(String[] ids);
	
	/**
	 * 查询个人通讯录的分组
	 * 
	 * */
	public List selectGroup();
}
