/**  
 * @Project: jxoa
 * @Title: IRoleService.java
 * @Package com.jxoa.manager.system.service
 * @date 2013-4-28 下午2:57:40
 * @Copyright: 2013 
 */
package com.jxoa.manager.zck.service;

import java.util.List;
import java.util.Map;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Rkjb;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.zck.bean.Shyl;

/**
 * 
 * 类名：IRoleService
 * 功能：
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-28 下午2:57:40
 *
 */
public interface RyglService extends IBaseService{
	/**
	 * 查询出所有角色
	 * @return
	 */
	public List selectRkjb(String id);
	
	/**
	 * 角色条件查询
	 * @param param
	 * @param role
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectRygl(FormParam param,Rkjb pension);
	/**
	 * 角色条件查询  计算总数
	 * @param role
	 * @return
	 */
	public Long selectRyglCount(Rkjb role);
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	public String addShyl(Shyl role);
	/**
	 * 更新角色
	 * @param role
	 * @return
	 */
	public String updateShyl(Shyl role);
	/**
	 * 批量删除角色
	 * @param ids
	 * @return
	 */
	public boolean deleteShyl(String[] ids);
	/**
	 * 查询出角色已有权限，所有菜单，操作
	 * @param id
	 * @return
	 */
	@SuppressWarnings({ "rawtypes"})
	public Map selectPowers(String id);
	/**
	 * 更新角色的权限
	 * @param roleId
	 * @param addMenuIds
	 * @param delMenuIds
	 * @param addActionIds
	 * @param delActionIds
	 * @return
	 */
	public boolean updatePowers(String roleId,String addMenuIds,String delMenuIds,String addActionIds,String delActionIds);
	
	/**
	 * 权限分配 查询用户
	 * @param param
	 * @param roleId
	 * @param user
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectUsers(FormParam param,String roleId,SyUsers user);
	/**
	 * 权限分配 查询用户 计算总数 
	 * @param roleId
	 * @param user
	 * @return
	 */
	public Long selectUsersCount(SyUsers user);
	/**
	 * 将角色批量分配给用户
	 * @param roleId
	 * @param ids
	 * @return
	 */
	public boolean addUserRole(String roleId,String[] ids);
	
	/**
	 * 角色分配管理 查询出角色已分配的用户
	 * @param param
	 * @param roleId
	 * @param user
	 * @return
	 */
	public List selectRoleUsers(FormParam param,String roleId,SyUsers user);
	
	/**
	 * 角色分配管理 查询出角色已分配的用户	 计算总数
	 * @param roleId
	 * @param user
	 * @return
	 */
	public Long selectRoleUsersCount(String roleId,SyUsers user);
	/**
	 * 角色分配管理，删除用户
	 * @param ids
	 * @return
	 */
	public boolean delUserRole(String[] ids);
	
	
}
