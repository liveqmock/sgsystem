/**  
 * @Project: jxoa
 * @Title: IPerMsgService.java
 * @Package com.jxoa.manager.personalOffice.service
 * @date 2013-5-21 下午4:23:25
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
 * 类名：IPerMsgService
 * 功能：消息提醒 业务层
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-21 下午4:23:25
 *
 */
public interface IPerMsgService extends IBaseService {
	
	/**
	 * 分页条件查询消息提醒
	 * @param param
	 * @param msg
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<PerMsg> selectPerMsg(FormParam param,PerMsg msg,Date startDate,Date endDate);
	/**
	 * 分页条件查询消息提醒 计算总数
	 * @param msg
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectPerMsgCount(PerMsg msg,Date startDate,Date endDate);
	/**
	 * 查看单个消息提醒
	 * @param id
	 * @return
	 */
	public PerMsg updatefindPerMsgById(String id);
	/**
	 * 批量删除消息提醒
	 * @param ids
	 * @return
	 */
	public boolean deletePerMsg(String[] ids);
	/**
	 * 查询未读提醒数量
	 * @return
	 */
	public Long selectNotReadNumber();
	
}
