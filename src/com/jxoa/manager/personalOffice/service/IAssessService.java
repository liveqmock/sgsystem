package com.jxoa.manager.personalOffice.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.Assess;
import com.jxoa.manager.system.bean.SyRole;

/**
 * 
 * 类名：IIntegrationService
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-7-19 上午09:42:07
 *
 */
public interface IAssessService extends IBaseService{
	/**
	 * 查询选中组的考核项
	 * @param param
	 * @param a
	 * @return
	 */
	public List assessLoad(FormParam param,Assess a);
	/**
	 * 分页
	 * @param a
	 * @return
	 */
	public Long selectAssessCount(Assess a);
	/**
	 * 添加考核项
	 * @param a
	 * @return
	 */
	public String addAssess(Assess a);
	/**
	 * 根据ID查询考核项
	 * @param id
	 * @return
	 */
	public Assess selectAssess(String id);
	/**
	 * 修改考核项
	 * @param m
	 * @return
	 */
	public String updateAssess(Assess m);
	/**
	 * 删除考核项
	 * @param ids
	 * @return
	 */
	public boolean deleteAssess(String[] ids);
	/**
	 * 批量更新状态
	 * @param ids
	 * @return
	 */
	public boolean updateStatus(String[] ids,String status);
	/**
	 * 查找带回页
	 * @param param
	 * @param as
	 * @return
	 */
	public List lookUpAssess(FormParam param,Assess as);
	/**
	 * 查找带回页分页
	 * @param as
	 * @return
	 */
	public Long lookUpAssessCount(Assess as);
	
	

}
