/**  
 * @Project: jxoa
 * @Title: IDistrictService.java
 * @Package com.jxoa.manager.system.service
 * @date 2013-6-19 下午2:03:01
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.system.bean.SyDistrict;

/**
 * 
 * 类名：IDistrictService
 * 功能：
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-6-19 下午2:03:01
 *
 */
public interface IDistrictService extends IBaseService{
	
	/**
	 * 条件分页查询 地区
	 * @param param
	 * @param dis
	 * @return
	 */
	@SuppressWarnings({ "rawtypes"})
	public List selectDistrict(FormParam param,SyDistrict dis);
	/**
	 * 条件分页查询 地区 计算总数
	 * @param dis
	 * @return
	 */
	public Long selectDistrictCount(SyDistrict dis);
	/**
	 * 添加地区
	 * @param dis
	 * @return
	 */
	public String addDistrict(SyDistrict dis);
	/**
	 * 修改
	 * @param dis
	 * @return
	 */
	public String updateDistrict(SyDistrict dis);
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public boolean deleteDistrict(String[] ids);
	/**
	 * 查询出所有地区
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectAllDistrict();
	/**
	 * 根据id查询出下级地区
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectDistrictBySuperId(int id);
	
	
}
