/**  
` * @Project: jxoa
 * @Title: MainServiceImpl.java
 * @Package com.jxoa.manager.system.service.impl
 * @date 2013-5-3 下午4:08:30
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.model.OnLineUser;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.system.bean.SyAction;
import com.jxoa.manager.system.bean.SyMenu;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.system.service.IMainService;
import com.jxoa.manager.system.service.IMenuService;

/**
 * 
 * 类名：MainServiceImpl
 * 功能：
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-3 下午4:08:30
 *
 */
@Service
public class MainServiceImpl extends BaseServiceImpl implements IMainService{
	
	@Resource(name="menuServiceImpl")
	private IMenuService menuService; 
	
	//初始化用户信息
	@SuppressWarnings("unchecked")
	public List<SyMenu> init(SyUsers u){
		
		Member me=ServletUtil.getMember();
		
		me.setDeptId(u.getDeptId());
		
		//获取全局 用户列表
		Map<String,OnLineUser> usersMap=ServletUtil.getOnLineUsers();
		
		OnLineUser onmy=usersMap.get(me.getId());
		onmy.setTrueName(u.getTrueName());
		onmy.setDesc(u.getUserDesc());
		onmy.setDeptId(u.getDeptId());
		
		if(u.getUserSex()==1){
			onmy.setSex("男");
		}else{
			onmy.setSex("女");
		}
		
		//查询全部可用菜单
		List<SyMenu> allMenus=menuService.selectMenus();
//		  System.out.println(u.getId()+"id是多少");
//		  System.out.println(me.getId()+"me的ID是多少");
		//获取用户角色ID集合
		List<String> roleIds=dao.find("select roleId from SyUserRole where userId=? ",me.getId());
		me.setRoleIds(roleIds);
		 
		
		if(ServletUtil.isDeveloper()){
			return allMenus;
		}
		
		//所有角色拥有的菜单ID集合
		Set<String> menuIds=new HashSet<String>();
		
		for(String id:roleIds){
			menuIds.addAll(dao.find("select menuId from SyRoleMenu where roleId=? ",id));
		}
		List<SyMenu> myMenus=new ArrayList<SyMenu>();
		
		for(SyMenu m:allMenus){
			
			if(menuIds.contains(m.getId())){
				myMenus.add(m);
			}
		}
		
		//用户可以访问的url集合
		Set<String> urls=new HashSet<String>();
		//获取操作url
		for(String id:roleIds){
			List<SyAction> acts=dao.find("select a from SyAction a,SyRoleAction ra where a.id=ra.actionId and ra.roleId=? ",id);
			for(SyAction a:acts){
				String url=a.getActionUrl();
				if(StringUtils.isNotBlank(url)){
					urls.addAll(Arrays.asList(url.split(",")));
				}
			}
		}
		//将用户有权限访问的菜单的url放入 urls
		for(SyMenu m:myMenus){
			String url=m.getMenuUrl();
			if(StringUtils.isNotBlank(url)){
				urls.add(url.split("\\?")[0]);
			}
		}
		me.setUrls(urls);
		
	
		
		
		return	myMenus;
		
	}
	
}
