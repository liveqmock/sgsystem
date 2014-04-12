/**  
 * @Project: jxoa
 * @Title: MyCache.java
 * @Package com.jxoa.commons.cache
 * @date 2013-4-7 上午11:37:58
 * @Copyright: 2013 
 */
package com.jxoa.commons.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.system.bean.ListValues;
import com.jxoa.manager.system.bean.SyDept;
import com.jxoa.manager.system.bean.SyRole;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.system.service.IDeptService;
import com.jxoa.manager.system.service.IListValuesService;
import com.jxoa.manager.system.service.IRoleService;
import com.jxoa.manager.system.service.IUserService;

/**
 * 
 * 类名：MyCache
 * 功能：自定义全局缓存
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-7 上午11:37:58
 *
 */

public class MyCache {
	
	@Autowired
	private IDeptService deptService; 
	
	@Autowired
	private IRoleService roleService; 
	
	@Autowired
	private IUserService userService; 
	
	@Autowired
	private IListValuesService listService; 
	
	/**
	 * 部门id-->名称键值对
	 */
	public static final String DEPTID2NAME="deptId2Name";
	
	/**
	 * 部门id-->名称键值对
	 */
	public static final String ROLE2NAME="roleId2Name";
	
	/**
	 * 用户id-->账号
	 */
	public static final String USERID2NAME="userId2Name";
	/**
	 * 用户id-->真实姓名
	 */
	public static final String USERID2TRUENAME="userId2TrueName";
	/**
	 * 字典值id-->字典值
	 */
	public static final String LISTID2NAME="listId2Name";
	/**
	 * 字典值类型 type-->类型
	 */
	public static final String TYPE2LISTVALUES="type2ListValues";
	
	//私有的默认构造子
	private MyCache(){} 
	
	//获取spring创建的bean对象
    public synchronized static MyCache getInstance() {
    	
    	return  ServletUtil.getApplicationContext().getBean(MyCache.class);
       
    }
	
	/**
	 * 容器初始化时 加载缓存
	 * @throws Exception
	 */
    
	public void load()throws Exception{
    	System.out.println("初始化自定义缓存");
    	
		//初始化用户，部门，角色,id-->name 键值对
    	initDeptId2Name();
    	initRoleId2Name();
    	initUserId2Name();
    	initListValues();
		
	}
	/**
	 * 初始化部门缓存
	 */
	private void initDeptId2Name() {
	
		//查询出所有部门
		List<SyDept>depts=deptService.selectAllDepts();
		// deptId-->deptName
		Map<String,String> deptId2Name=new HashMap<String,String>();
		for(SyDept d:depts){
			deptId2Name.put(d.getId(), d.getDeptName());
		}
		ServletUtil.setServletContextAttribute(MyCache.DEPTID2NAME, deptId2Name);
		
	}
	/**
	 * 初始化角色缓存
	 */
	
	private void initRoleId2Name() {
	
		//查询出所有角色
		List<SyRole>roles=roleService.selectAllRoles();
		// deptId-->deptName
		Map<String,String> roleId2Name=new HashMap<String,String>();
		for(SyRole r:roles){
			roleId2Name.put(r.getId(), r.getRoleName());
		}
		ServletUtil.setServletContextAttribute(MyCache.ROLE2NAME, roleId2Name);
		
	}
	
	/**
	 * 初始化用户缓存
	 */
	private void initUserId2Name(){
		//查询出所有用户
		List<SyUsers>users=userService.selectAllUsers();
		// userId-->deptName
		Map<String,String> userId2Name=new HashMap<String,String>();
		// userId-->deptName
		Map<String,String> userId2TrueName=new HashMap<String,String>();
		
		for(SyUsers u:users){
			userId2Name.put(u.getId(), u.getUserName());
			userId2TrueName.put(u.getId(), u.getTrueName());
		}
		ServletUtil.setServletContextAttribute(MyCache.USERID2NAME, userId2Name);
		ServletUtil.setServletContextAttribute(MyCache.USERID2TRUENAME, userId2TrueName);
		
	}
	/**
	 * 初始化字典值缓存
	 */
	private void initListValues(){
		//查询出所有字典值
		
		List<ListValues> listValues=listService.selectAllListValues();
		
		// 字典值 id-->Name
		Map<String,String> listId2Name=new HashMap<String,String>();
		
		//字典值 type-->listValues
		
		Map<String,List<Map<String,String>>> type2ListValues=new HashMap<String,List<Map<String,String>>>();
		
		for(ListValues v:listValues){
			
			listId2Name.put(v.getId(), v.getListValue());
			
			List<Map<String,String>> list=type2ListValues.get("type_"+v.getListType());
			
			Map<String,String> m=new HashMap<String,String>();
			m.put("value", v.getId());
			m.put("name", v.getListValue());
			
			if(list==null){
				list=new ArrayList<Map<String,String>>();
				list.add(m);
				type2ListValues.put("type_"+v.getListType(), list);
			}else{
				list.add(m);
			}
		}
		ServletUtil.setServletContextAttribute(MyCache.LISTID2NAME, listId2Name);
		ServletUtil.setServletContextAttribute(MyCache.TYPE2LISTVALUES, type2ListValues);
		
	}
	
	/**
	 * 更新键值对缓存
	 * @param mapName
	 * @param key
	 * @param value
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public synchronized void updateCacheMap(String mapName,String key,String value){
		
		Map map= (Map)ServletUtil.getServletContextAttribute(mapName);
		if(map==null){
			if(DEPTID2NAME.equals(mapName)){
				initDeptId2Name();
			}else if(USERID2NAME.equals(mapName)||USERID2TRUENAME.equals(mapName)){
				initUserId2Name();
			}else if (LISTID2NAME.equals(mapName)||TYPE2LISTVALUES.equals(mapName)) {
				initListValues();
			}
			map= (Map)ServletUtil.getServletContextAttribute(mapName);
		}
		
		map.put(key, value);
		
	}
	/**
	 * 删除键值对缓存
	 * @param mapName
	 * @param key
	 */
	@SuppressWarnings("rawtypes")
	public synchronized void removeCacheMap(String mapName,String key){
		
		Map map= (Map)ServletUtil.getServletContextAttribute(mapName);
		if(map==null){
			if(DEPTID2NAME.equals(mapName)){
				initDeptId2Name();
			}else if(USERID2NAME.equals(mapName)||USERID2TRUENAME.equals(mapName)){
				initUserId2Name();
			}else if (LISTID2NAME.equals(mapName)||TYPE2LISTVALUES.equals(mapName)) {
				initListValues();
			}
			map= (Map)ServletUtil.getServletContextAttribute(mapName);
		}
		
		map.remove(key);
		
	}
	
	/**
	 * 根据用户id，获取用户名
	 * @param ids 用户id,多个用户id以,隔开
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getUserName(String ids){
		if(StringUtils.isBlank(ids)){
			return "";
		}
		Map<String,String> m=(Map<String,String>)ServletUtil.getServletContextAttribute(MyCache.USERID2NAME);
		if(m==null){
			initUserId2Name();
			m=(Map<String,String>)ServletUtil.getServletContextAttribute(MyCache.USERID2NAME);
		}
		String[] sz_ids=ids.split(",");
		StringBuffer names=new StringBuffer();
		for(String id:sz_ids){
			 String name=m.get(id);
			 if(name!=null){
				 names.append(m.get(id)+",");
			 }
		}
		if("".equals(names.toString()))return "";
		return names.substring(0,names.lastIndexOf(","));
	}
	/**
	 * 根据用户id，获取用户姓名
	 * @param ids  用户id,多个用户id以,隔开
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getTrueName(String ids){
		if(StringUtils.isBlank(ids)){
			return "";
		}
		Map<String,String>m=(Map<String,String>)ServletUtil.getServletContextAttribute(MyCache.USERID2TRUENAME);
		if(m==null){
			initUserId2Name();
			m=(Map<String,String>)ServletUtil.getServletContextAttribute(MyCache.USERID2TRUENAME);
		}
		String[] sz_ids=ids.split(",");
		StringBuffer names=new StringBuffer();
		for(String id:sz_ids){
			 String name=m.get(id);
			 if(name!=null){
				 names.append(m.get(id)+",");
			 }
		}
		
		if("".equals(names.toString()))return "";
		return names.substring(0,names.lastIndexOf(","));
	}
	/**
	 * 根据部门id，获取部门名称
	 * @param ids  用户id,多个用户id以,隔开
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getDeptName(String ids){
		if(StringUtils.isBlank(ids)){
			return "";
		}
		Map<String,String>m=(Map<String,String>)ServletUtil.getServletContextAttribute(MyCache.DEPTID2NAME);
		if(m==null){
			initDeptId2Name();
			m=(Map<String,String>)ServletUtil.getServletContextAttribute(MyCache.DEPTID2NAME);
		}
		String[] sz_ids=ids.split(",");
		StringBuffer names=new StringBuffer();
		for(String id:sz_ids){
			 String name=m.get(id);
			 if(name!=null){
				 names.append(m.get(id)+",");
			 }
		}
		if("".equals(names.toString()))return "";
		return names.substring(0,names.lastIndexOf(","));
	}
	/**
	 * 根据角色id，获取角色名称
	 * @param ids	角色id,多个角色id以,隔开
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getRoleName(String ids){
		if(StringUtils.isBlank(ids)){
			return "";
		}
		Map<String,String>m=(Map<String,String>)ServletUtil.getServletContextAttribute(MyCache.ROLE2NAME);
		if(m==null){
			initRoleId2Name();
			m=(Map<String,String>)ServletUtil.getServletContextAttribute(MyCache.ROLE2NAME);
		}
		String[] sz_ids=ids.split(",");
		StringBuffer names=new StringBuffer();
		for(String id:sz_ids){
			 String name=m.get(id);
			 if(name!=null){
				 names.append(m.get(id)+",");
			 }
		}
		if("".equals(names.toString()))return "";
		return names.substring(0,names.lastIndexOf(","));
	}
	/**
	 * 根据字典值id，获取字典值
	 * @param type
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getSelectValue(String id){
		if(StringUtils.isBlank(id)){
			return "";
		}
		Map<String,String>m=(Map<String,String>)ServletUtil.getServletContextAttribute(MyCache.LISTID2NAME);
		if(m==null){
			initListValues();
			m=(Map<String,String>)ServletUtil.getServletContextAttribute(MyCache.LISTID2NAME);
		}
		String name=m.get(id);
		return name==null?"":name;
	}
	/**
	 * 根据类型获取对应的数据字典集合
	 * @param type
	 * @return
	 */
	public List<Map<String,String>> getListValues(String type){
		Map<String,List<Map<String,String>>> map=(Map<String,List<Map<String,String>>>)ServletUtil.getServletContextAttribute(MyCache.TYPE2LISTVALUES);
		if(map==null){
			initListValues();
			map=(Map<String,List<Map<String,String>>>)ServletUtil.getServletContextAttribute(MyCache.TYPE2LISTVALUES);
		}
		if(map==null)return null;
		return (List<Map<String,String>>)map.get(type);
	}
	
	
	
	
	

}
