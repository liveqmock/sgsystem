/**  
 * @Project: jxoa
 * @Title: IInstantMessageService.java
 * @Package com.jxoa.manager.personalOffice.service
 * @date 2013-5-24 ����5:05:58
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service;

import java.util.Date;
import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.PerInstantMessage;
import com.jxoa.manager.personalOffice.bean.PerMsg;

/**
 * 
 * ������IInstantMessageService
 * ���ܣ���ʱ��Ϣ ҵ���
 * ��ϸ��
 * ���ߣ�LiuJincheng
 * �汾��1.0
 * ���ڣ�2013-5-24 ����5:05:58
 *
 */
public interface IInstantMessageService extends IBaseService{
	/**
	 * ������Ϣ
	 * @param messageContent
	 * @param userIds
	 * @return
	 */
	public boolean addInstantMessage(String messageContent,String[] userIds);
	/**
	 * ������ҳ��ѯ��Ϣ
	 * @param param
	 * @param im
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<PerMsg> selectInstantMessage(FormParam param,PerInstantMessage im,Date startDate,Date endDate);
	/**
	 * ������ҳ��ѯ��Ϣ ��������
	 * @param im
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectInstantMessageCount(PerInstantMessage im,Date startDate,Date endDate);
	/**
	 * ��ѯ��ĳ���û�����ʷ�����¼
	 * @param param
	 * @param userId
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<PerMsg> selectHistoryMessage(FormParam param,String userId,Date startDate,Date endDate);
	/**
	 * ��ѯ��ĳ���û�����ʷ�����¼ ��������
	 * @param userId
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectHistoryMessageCount(String userId,Date startDate,Date endDate);
	/**
	 * �鿴������Ϣ ������״̬
	 * @param id
	 * @return
	 */
	public PerInstantMessage updatefindInstantMessageById(String id);
	/**
	 * ɾ����Ϣ
	 * @param ids
	 * @return
	 */
	public boolean deleteInstantMessage(String[] ids);
	
}
