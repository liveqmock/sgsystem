/**  
 * @Project: jxoa
 * @Title: IUserService.java
 * @Package com.jxoa.manager.system.service
 * @date 2013-3-29 下午2:20:05
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service;

import java.util.List;
import java.util.Map;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.system.bean.ListValues;
import com.jxoa.manager.system.bean.SyDept;
import com.jxoa.manager.system.bean.SyUsers;


/**
 * 
 * 类名：IUserService
 * 功能：用户管理 业务层
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-3-29 下午2:20:05
 *
 */
public interface IUserService extends IBaseService{
	
	/**
	 * 用户查询
	 * @param param
	 * @param user
	 * @return
	 */
	public List selectUsers(FormParam param,SyUsers user);
	/**
	 * 用户查询 获取用户总数
	 * @param param
	 * @param user
	 * @return
	 */
	public Long selectUsersCount(SyUsers user);
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public String addUser(SyUsers user);

	/**
	 * 更新用户信息
	 * @param u
	 * @return
	 */
	public String updateUser(SyUsers u);
	/**
	 * 批量删除用户
	 * @param id
	 * @return
	 */
	public boolean deleteUser(String[] id);
	
	/**
	 * 根据用户id查询用户所有角色
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectUserRoles(String userId);
	
	/**
	 * 查询出所有角色，和用户已有角色，用于用户角色更新
	 * @param userId
	 * @return
	 */
	@SuppressWarnings({ "rawtypes"})
	public Map selectUserRolesAndIds(String userId);
	/**
	 * 用户角色分配
	 * @param userId
	 * @param addRoleIds
	 * @param delRoleIds
	 * @return
	 */
	public boolean updateUserRoles(String userId,String[] addRoleIds,String[] delRoleIds);
	/**
	 * 查询某用户拥有的所有权限
	 * @param userId
	 * @return
	 */
	public Map<String,Object> selectUserPowers(String userId);
	/**
	 * 用户查询  查找带回
	 * @param param
	 * @param user
	 * @return
	 */
	@SuppressWarnings({ "rawtypes" })
	public List selectUsersLookUp(FormParam param,SyUsers user);
	/**
	 * 用户查询 查找带回计算总数
	 * @param user
	 * @return
	 */
	public Long selectUsersLookUpCount(SyUsers user);
	
	/**
	 * 查询所有的用户
	 * @return
	 */
	public List<SyUsers> selectAllUsers();
	/**
	 * 重置用户密码
	 * @param id
	 * @return
	 */
	public boolean updatePassword(String id,String userPassword);
	/**
	 * 当前用户修改密码
	 * @param oldPassword
	 * @param userPassword
	 * @return
	 */
	public boolean updateMyPassword(String oldPassword,String userPassword);
	
	
	/**
	 * 根据大区名称查询大区ID
	 */
	public SyDept selectDept(String name);
	/**
	 * 根据字典名称查询
	 * @param value
	 * @return
	 */
	public ListValues selectListView(String value);
	/**
	 * Excel导入
	 * @param list
	 * @return
	 */
	public String addExcel(List<SyUsers> list);
	
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	public String addUsers(SyUsers user);
}
