/**  
 * @Project: jxoa
 * @Title: IAfficheService.java
 * @Package com.jxoa.manager.common_platform.service
 * @date 2013-5-31 上午9:59:27
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.service;

import java.util.Date;
import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.common_platform.bean.XtAffiche;
import com.jxoa.manager.common_platform.bean.XtAfficheDept;

/**
 * 
 * 类名：IAfficheService
 * 功能：公共平台--公告管理业务层接口
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-31 上午9:59:27
 *
 */
public interface IAfficheService extends IBaseService{
	
	/**
	 * 条件分页查询 系统公告
	 * @param param
	 * @param a
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<XtAffiche> selectAffiche(FormParam param,XtAffiche a,Date startDate,Date endDate);
	/**
	 * 条件分页查询 系统公告 计算总数
	 * @param a
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectAfficheCount(XtAffiche a,Date startDate,Date endDate);
	/**
	 * 更新系统公告
	 * @param xa
	 * @return
	 */
	public String updateAffiche(XtAffiche xa);
	/**
	 * 删除系统公告
	 * @param ids
	 * @return
	 */
	public boolean deleteAffiche(String[] ids);
	
	
	
	/**
	 * 条件分页查询 部门公告
	 * @param param
	 * @param a
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<XtAfficheDept> selectAfficheDept(FormParam param,XtAfficheDept a,Date startDate,Date endDate);
	/**
	 * 条件分页查询 部门公告 计算总数
	 * @param a
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectAfficheDeptCount(XtAfficheDept a,Date startDate,Date endDate);
	/**
	 * 更新部门公告
	 * @param xa
	 * @return
	 */
	public boolean updateAfficheDept(XtAfficheDept xa);
	/**
	 * 删除部门公告
	 * @param ids
	 * @return
	 */
	public boolean deleteAfficheDept(String[] ids);
	
	
	
}
