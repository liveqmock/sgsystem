/**  
 * @Project: jxoa
 * @Title: IScheduleService.java
 * @Package com.jxoa.manager.personalOffice.service
 * @date 2013-5-29 ����9:11:59
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.PerSchedule;

/**
 * 
 * ������IScheduleService
 * ���ܣ��ճ̰��� ҵ���
 * ��ϸ��
 * ���ߣ�LiuJincheng
 * �汾��1.0
 * ���ڣ�2013-5-29 ����9:11:59
 *
 */
public interface IScheduleService extends  IBaseService{
	
	/**
	 * ������ҳ��ѯ�ճ̰���
	 * @param param
	 * @param s
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectSchedule(FormParam param,PerSchedule s,Date startDate,Date endDate);
	/**
	 * ������ҳ��ѯ�ճ̰��� ��������
	 * @param s
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectScheduleCount(PerSchedule s,Date startDate,Date endDate);
	/**
	 * �޸��ճ̰���
	 * @param s
	 * @return
	 */
	public String updateSchedule(PerSchedule s);
	
	/**
	 * ɾ���ճ̰���
	 * @param ids
	 * @return
	 */
	public boolean deleteSchedule(String[] ids);
	
	/**
	 * ��ѯ���ӵ�ǰʱ�䵽���������������Ҫ���ѵ��ճ̰���
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> selectAfterNowTodaySchedule();
	/**
	 * ��ѯ�����������ճ̰���
	 * @return
	 */
	public List selectTodaySchedule();
	/**
	 * ��ѯ��������ճ̰�������
	 * @return
	 */
	public Long selectTodayScheduleCount();
	
	
	
	
}
