/**  
 * @Project: jxoa
 * @Title: MenuServiceImpl.java
 * @Package com.jxoa.manager.system.service.impl
 * @date 2013-4-24 上午8:41:50
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.BaseConfig;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.system.bean.SyAction;
import com.jxoa.manager.system.bean.SyMenu;
import com.jxoa.manager.system.service.IMenuService;

/**
 * 
 * 类名：MenuServiceImpl
 * 功能：菜单管理 业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-24 上午8:41:50
 *
 */
@Service
public class MenuServiceImpl extends BaseServiceImpl implements IMenuService{
	
	
	@SuppressWarnings("unchecked")
	public List<SyMenu> selectMenus(){
		if(ServletUtil.isDeveloper()){
			return dao.find("from SyMenu order by menuSort asc");
		}else{
			return dao.find("from SyMenu where menuStatus=1 order by menuSort asc");
		}
	}
	
	public String[] selectMenusIcons(){
		
		File node=new File(BaseConfig.webPath+"/resource/images/menu/");
		String[] names=node.list();
		for(int i=0,k=names.length; i<k;i++){
			names[i]="resource/images/menu/"+names[i];
		}
		return names;
	}
	
	public String addMenu(SyMenu m){
		Object obj=dao.findOne("from SyMenu where menuName=? and menuSuperId=?",m.getMenuName(),m.getMenuSuperId());
		if(obj==null){
			if(dao.save(m)){
				saveLog("添加菜单", "菜单名:"+m.getMenuName());
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.menuname.unique";//菜单名已被占用
		}
		
	}
	
	public String updateMenu(SyMenu m){
		
		Object obj=dao.findOne("from SyMenu where menuName=? and menuSuperId=? and id!=?",m.getMenuName(),m.getMenuSuperId(),m.getId());
		if(obj==null){
			
			if((Boolean)ServletUtil.getSession().getAttribute("dev")){
				
				//开发人员可修改全部字段
				if(dao.update(m)){
					saveLog("修改菜单", "菜单名:"+m.getMenuName());
					return MsgConfig.MSG_KEY_SUCCESS;
				}else{
					return MsgConfig.MSG_KEY_FAIL;
				}
			}else{
				//非开发人员只可修改部分字段
				
				SyMenu old=dao.get(SyMenu.class, m.getId());
				old.setMenuIcon(m.getMenuIcon());
				old.setMenuName(m.getMenuName());
				old.setMenuOpen(m.getMenuOpen());
				old.setMenuSort(m.getMenuSort());
				old.setMenuSuperId(m.getMenuSuperId());
				
				return MsgConfig.MSG_KEY_SUCCESS;
			}
			
			
		}else{
			return "msg.menuname.unique";//菜单名已被占用
		}
	}
	public String deleteMenu(String id){
		
		Object o=dao.findOne("from SyMenu where menuSuperId=? ",id);
		if(o!=null){
			return "msg.menu.haschild";//菜单下属还有子菜单，无法删除
		}else{
			SyMenu menu=dao.get(SyMenu.class, id);
			if(menu!=null){
				if(dao.delete(menu)){
					saveLog("删除菜单", "菜单名称："+menu.getMenuName());
					return MsgConfig.MSG_KEY_SUCCESS;
				}else{
					return MsgConfig.MSG_KEY_FAIL;
				}
			}else{
				return MsgConfig.MSG_KEY_NODATA;
			}
		}
		
	}
	
	@SuppressWarnings("rawtypes")
	public Map findMenuById(String id){
		return (Map)dao.findOne("select new Map(m as m,(select menuName from SyMenu where id=m.menuSuperId)as superName)from SyMenu m where m.id=?",id);
		
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectActions(FormParam param,SyAction action){
	
		StringBuffer sb=new StringBuffer("from SyAction a where 1=1 ");
		List list=new ArrayList();
		if(StringUtils.isNotBlank(action.getActionName())){
			sb.append(" and a.actionName like ? ");
			list.add("%"+action.getActionName()+"%");
		}
		if(StringUtils.isNotBlank(action.getActionUrl())){
			sb.append(" and a.actionUrl like ? ");
			list.add("%"+action.getActionUrl()+"%");	
		}
		if(StringUtils.isNotBlank(action.getMenuId())){
			sb.append(" and a.menuId = ? ");
			list.add(action.getMenuId());	
		}
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			sb.append(" order by a."+param.getOrderField()+" "+param.getOrderDirection());
		}else{
			sb.append(" order by a.actionSort");
		}
		
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
		
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectActionCount(SyAction action){
		
		StringBuffer sb=new StringBuffer("select count(*)from SyAction a where 1=1 ");
		List list=new ArrayList();
		if(StringUtils.isNotBlank(action.getActionName())){
			sb.append(" and a.actionName like ? ");
			list.add("%"+action.getActionName()+"%");
		}
		if(StringUtils.isNotBlank(action.getActionUrl())){
			sb.append(" and a.actionUrl like ? ");
			list.add("%"+action.getActionUrl()+"%");	
		}
		if(StringUtils.isNotBlank(action.getMenuId())){
			sb.append(" and a.menuId = ? ");
			list.add(action.getMenuId());	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	public boolean deleteActions(String[] ids){
		
		for(String id:ids){
			dao.delete("delete SyAction where id=?", id);
		}
		return true;
	}
	
	
}
