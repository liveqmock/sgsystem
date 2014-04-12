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
import com.jxoa.manager.personalOffice.bean.PublicAddressBook;

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
public interface IPublicAddressBookService extends IBaseService{
	/**
	 * ����ͨѶ¼������ѯ
	 * @param param
	 * @return
	 */
	public List selectPublic(FormParam param,PublicAddressBook p);
	public PublicAddressBook selectPublic(String id);
	/**
	 * �ֶ�ֵ������ѯ ��������
	 * @return
	 */
	public Long selectPublicCount(PublicAddressBook p);
	/**
	 * ��ӹ���ͨѶ¼
	 * @return
	 */
	public String addPublic(PublicAddressBook p);
	/**
	 * �޸Ĺ���ͨѶ¼
	 * @return
	 */
	public String updatePublic(PublicAddressBook p);
	/**
	 * ����ɾ������ͨѶ¼
	 * @param ids
	 * @return
	 */
	public boolean deletePublic(String[] ids);
	
	
	/**
	 * ���빫��ͨѶ¼
	 * @return
	 */
	public String addExcelPublic(List<PublicAddressBook> list,String group);
	/**
	 * ��ѯ���� 
	 * @return
	 */
	public List selectGroup();
	
}
