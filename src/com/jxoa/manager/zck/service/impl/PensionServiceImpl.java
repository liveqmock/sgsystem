/**  
 * @Project: jxoa
 * @Title: RoleServiceImpl.java
 * @Package com.jxoa.manager.system.service.impl
 * @date 2013-4-28 下午2:57:53
 * @Copyright: 2013 
 */
package com.jxoa.manager.zck.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.cache.MyCache;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.StringUtil;
import com.jxoa.manager.qxh.bean.Rkjb;
import com.jxoa.manager.system.bean.SyAction;
import com.jxoa.manager.system.bean.SyMenu;
import com.jxoa.manager.system.bean.SyRole;
import com.jxoa.manager.system.bean.SyRoleAction;
import com.jxoa.manager.system.bean.SyRoleMenu;
import com.jxoa.manager.system.bean.SyUserRole;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.system.service.IRoleService;
import com.jxoa.manager.zck.bean.Shyl;
import com.jxoa.manager.zck.service.PensionService;
import com.jxoa.manager.zck.service.RyglService;

/**
 * 
 * 类名：RoleServiceImpl
 * 功能：角色管理 业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-28 下午2:57:53
 *
 */
@Service
public class PensionServiceImpl extends BaseServiceImpl implements RyglService{
	
	public List selectRkjb(String id){
		
		return dao.find("from SyRole ");
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectRygl(FormParam param,Rkjb pension){
		
		StringBuffer sb=new StringBuffer("from Rkjb r  where 1=1 ");
		List list=new ArrayList();
		//查询条件
		
		if(StringUtils.isNotBlank(pension.getXm())){
			sb.append(" and r.xm like ? ");
			list.add("%"+pension.getXm()+"%");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectRyglCount(Rkjb role){
		
		StringBuffer sb=new StringBuffer("select count(*)from Rkjb r where 1=1 ");
		List list=new ArrayList();
		//查询条件
		
		if(StringUtils.isNotBlank(role.getXm())){
			sb.append(" and r.xm like ? ");
			list.add("%"+role.getXm()+"%");
		}
			
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	public String addShyl(Shyl role){
		
		
		if(role.getSfdb()==null){
			role.setSfdb("否");
		}
		if(role.getSfpk()==null){
			role.setSfpk("否");
		}
		if(role.getSfkc()==null){
			role.setSfkc("否");
		}
		role.setShylguid(StringUtil.getUUID());
		Object obj=dao.findOne("from Shyl where rkjbguid=? ",role.getRkjbguid());
		if(obj==null){
			String id=(String)dao.saveReturnId(role);
			if(StringUtils.isNotBlank(id)){
				saveLog("添加社会养老", "名称:"+role.getJgyl());
				
				//更新角色id-->name  缓存
				MyCache.getInstance().updateCacheMap(MyCache.ROLE2NAME, id,role.getRkjbguid());
				
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.role.unique";//此人员已存在
		}
	}

	public String updateShyl(Shyl role){
		Object obj=dao.findOne("from Shyl where Shylguid=? ",role.getShylguid());
		String guid = role.getRkjbguid2()==null?"":role.getRkjbguid2().toString();
		if(!"".equals(guid)){
			role.setRkjbguid(guid);
		}
		if(obj!=null){
			if(dao.update(role)){
				saveLog("修改养老", "名称:"+role.getShylguid());
				
				//更新角色缓存
				MyCache.getInstance().updateCacheMap(MyCache.ROLE2NAME, role.getShylguid(), role.getRkjbguid());
				
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.role.unique";//此角色名称已存在
		}
	}
	/**
	 * 删除养老
	 */
	public boolean deleteShyl(String[] ids){
		//等待删除的对象集合
		List<Object> c=new ArrayList<Object>();
		for(String id:ids){
			Shyl r=dao.get(Shyl.class, id);
			if(r!=null){
				saveLog("删除养老", "删除名称:"+r.getRkjbguid());
				c.add(r);
				//更新角色缓存
				MyCache.getInstance().removeCacheMap(MyCache.ROLE2NAME, id);
			}
		}
		return dao.deleteAll(c);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectPowers(String id){
		
		List<SyMenu> allMenus=dao.find("from SyMenu order by menuSort asc");
		List<SyAction>allActions=dao.find("from SyAction  order by actionSort asc");
		List<String> oldMenus=dao.find("select menuId from SyRoleMenu where roleId=?",id);
		List<String> oldActions=dao.find("select actionId from SyRoleAction  where roleId=? ",id);
		Map map=new HashMap();
		map.put("menus", allMenus);
		map.put("actions", allActions);
		map.put("hasMenus", oldMenus);
		map.put("hasActions", oldActions);
		
		return map;
	
	}
	
	public boolean updatePowers(String roleId,String addMenuIds,String delMenuIds,String addActionIds,String delActionIds){
		//等待添加更新的对象集合
		List<Object> c=new ArrayList<Object>();
		//添加菜单关联
		if(StringUtils.isNotBlank(addMenuIds)){
			String[] list_addMenuIds=addMenuIds.split(",");
			for(String id:list_addMenuIds){
			
				SyRoleMenu rm=new SyRoleMenu();
				rm.setRoleId(roleId);
				rm.setMenuId(id);
		
				c.add(rm);
			}
		}
		//删除菜单关联
		if(StringUtils.isNotBlank(delMenuIds)){
			String[] list_delMenuIds=delMenuIds.split(",");
			for(String id:list_delMenuIds){
				dao.delete(" delete SyRoleMenu where roleId=? and menuId=? ", roleId,id);
			}
		}
		//添加操作关联
		if(StringUtils.isNotBlank(addActionIds)){
			String[] list_addActionIds=addActionIds.split(",");
			for(String id:list_addActionIds){
				SyRoleAction ra=new SyRoleAction();
				ra.setRoleId(roleId);
				ra.setActionId(id);
	
				c.add(ra);
			}
		}
		//删除操作关联
		if(StringUtils.isNotBlank(delActionIds)){
			String[] list_delActionIds=delActionIds.split(",");
			for(String id:list_delActionIds){
				dao.delete(" delete SyRoleAction where roleId=? and actionId=? ", roleId,id);
			}
		}
		return dao.saveOrUpdateAll(c);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectUsers(FormParam param,String roleId,SyUsers user){
		
		StringBuffer sb=new StringBuffer("select new Map(u.id as id,u.userName as userName,u.userStatus as status,u.trueName as trueName,u.userSex as sex,(select id from SyUserRole ur where ur.userId=u.id and ur.roleId=?)as roleId,u.deptId as deptId)from SyUsers u where 1=1 ");
		List list=new ArrayList();
		list.add(roleId);
		//查询条件
		if(StringUtils.isNotBlank(user.getUserName())){
			sb.append(" and u.userName like ? ");
			list.add("%"+user.getUserName()+"%");
		}
		if(StringUtils.isNotBlank(user.getTrueName())){
			sb.append(" and u.trueName like ? ");
			list.add("%"+user.getTrueName()+"%");
		}
		if(StringUtils.isNotBlank(user.getDeptId())&&!"0".equals(user.getDeptId())){
			sb.append(" and u.deptId = ? ");
			list.add(user.getDeptId());	
		}
		if(user.getUserSex()!=null){
			sb.append(" and u.userSex = ? ");
			list.add((short)user.getUserSex());	
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectUsersCount(SyUsers user){
		
		StringBuffer sb=new StringBuffer("select count(*) from SyUsers u where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(user.getUserName())){
			sb.append(" and u.userName like ? ");
			list.add("%"+user.getUserName()+"%");
		}
		if(StringUtils.isNotBlank(user.getTrueName())){
			sb.append(" and u.trueName like ? ");
			list.add("%"+user.getTrueName()+"%");
		}
		if(StringUtils.isNotBlank(user.getDeptId())&&!"0".equals(user.getDeptId())){
			sb.append(" and u.deptId = ? ");
			list.add(user.getDeptId());	
		}
		if(user.getUserSex()!=null){
			sb.append(" and u.userSex = ? ");
			list.add((short)user.getUserSex());	
		}
		
		return (Long)dao.findOne(sb.toString(),list);
		
	}
	
	public boolean addUserRole(String roleId,String[] ids){
		//等待添加的对象集合
		List<Object> c=new ArrayList<Object>();
		for(String id:ids){
			if(StringUtils.isNotBlank(id)){
				
				SyUserRole ur=new SyUserRole();
				ur.setRoleId(roleId);
				ur.setUserId(id);
				c.add(ur);
			}
		}
		return dao.saveOrUpdateAll(c);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectRoleUsers(FormParam param,String roleId,SyUsers user){
		
		StringBuffer sb=new StringBuffer("select new Map(ur.id as urId,u.id as id,u.userName as userName,u.userStatus as status,u.trueName as trueName,u.userSex as sex,u.deptId as deptId)from SyUsers u ,SyUserRole ur where u.id=ur.userId  and ur.roleId=?");
		List list=new ArrayList();
		list.add(roleId);
		//查询条件
		if(StringUtils.isNotBlank(user.getUserName())){
			sb.append(" and u.userName like ? ");
			list.add("%"+user.getUserName()+"%");
		}
		if(StringUtils.isNotBlank(user.getDeptId())){
			sb.append(" and u.deptId = ? ");
			list.add(user.getDeptId());	
		}
		if(user.getUserSex()!=null){
			sb.append(" and u.userSex = ? ");
			list.add((short)user.getUserSex());	
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectRoleUsersCount(String roleId,SyUsers user){
		
		StringBuffer sb=new StringBuffer("select count(*) from SyUsers u ,SyUserRole ur where u.id=ur.userId  and ur.roleId=? ");
		List list=new ArrayList();
		list.add(roleId);
		//查询条件
		if(StringUtils.isNotBlank(user.getUserName())){
			sb.append(" and u.userName like ? ");
			list.add("%"+user.getUserName()+"%");
		}
		if(StringUtils.isNotBlank(user.getDeptId())){
			sb.append(" and u.deptId = ? ");
			list.add(user.getDeptId());	
		}
		if(user.getUserSex()!=null){
			sb.append(" and u.userSex = ? ");
			list.add((short)user.getUserSex());	
		}
	
		return (Long)dao.findOne(sb.toString(),list);
		
	}
	
	public boolean delUserRole(String[] ids){
		
		for(String id:ids){
			dao.delete(" delete SyUserRole where id=? ", id);
		}
		return true;
	}
	
	
}
