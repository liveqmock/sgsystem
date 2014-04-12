/**  
 * @Project: jxoa
 * @Title: IPerMsgService.java
 * @Package com.jxoa.manager.personalOffice.service
 * @date 2013-5-21 ����4:23:25
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service;

import java.util.Date;
import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.PerMsg;

/**
 * 
 * ������IPerMsgService
 * ���ܣ���Ϣ���� ҵ���
 * ��ϸ��
 * ���ߣ�LiuJincheng
 * �汾��1.0
 * ���ڣ�2013-5-21 ����4:23:25
 *
 */
public interface IPerMsgService extends IBaseService {
	
	/**
	 * ��ҳ������ѯ��Ϣ����
	 * @param param
	 * @param msg
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<PerMsg> selectPerMsg(FormParam param,PerMsg msg,Date startDate,Date endDate);
	/**
	 * ��ҳ������ѯ��Ϣ���� ��������
	 * @param msg
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectPerMsgCount(PerMsg msg,Date startDate,Date endDate);
	/**
	 * �鿴������Ϣ����
	 * @param id
	 * @return
	 */
	public PerMsg updatefindPerMsgById(String id);
	/**
	 * ����ɾ����Ϣ����
	 * @param ids
	 * @return
	 */
	public boolean deletePerMsg(String[] ids);
	/**
	 * ��ѯδ����������
	 * @return
	 */
	public Long selectNotReadNumber();
	
}
