/**  
 * @Project: jxoa
 * @Title: IMenuService.java
 * @Package com.jxoa.manager.system.service
 * @date 2013-4-24 上午8:41:38
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service;

import java.util.List;
import java.util.Map;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.system.bean.SyAction;
import com.jxoa.manager.system.bean.SyMenu;

/**
 * 
 * 类名：IMenuService
 * 功能：菜单管理 业务层
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-24 上午8:41:38
 *
 */
public interface IMenuService extends IBaseService{
	
	/**
	 * 查询出所有可用菜单
	 */
	public List<SyMenu> selectMenus();
	/**
	 * 查询出所有可用菜单图标的所有路径，在resource下
	 * @return
	 */
	public String[] selectMenusIcons();
	/**
	 * 添加菜单
	 * @param m
	 * @return
	 */
	public String addMenu(SyMenu m);
	/**
	 * 更新菜单
	 * @param m
	 * @return
	 */
	public String updateMenu(SyMenu m);
	/**
	 * 菜单删除
	 * @param id
	 * @return
	 */
	public String deleteMenu(String id);

	/**
	 * 查询单个菜单，级联查询上级菜单名称
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Map findMenuById(String id);
	
	/**
	 * action 条件分页查询
	 * @param param
	 * @param action
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectActions(FormParam param,SyAction action);
	/**
	 * action 条件分页查询  计算总数
	 * @param action
	 * @return
	 */
	public Long selectActionCount(SyAction action);
	/**
	 * 批量删除action
	 * @param ids
	 * @return
	 */
	public boolean deleteActions(String[] ids);
	
	
}
