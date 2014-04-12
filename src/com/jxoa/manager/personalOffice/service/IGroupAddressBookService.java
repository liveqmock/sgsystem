/**  
 * @Project: jxoa
 * @Title: IPublic.java
 * @Package com.jxoa.manager.PublicOffice.addressBook.Public.service
 * @date 2013-5-21 ����02:24:10
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.GroupAddressBook;

/**
 * 
 * ������IPublicAddressBookService
 * ���ܣ�
 * ��ϸ��
 * ���ߣ����е�(caozhongde)
 * �汾��1.0
 * ���ڣ�2013-5-23 ����02:24:10
 *
 */
public interface IGroupAddressBookService extends IBaseService{
	/**
	 * ͨѶ¼����������ѯ
	 * @param param
	 * @return
	 */
	public List selectGroup(FormParam param,GroupAddressBook g);
	public GroupAddressBook  selectGroup(String id);
	/**
	 * �ֶ�ֵ������ѯ ��������
	 * @return
	 */
	public Long selectGroupCount(GroupAddressBook g);
	/**
	 * ���ͨѶ¼����
	 * @return
	 */
	public String addGroup(GroupAddressBook g);
	/**
	 * �޸�ͨѶ¼����
	 * @return
	 */
	public String updateGroup(GroupAddressBook g);
	/**
	 * ����ɾ��ͨѶ¼����
	 * @param ids
	 * @return
	 */
	public String deleteGroup(String[] ids);
	
	
}
