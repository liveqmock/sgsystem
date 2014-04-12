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
import com.jxoa.manager.personalOffice.bean.PublicGroup;

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
public interface IPublicGroupService extends IBaseService{
	/**
	 * ͨѶ¼����������ѯ
	 * @param param
	 * @return
	 */
	public List selectGroup(FormParam param,PublicGroup g);
	public PublicGroup  selectGroup(String id);
	/**
	 * �ֶ�ֵ������ѯ ��������
	 * @return
	 */
	public Long selectGroupCount(PublicGroup g);
	/**
	 * ���ͨѶ¼����
	 * @return
	 */
	public String addGroup(PublicGroup g);
	/**
	 * �޸�ͨѶ¼����
	 * @return
	 */
	public String updateGroup(PublicGroup g);
	/**
	 * ����ɾ��ͨѶ¼����
	 * @param ids
	 * @return
	 */
	public String deleteGroup(String[] ids);
	
	
}
