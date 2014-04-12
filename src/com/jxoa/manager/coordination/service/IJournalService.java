/**  
 * @Project: jxoa
 * @Title: IJournalService.java
 * @Package com.jxoa.manager.coordination.service
 * @date 2013-5-23 上午10:14:08
 * @Copyright: 2013 
 */
package com.jxoa.manager.coordination.service;

import java.util.Date;
import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.coordination.bean.XtJournal;

/**
 * 
 * 类名：IJournalService
 * 功能：日志管理 业务层
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-23 上午10:14:08
 *
 */
public interface IJournalService extends IBaseService{

	/**
	 * 日志条件分页查询
	 * @param param
	 * @param xj
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectJournal(FormParam param,XtJournal xj,Date startDate,Date endDate);
	/**
	 * 日志条件分页查询 计算总数
	 * @param xj
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectJournalCount(XtJournal xj,Date startDate,Date endDate);
	
	/**
	 * 查询我能查看的分享日志
	 * @param param
	 * @param xj
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List selectJournalShare(FormParam param,XtJournal xj,Date startDate,Date endDate);
	/**
	 * 查询我能查看的分享日志 计算总数
	 * @param xj
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectJournalShareCount(XtJournal xj,Date startDate,Date endDate);
	
	/**
	 * 添加日志
	 * @param xj	
	 * @param userIds	共享人id
	 * @param isSendMsg	是否发送消息提醒 1:发送
	 * @return
	 */
	public boolean saveJournal(XtJournal xj,String[] userIds,Integer isSendMsg);
	
	/**
	 * 更新日志
	 * @param xj
	 * @return
	 */
	public String updateJournal(XtJournal xj,String[] userIds,Integer isSendMsg);
	
	/**
	 * 批了删除日志
	 * @param ids
	 * @return
	 */
	public boolean deleteJournal(String[] ids);
	/**
	 * 根据日志id查询出共享用户的id用，拼接
	 * @param id
	 * @return
	 */
	public String selectJournalUserIds(String id);
	
}
