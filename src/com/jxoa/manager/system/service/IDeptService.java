/**  
 * @Project: jxoa
 * @Title: IDeptService.java
 * @Package com.jxoa.manager.system.service
 * @date 2013-4-3 下午5:11:18
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.system.bean.SyDept;

/**
 * 
 * 类名：IDeptService
 * 功能：部门管理 业务操作
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-3 下午5:11:18
 *
 */
public interface IDeptService extends IBaseService{
	/**
	 * 添加部门
	 * @param d
	 * @return  添加结果对应的国际资源的key
	 */
	public String addDept(SyDept d);
	
	/**
	 * 查询出所有部门
	 */
	public List<SyDept> selectAllDepts();
	
	/**
	 * 修改部门
	 * @param d
	 * @return
	 */
	public String updateDept(SyDept d);
	
	/**
	 * 删除部门
	 * @param id
	 * @return
	 */
	public String deleteDept(String id);

	/**
	 * 部门条件分页查询
	 * @param param
	 * @param dept
	 * @return
	 */
	@SuppressWarnings({ "rawtypes" })
	public List selectDepts(FormParam param,SyDept dept);
	/**
	 * 部门条件分页查询，计算总数
	 * @param dept
	 * @return
	 */
	public Long selectDeptsCount(SyDept dept);
}
