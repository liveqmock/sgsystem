/**  
 * @Project: jxoa
 * @Title: ITableCustomService.java
 * @Package com.jxoa.manager.system.service
 * @date 2013-6-17 上午11:57:36
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.manager.system.bean.SyTableCustom;

/**
 * 
 * 类名：ITableCustomService
 * 功能：
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-6-17 上午11:57:36
 *
 */
public interface ITableCustomService extends IBaseService{
	/**
	 * 根据类型查询出模块的自定义内容
	 * @param type
	 * @return
	 */
	
	public List<SyTableCustom> selectTableCustom(short type);
	/**
	 * 根据类型查询出可导出的自定义属性
	 * @param type
	 * @return
	 */
	public List<SyTableCustom> selectTableCustomExport(short type);
	/**
	 * 根据类型查询出可打印的自定义属性
	 * @param type
	 * @return
	 */
	public List<SyTableCustom> selectTableCustomPrint(short type);
	/**
	 * 根据类型查询出可显示的自定义属性
	 * @param type
	 * @return
	 */
	public List<SyTableCustom> selectTableCustomShow(short type);
	
	/**
	 * 添加
	 * @param tc
	 * @return
	 */
	public String addTableCustom(SyTableCustom tc);
	/**
	 * 开发模式--修改
	 * @param tc
	 * @return
	 */
	public String updateDevTableCustom(SyTableCustom tc);
	/**
	 * 用户自定义设置修改，只能修改部分属性
	 * @param tc
	 * @return
	 */
	public String updateTableCustom(SyTableCustom tc);
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public boolean deleteTableCustom(String[] ids);
	
}
