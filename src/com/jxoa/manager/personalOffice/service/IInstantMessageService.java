/**  
 * @Project: jxoa
 * @Title: IInstantMessageService.java
 * @Package com.jxoa.manager.personalOffice.service
 * @date 2013-5-24 下午5:05:58
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
 * 类名：IInstantMessageService
 * 功能：即时消息 业务层
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-24 下午5:05:58
 *
 */
public interface IInstantMessageService extends IBaseService{
	/**
	 * 发送消息
	 * @param messageContent
	 * @param userIds
	 * @return
	 */
	public boolean addInstantMessage(String messageContent,String[] userIds);
	/**
	 * 条件分页查询消息
	 * @param param
	 * @param im
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<PerMsg> selectInstantMessage(FormParam param,PerInstantMessage im,Date startDate,Date endDate);
	/**
	 * 条件分页查询消息 计算总数
	 * @param im
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectInstantMessageCount(PerInstantMessage im,Date startDate,Date endDate);
	/**
	 * 查询和某个用户的历史聊天记录
	 * @param param
	 * @param userId
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<PerMsg> selectHistoryMessage(FormParam param,String userId,Date startDate,Date endDate);
	/**
	 * 查询和某个用户的历史聊天记录 计算总数
	 * @param userId
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectHistoryMessageCount(String userId,Date startDate,Date endDate);
	/**
	 * 查看单个信息 并更新状态
	 * @param id
	 * @return
	 */
	public PerInstantMessage updatefindInstantMessageById(String id);
	/**
	 * 删除信息
	 * @param ids
	 * @return
	 */
	public boolean deleteInstantMessage(String[] ids);
	
}
