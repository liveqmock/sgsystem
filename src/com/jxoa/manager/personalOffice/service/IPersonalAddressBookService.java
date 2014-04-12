/**  
 * @Project: jxoa
 * @Title: IPersonal.java
 * @Package com.jxoa.manager.personalOffice.addressBook.Personal.service
 * @date 2013-5-21 ����02:24:10
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.PersonalAddressBook;

/**
 * 
 * ������IPersonalAddressBookService
 * ���ܣ�
 * ��ϸ��
 * ���ߣ����е�(caozhongde)
 * �汾��1.0
 * ���ڣ�2013-5-21 ����02:24:10
 *
 */
public interface IPersonalAddressBookService extends IBaseService{
	/**
	 * ����ͨѶ¼������ѯ
	 * @param param
	 * @return
	 */
	public List selectPersonal(FormParam param,PersonalAddressBook p);
	public PersonalAddressBook selectPersonal(String id);
	/**
	 * �ֶ�ֵ������ѯ ��������
	 * @return
	 */
	public Long selectPersonalCount(PersonalAddressBook p);
	/**
	 * ��Ӹ���ͨѶ¼
	 * @return
	 */
	public String addPersonal(PersonalAddressBook p);
	/**
	 * �޸ĸ���ͨѶ¼
	 * @return
	 */
	public String updatePersonal(PersonalAddressBook p);
	/**
	 * ����ɾ������ͨѶ¼
	 * @param ids
	 * @return
	 */
	public boolean deletePersonal(String[] ids);
	
	/**
	 * ��ѯ����ͨѶ¼�ķ���
	 * 
	 * */
	public List selectGroup();
}
