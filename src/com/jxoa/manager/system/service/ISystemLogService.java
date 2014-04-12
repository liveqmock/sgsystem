/**  
 * @Project: jxoa
 * @Title: ISystemLogService.java
 * @Package com.jxoa.manager.system.service
 * @date 2013-4-11 下午3:48:00
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service;

import java.util.Date;
import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.system.bean.SyLog;
import com.jxoa.manager.system.bean.SyLoginLog;

/**
 * 
 * 类名：ISystemLogService
 * 功能：系统登录日志 系统重要操作日志 业务层
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-11 下午3:48:00
 *
 */
public interface ISystemLogService extends IBaseService{
	
	/**
	 * 条件分页查询登录日志
	 * @param param
	 * @param log
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectSyLoginLog(FormParam param,SyLoginLog log,Date startDate,Date endDate);
	/**
	 * 条件分页查询登录日志 计算总数
	 * @param log
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectSyLoginLogCount(SyLoginLog log,Date startDate,Date endDate);
	/**
	 * 批量删除登录日志
	 * @param ids 
	 * @return
	 */
	public boolean deleteLoginLog(String[] ids);
	
	/**
	 * 条件分页查询操作日志
	 * @param param
	 * @param log
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectSyLog(FormParam param,SyLog log,Date startDate,Date endDate);
	/**
	 * 条件分页查询操作日志 计算总数
	 * @param log
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectSyLogCount(SyLog log,Date startDate,Date endDate);
	/**
	 * 批量删除操作日志
	 * @param ids
	 * @return
	 */
	public boolean deleteLog(String[] ids);
	
	
}
