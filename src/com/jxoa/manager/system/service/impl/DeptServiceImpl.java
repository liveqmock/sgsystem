/**  
 * @Project: jxoa
 * @Title: DeptServiceImpl.java
 * @Package com.jxoa.manager.system.service.impl
 * @date 2013-4-3 下午5:11:01
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.cache.MyCache;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.system.bean.SyDept;
import com.jxoa.manager.system.service.IDeptService;

/**
 * 
 * 类名：DeptServiceImpl
 * 功能：部门管理 业务操作
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-3 下午5:11:01
 *
 */
@Service
public class DeptServiceImpl extends BaseServiceImpl implements IDeptService{
	
	public String addDept(SyDept d){
		Object obj=dao.findOne("from SyDept where deptName=? and superId=?",d.getDeptName(),d.getSuperId());
		if(obj==null){
			String id=(String)dao.saveReturnId(d);
			if(StringUtils.isNotBlank(id)){
				
				saveLog("添加部门", "部门名称:"+d.getDeptName());
				
				//更新部门id-->name  缓存
				MyCache.getInstance().updateCacheMap(MyCache.DEPTID2NAME, id, d.getDeptName());
				
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.deptname.unique";//部门名称已被占用
		}
		
	}
	
	/**
	 * 查询出所有部门
	 */
	@SuppressWarnings("unchecked")
	public List<SyDept> selectAllDepts(){
		
		return dao.find("from SyDept  order by deptSort asc");
	}
	
	/**
	 * 部门缓存更新
	 */
	/*@SuppressWarnings("unchecked")
	public void deptCacheUpdate(){
		List<SyDept> depts=(List<SyDept>)dao.find("from SyDept where superId=0 order by deptSort asc");//查询出所有顶级节点
		if(!depts.isEmpty()){
			queryChildDepts(depts);
		}
		MyCache.cacheMap.put("depts",depts);
	}*/
	/**
	 * 递归查询子节点 
	 * @param superMap
	 * @param depts
	 */
	/*@SuppressWarnings("unchecked")
	private void queryChildDepts(List<SyDept> depts){
		
		for(SyDept d:depts){
			List<SyDept> zdepts=(List<SyDept>)dao.find("from SyDept where superId=? order by deptSort asc",d.getId());
			if(!zdepts.isEmpty()){
				d.setDepts(zdepts);
				queryChildDepts(zdepts);	
			}
		}
	}*/
	
	public String updateDept(SyDept d){
		
		Object obj=dao.findOne("from SyDept where deptName=? and superId=? and id!=?",d.getDeptName(),d.getSuperId(),d.getId());
		if(obj==null){
			
			if(dao.update(d)){
				saveLog("修改部门", "部门名称："+d.getDeptName());
				//更新部门缓存
				MyCache.getInstance().updateCacheMap(MyCache.DEPTID2NAME, d.getId(), d.getDeptName());
				
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.deptname.unique";//菜单名已被占用
		}
	}
	
	public String deleteDept(String id){
		
		Object o=dao.findOne("from SyDept where superId=? ",id);
		if(o!=null){
			return "msg.dept.haschild";//部门下属还有子部门，无法删除
		}else{
			Object userObj=dao.findOne("from SyUsers where deptId=?",id);
			if(userObj!=null){
				return "msg.dept.hasuser";//有用户属于此部门，无法删除
			}
			SyDept dept=dao.get(SyDept.class, id);
			if(dept!=null){
				if(dao.delete(dept)){
					saveLog("删除部门", "部门名称："+dept.getDeptName());
					//更新部门缓存
					MyCache.getInstance().removeCacheMap(MyCache.DEPTID2NAME, id);
					
					return MsgConfig.MSG_KEY_SUCCESS;
				}else{
					return MsgConfig.MSG_KEY_FAIL;
				}
			}else{
				return MsgConfig.MSG_KEY_NODATA;
			}
		}
		
	}
	

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectDepts(FormParam param,SyDept dept){
	
		StringBuffer sb=new StringBuffer("from SyDept d where 1=1 ");
		List list=new ArrayList();
		if(StringUtils.isNotBlank(dept.getDeptName())){
			sb.append(" and d.deptName like ? ");
			list.add("%"+dept.getDeptName()+"%");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectDeptsCount(SyDept dept){
		
		StringBuffer sb=new StringBuffer("select count(*)from SyDept d where 1=1 ");
		List list=new ArrayList();
		if(StringUtils.isNotBlank(dept.getDeptName())){
			sb.append(" and d.deptName like ? ");
			list.add("%"+dept.getDeptName()+"%");
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
}
