/**  
 * @Project: jxoa
 * @Title: IEmailService.java
 * @Package com.jxoa.manager.personalOffice.service
 * @date 2013-5-28 ����03:46:45
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FileList;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.EmDraftbox;
import com.jxoa.manager.personalOffice.bean.EmInbox;
import com.jxoa.manager.personalOffice.bean.EmInboxOutboxUser;
import com.jxoa.manager.personalOffice.bean.EmOutbox;
import com.jxoa.manager.personalOffice.bean.Email;

/**
 * 
 * ������IEmailService
 * ���ܣ�
 * ��ϸ��
 * ���ߣ����е�(caozhongde)
 * �汾��1.0
 * ���ڣ�2013-5-28 ����03:46:45
 *
 */
public interface IEmailService  extends IBaseService{
	
	/**
	 * �����ʼ�
	 * @param eo
	 * @param userIds
	 * @param savePath
	 * @param request
	 * @return
	 */
	public boolean addEmail(EmOutbox eo,String userIds ,String type,String  id,String savePath,HttpServletRequest request,FileList files);
	/**
	 * �����ռ���
	 * @param param
	 * @param e
	 * @return
	 */
	public List selectEmInbox(FormParam param,Email e,String status);
	/**
	 * �ռ�����ҳ
	 * @param e
	 * @return
	 */
	public Long selectEmInboxCount(Email e,String status);
	
	/**
	 * ����ID��ѯһ����¼
	 * @param id
	 * @return
	 */
	public Map selectEmail(String id);
	/**
	 * ����ID��ѯһ���ռ����¼
	 * @param id
	 * @return
	 */
	public Map findIn(String id);
	/**
	 * �޸��ʼ�״̬
	 * @param id
	 * @return
	 */
	public boolean updateStatus(String id);
	/**
	 * ���ط�����
	 * @param param
	 * @param e
	 * @return
	 */
	public List selectEmOutbox(FormParam param,Email e);
	
	/**
	 * ��������ҳ
	 * @param e
	 * @return
	 */
	public Long selectEmOutboxCount(Email e);
	/**
	 * �鿴�ʼ�
	 * @param id
	 * @return
	 */
	public Map selectOutbox(String id);
	
	/**
	 * ����ݸ���
	 * @param eo
	 * @param userIds
	 * @param savePath
	 * @param request
	 * @return
	 */
	public boolean saveEmail(EmOutbox eo,String userIds,String savePath,HttpServletRequest request,FileList files);
	/**
	 * �޸Ĳݸ���
	 * @param eo
	 * @param userIds
	 * @param savePath
	 * @param request
	 * @return
	 */
	public boolean update(EmOutbox eo,String userIds,String savePath,HttpServletRequest request,FileList files);
	
	/**
	 * ���زݸ���
	 * @param param
	 * @param e
	 * @return
	 */
	public Map selectEmDraftbox(FormParam param,Email e);
	
	/**
	 * �ݸ�����ҳ
	 * @param e
	 * @return
	 */
	public Long selectEmDraftboxCount(Email e);
	/**
	 * ����ID��ѯ�ݸ����ʼ�
	 * @param id
	 * @return
	 */
	public Map findDraftOne(String id);
	
	/**
	 * �Ӳݸ��䷢���ʼ�
	 * @param eo
	 * @param userIds
	 * @param savePath
	 * @param request
	 * @return
	 */
	public boolean addDraft(EmOutbox eo,String userIds,String savePath,HttpServletRequest request,FileList files);
	/**
	 * ����ɾ���ռ���
	 * @param ids
	 * @return
	 */
	public boolean deleteEmail(String[] ids,int type,String savePath);
	
	/**
	 * ����IDɾ������
	 * @param id
	 * @return
	 */
	public boolean deleteFile(String id,String savePath);
}
