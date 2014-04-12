package com.jxoa.manager.personalOffice.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.Assess;
import com.jxoa.manager.system.bean.SyRole;

/**
 * 
 * ������IIntegrationService
 * ���ܣ�
 * ��ϸ��
 * ���ߣ����е�(caozhongde)
 * �汾��1.0
 * ���ڣ�2013-7-19 ����09:42:07
 *
 */
public interface IAssessService extends IBaseService{
	/**
	 * ��ѯѡ����Ŀ�����
	 * @param param
	 * @param a
	 * @return
	 */
	public List assessLoad(FormParam param,Assess a);
	/**
	 * ��ҳ
	 * @param a
	 * @return
	 */
	public Long selectAssessCount(Assess a);
	/**
	 * ��ӿ�����
	 * @param a
	 * @return
	 */
	public String addAssess(Assess a);
	/**
	 * ����ID��ѯ������
	 * @param id
	 * @return
	 */
	public Assess selectAssess(String id);
	/**
	 * �޸Ŀ�����
	 * @param m
	 * @return
	 */
	public String updateAssess(Assess m);
	/**
	 * ɾ��������
	 * @param ids
	 * @return
	 */
	public boolean deleteAssess(String[] ids);
	/**
	 * ��������״̬
	 * @param ids
	 * @return
	 */
	public boolean updateStatus(String[] ids,String status);
	/**
	 * ���Ҵ���ҳ
	 * @param param
	 * @param as
	 * @return
	 */
	public List lookUpAssess(FormParam param,Assess as);
	/**
	 * ���Ҵ���ҳ��ҳ
	 * @param as
	 * @return
	 */
	public Long lookUpAssessCount(Assess as);
	
	

}
