/**
 * 
 */
package com.jxoa.manager.personnel.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.PersonalAddressBook;
import com.jxoa.manager.personnel.bean.Staff;

/**
 * 
 * 类名：StaffServiceImpl
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013年6月8日 15:23:23
 *
 */
public interface IStaffService  extends IBaseService{

	/**
	 * 加载在职员工信息
	 * @return
	 */
	public List selectStaff(FormParam param, Staff s,Date staDate,Date endDate);
	/**
	 * 加载离职员工信息
	 * @return
	 */
	public List selectRes(FormParam param, Staff s,Date staDate,Date endDate);
	/**
	 * 加载退休员工信息
	 * @return
	 */
	public List selectRet(FormParam param, Staff s,Date staDate,Date endDate);
	
	/**
	 * 加载在职员工数量
	 * @return
	 */
	public Long selectStaffCount( Staff s,Date staDate,Date endDate);
	/**
	 * 加载离职员工数量
	 * @return
	 */
	public Long selectResCount( Staff s,Date staDate,Date endDate);
	/**
	 * 加载退休员工数量
	 * @return
	 */
	public Long selectRetCount(Staff s,Date staDate,Date endDate);
	
	/**
	 * 添加员工信息
	 * @param s
	 * @return
	 */
	public  String addStaff(Staff s);
	/**
	 * 加载修改信息
	 * @param id
	 * @return
	 */
	public Map updatePage(String id);
	/**
	 *  修改员工信息
	 * @param s
	 * @return
	 */
	public String update(Staff s);
	/**
	 * 删除员工信息
	 * @param ids
	 * @return
	 */
	public boolean deleteStaff(String[] ids);
	/**
	 *  修改员工状态
	 * @param s
	 * @return
	 */
	public String updateStatus(Staff s);
}
