/**  
 * @Project: jxoa
 * @Title: UserServiceImpl.java
 * @Package com.jxoa.manager.system.service.impl
 * @date 2013-3-29 下午2:20:27
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.cache.MyCache;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.MD5Util;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.system.bean.ListValues;
import com.jxoa.manager.system.bean.SyAction;
import com.jxoa.manager.system.bean.SyDept;
import com.jxoa.manager.system.bean.SyMenu;
import com.jxoa.manager.system.bean.SyRole;
import com.jxoa.manager.system.bean.SyUserRole;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.system.service.IUserService;

/**
 * 
 * 类名：UserServiceImpl
 * 功能：用户管理 业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-3-29 下午2:20:27
 *
 */
@Service
public class UserServiceImpl extends BaseServiceImpl implements IUserService{
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectUsers(FormParam param,SyUsers user){
	
		StringBuffer sb=new StringBuffer("from SyUsers u where 1=1 ");
		List list=new ArrayList();
		if(StringUtils.isNotBlank(user.getUserName())){
			sb.append(" and u.userName like ? ");
			list.add("%"+user.getUserName()+"%");
		}
		if(StringUtils.isNotBlank(user.getTrueName())){
			sb.append(" and u.trueName like ? ");
			list.add("%"+user.getTrueName()+"%");
		}
		if(StringUtils.isNotBlank(user.getDeptId())){
			sb.append(" and u.deptId = ? ");
			list.add(user.getDeptId());	
		}
		if(user.getUserSex()!=null){
			sb.append(" and u.userSex = ? ");
			list.add(user.getUserSex());	
		}
		if(user.getUserStatus()!=null){
			sb.append(" and u.userStatus = ? ");
			list.add(user.getUserStatus());	
		}
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			
			sb.append(" order by u."+param.getOrderField()+" "+param.getOrderDirection());
			
		}else{
			
		}
		List<SyUsers> users= dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
		for(SyUsers u:users){
			u.setUserPassword("");//清空密码
		}
		return users;
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectUsersCount(SyUsers user){
		
		StringBuffer sb=new StringBuffer("select count(*)from SyUsers u where 1=1 ");
		List list=new ArrayList();
		if(StringUtils.isNotBlank(user.getUserName())){
			sb.append(" and u.userName like ? ");
			list.add("%"+user.getUserName()+"%");
		}
		if(StringUtils.isNotBlank(user.getTrueName())){
			sb.append(" and u.trueName like ? ");
			list.add("%"+user.getTrueName()+"%");
		}
		if(StringUtils.isNotBlank(user.getDeptId())){
			sb.append(" and u.deptId = ? ");
			list.add(user.getDeptId());	
		}
		if(user.getUserSex()!=null){
			sb.append(" and u.userSex = ? ");
			list.add(user.getUserSex());	
		}
		if(user.getUserStatus()!=null){
			sb.append(" and u.userStatus = ? ");
			list.add(user.getUserStatus());	
		}
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	public String addUser(SyUsers user){
		Object obj=dao.findOne("from SyUsers where userName=?",user.getUserName());
		if(obj==null){
			
			Member me=ServletUtil.getMember();
			user.setRegisterUid(me.getId());
			user.setUserPassword(MD5Util.MD5(user.getUserPassword()));
			user.setErrorCount((short)0);
			user.setLastLoginIp("x.x.x.x");//设置用户最后登录ip，可以根据此ip判断用户是否为第一次登录系统
			user.setRegisterTime(new Timestamp(new Date().getTime()));
			String id=(String)dao.saveReturnId(user);
			if(StringUtils.isNotBlank(id)){
				
				saveLog("添加用户", "账号:"+user.getUserName());
				
				//更新用户 id-->name  缓存
				MyCache.getInstance().updateCacheMap(MyCache.USERID2NAME, id, user.getUserName());
				MyCache.getInstance().updateCacheMap(MyCache.USERID2TRUENAME, id, user.getTrueName());
				ServletUtil.getSession().removeAttribute("jmpw");//清除加密密码
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.username.unique";//用户名已被占用
		}
	}
	public String updateUser(SyUsers u){
		SyUsers old=dao.get(SyUsers.class, u.getId());
		if(old==null){
			return MsgConfig.MSG_KEY_NODATA;
		}
		Object obj=dao.findOne("from SyUsers where userName=? and id!=?",u.getUserName(),u.getId());
		if(obj!=null){
			return "msg.username.unique";//用户名已被占用
		}
		if(StringUtils.isNotBlank(u.getUserPassword())){
			old.setUserPassword(MD5Util.MD5(u.getUserPassword()));
		}
		old.setUserName(u.getUserName());
		old.setTrueName(u.getTrueName());
		old.setUserSex(u.getUserSex());
		old.setDeptId(u.getDeptId());
		old.setUserDesc(u.getUserDesc());
		
		
		old.setUserStatus(u.getUserStatus());
		
		old.setMobilePhoneNumber(u.getMobilePhoneNumber());
		old.setXltypeid(u.getXltypeid());
		old.setZwtypeid(u.getZwtypeid());
		old.setJoindate(u.getJoindate());
		old.setDytypeid(u.getDytypeid());
		
		saveLog("修改用户", "账号:"+old.getUserName());
		
		//更新用户 id-->name  缓存
		MyCache.getInstance().updateCacheMap(MyCache.USERID2NAME, u.getId(), u.getUserName());
		MyCache.getInstance().updateCacheMap(MyCache.USERID2TRUENAME, u.getId(), u.getTrueName());
		
		return MsgConfig.MSG_KEY_SUCCESS;
		
	}
	
	
	public boolean deleteUser(String[] ids){
		//等待删除的对象集合
		List<Object> c=new ArrayList<Object>();
		for(String id:ids){
			SyUsers user=dao.get(SyUsers.class, id);
			if(user!=null){
				saveLog("删除用户", "账号："+user.getUserName()+" 姓名："+user.getTrueName());
				
				c.add(user);
				
				//更新用户 id-->name  缓存
				MyCache.getInstance().removeCacheMap(MyCache.USERID2NAME, id);
				MyCache.getInstance().removeCacheMap(MyCache.USERID2TRUENAME, id);
			}
		}
		

		return dao.deleteAll(c);
	}
	

	@SuppressWarnings("rawtypes")
	public List selectUserRoles(String userId){
		
		return dao.find("select r from SyRole r,SyUserRole ur where ur.userId=? and r.id=ur.roleId ",userId);
		
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectUserRolesAndIds(String userId){
		
		List<SyRole> allRoles=dao.find("from SyRole ");
		List<String> oldRoles=dao.find("select roleId from SyUserRole where userId=? ",userId);
		Map map=new HashMap();
		map.put("roles", allRoles);
		map.put("hasRoles", oldRoles);
		
		return map;
		
	}
	public boolean updateUserRoles(String userId,String[] addRoleIds,String[] delRoleIds){
		//等待修改的对象集合
		List<Object> c=new ArrayList<Object>();
		//添加用户角色关联
		
		for(String id:addRoleIds){
			SyUserRole ur=new SyUserRole();
			ur.setRoleId(id);
			ur.setUserId(userId);
			c.add(ur);
		}
		//删除用户角色关联
		for(String id:delRoleIds){
			dao.delete(" delete SyUserRole where roleId=? and userId=? ",id,userId);
		}
		
		return dao.saveOrUpdateAll(c);
	}
	public Map<String,Object> selectUserPowers(String userId){
		List<String> ids=dao.find("select r.id from SyRole r, SyUserRole ur where ur.roleId=r.id and ur.userId=? ",userId);
		Map<String,Object> map=new HashMap<String,Object>();
		if(!ids.isEmpty()){
			Map<String,Object> queryValues=new HashMap<String,Object>();
			queryValues.put("roleIds", ids);
			List<SyMenu> menus=dao.find("select distinct m from SyRoleMenu rm,SyMenu m where rm.menuId=m.id and rm.roleId in(:roleIds) order by m.menuSort asc",queryValues);
			List<SyAction> actions=dao.find("select distinct a from SyRoleAction ra,SyAction a where ra.actionId=a.id and ra.roleId in(:roleIds) order by a.actionSort asc",queryValues);
			
			map.put("menus", menus);
			map.put("actions", actions);
			
		}else{
			map.put("noRole", true);
		}
		return map;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectUsersLookUp(FormParam param,SyUsers user){
	
		StringBuffer sb=new StringBuffer("select new Map(u.id as id,u.userName as userName,u.trueName as trueName,u.userStatus as userStatus,u.userSex as userSex, u.deptId as deptId,u.mobilePhoneNumber as number)from SyUsers u where 1=1 ");
		List list=new ArrayList();
		if(StringUtils.isNotBlank(user.getUserName())){
			sb.append(" and u.userName like ? ");
			list.add("%"+user.getUserName()+"%");
		}
		if(StringUtils.isNotBlank(user.getTrueName())){
			sb.append(" and u.trueName like ? ");
			list.add("%"+user.getTrueName()+"%");
		}
		if(StringUtils.isNotBlank(user.getDeptId())){
			sb.append(" and u.deptId = ? ");
			list.add(user.getDeptId());	
		}
		if(user.getUserSex()!=null){
			sb.append(" and u.userSex = ? ");
			list.add(user.getUserSex());	
		}
		if(user.getUserStatus()!=null){
			sb.append(" and u.userStatus = ? ");
			list.add(user.getUserStatus());	
		}
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectUsersLookUpCount(SyUsers user){
		
		StringBuffer sb=new StringBuffer("select count(*)from SyUsers u where 1=1 ");
		List list=new ArrayList();
		if(StringUtils.isNotBlank(user.getUserName())){
			sb.append(" and u.userName like ? ");
			list.add("%"+user.getUserName()+"%");
		}
		if(StringUtils.isNotBlank(user.getTrueName())){
			sb.append(" and u.trueName like ? ");
			list.add("%"+user.getTrueName()+"%");
		}
		if(StringUtils.isNotBlank(user.getDeptId())){
			sb.append(" and u.deptId = ? ");
			list.add(user.getDeptId());	
		}
		if(user.getUserSex()!=null){
			sb.append(" and u.userSex = ? ");
			list.add(user.getUserSex());	
		}
		if(user.getUserStatus()!=null){
			sb.append(" and u.userStatus = ? ");
			list.add(user.getUserStatus());	
		}
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<SyUsers> selectAllUsers(){
		
		return  dao.find("from SyUsers");
		
	}
	
	public boolean updatePassword(String id,String userPassword){
		
		
			
		return dao.update("update SyUsers set userPassword=? where id=?",MD5Util.MD5(userPassword),id);
			
	}
	
	public boolean updateMyPassword(String oldPassword,String userPassword){
		
		
		SyUsers user=dao.get(SyUsers.class, ServletUtil.getMember().getId());
		if(MD5Util.MD5Validate(oldPassword, user.getUserPassword())){
			user.setUserPassword(MD5Util.MD5(userPassword));
			saveLog("修改密码", "");
			return true;
		}else{
			return false;
		}
		
	}
	@Override
	public SyDept selectDept(String name) {
		
		return (SyDept) dao.findOne("from SyDept where deptName=?",name);
	}
	@Override
	public ListValues selectListView(String value) {
		
		return (ListValues) dao.findOne("from ListValues where listValue=?", value);
	}
	@Override
	public String addExcel(List<SyUsers> list) {
		Collection c=new ArrayList();
		for(int i=0;i<list.size();i++){
			c.add(list.get(i));
		}
		if (dao.saveOrUpdateAll(c)) {
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return MsgConfig.MSG_KEY_FAIL;
		}
	}
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public String addUsers(SyUsers user){
		Object obj=dao.findOne("from SyUsers where userName=?",user.getUserName());
		if(obj==null){
			
			Member me=ServletUtil.getMember();
		//	user.setRegisterUid(me.getId());
			user.setUserPassword(MD5Util.MD5(user.getUserPassword()));
			user.setErrorCount((short)0);
			user.setLastLoginIp("x.x.x.x");//设置用户最后登录ip，可以根据此ip判断用户是否为第一次登录系统
			user.setRegisterTime(new Timestamp(new Date().getTime()));
			String id=(String)dao.saveReturnId(user);
			if(StringUtils.isNotBlank(id)){
				//添加角色
				SyUserRole role = new SyUserRole();
				role.setUserId(id);
				role.setRoleId("4028808844f6cfd70144f6d5b6e70002");
				dao.save(role);
				//saveLog("添加用户", "账号:"+user.getUserName());
				
				//更新用户 id-->name  缓存
				//MyCache.getInstance().updateCacheMap(MyCache.USERID2NAME, id, user.getUserName());
				//MyCache.getInstance().updateCacheMap(MyCache.USERID2TRUENAME, id, user.getTrueName());
				ServletUtil.getSession().removeAttribute("jmpw");//清除加密密码
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.username.unique";//用户名已被占用
		}
	}
}
