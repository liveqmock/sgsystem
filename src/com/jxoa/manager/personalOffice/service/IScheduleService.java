/**  
 * @Project: jxoa
 * @Title: IScheduleService.java
 * @Package com.jxoa.manager.personalOffice.service
 * @date 2013-5-29 上午9:11:59
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
 * 类名：IScheduleService
 * 功能：日程安排 业务层
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-29 上午9:11:59
 *
 */
public interface IScheduleService extends  IBaseService{
	
	/**
	 * 条件分页查询日程安排
	 * @param param
	 * @param s
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectSchedule(FormParam param,PerSchedule s,Date startDate,Date endDate);
	/**
	 * 条件分页查询日程安排 计算总数
	 * @param s
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectScheduleCount(PerSchedule s,Date startDate,Date endDate);
	/**
	 * 修改日程安排
	 * @param s
	 * @return
	 */
	public String updateSchedule(PerSchedule s);
	
	/**
	 * 删除日程安排
	 * @param ids
	 * @return
	 */
	public boolean deleteSchedule(String[] ids);
	
	/**
	 * 查询出从当前时间到今天结束，所有需要提醒的日程安排
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> selectAfterNowTodaySchedule();
	/**
	 * 查询出今天所有日程安排
	 * @return
	 */
	public List selectTodaySchedule();
	/**
	 * 查询出今天的日程安排数量
	 * @return
	 */
	public Long selectTodayScheduleCount();
	
	
	
	
}
