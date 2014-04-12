/**  
 * @Project: jxoa
 * @Title: IMeetingService.java
 * @Package com.jxoa.manager.common_platform.service
 * @date 2013-5-9 上午10:25:16
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.service;

import java.util.List;
import java.util.Map;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.common_platform.bean.Meeting;
import com.jxoa.manager.system.bean.SyDept;
import com.jxoa.manager.system.bean.SyRole;
import com.jxoa.manager.system.bean.SyUsers;


/**
 * 
 * 类名：IMeetingService
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-9 上午10:25:16
 *
 */
public interface IMeetingService extends IBaseService{
	/**
	 * 会议值条件查询
	 * @param param
	 * @param lv
	 * @return
	 */
	public List selectMeeting(FormParam param,Meeting lv);
	/**
	 * 字段值条件查询 计算总数
	 * @param lv
	 * @return
	 */
	public Long selectMeetingCount(Meeting lv);
	/**
	 * 添加会议值
	 * @param lv
	 * @return
	 */
	public String addMeeting(Meeting lv);
	/**
	 * 修改会议值
	 * @param lv
	 * @return
	 */
	public String updateMeeting(Meeting lv);
	/**
	 * 批量删除会议值
	 * @param ids
	 * @return
	 */
	public boolean deleteMeeting(String[] ids);
	
	
	
	/***
	 * 查询会议室,可以根据会议室ID查询 
	 * 
	 * */
	public List selectRoom();
	
	/**
	 * 根据会议id查找mapping表的数据
	 * 
	 * **/
	public Map selectMapping(String id);
	
	/**
	 * 查找登录人员的会议信息
	 * */
	public List selectMeetingTome(FormParam param, Meeting lv);
}
