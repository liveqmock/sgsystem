/**  
 * @Project: jxoa
 * @Title: RoleAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-4-28 下午2:56:28
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.action;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.system.bean.SyRole;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.system.service.IRoleService;

/**
 * 
 * 类名：RoleAction
 * 功能：系统管理--角色管理
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-28 下午2:56:28
 *
 */
@Controller
@RequestMapping("/role")
public class RoleAction extends BaseAction{
	
	@Autowired
	private IRoleService service; 
	
	
	/**
	 * 条件查询角色
	 * @param param
	 * @param role
	 * @param map
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param,SyRole role,ModelMap map){
		
		map.addAttribute("roles",service.selectRoles(param, role));
		param.setAllCount(service.selectRolesCount(role));
		map.addAttribute("fromParam",param);
		return "system/organize/role/load";
	
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		
		return "system/organize/role/add";
	
	}
	/**
	 * 添加角色
	 * @param role
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid SyRole role,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.addRole(role));
		
	}
	/**
	 * 跳转到角色修改页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		SyRole role=service.get(SyRole.class, id);
		if(role==null){
			return NODATA;
		}
		map.addAttribute("r",role);
		
		return "system/organize/role/update";
	}
	/**
	 * 修改角色
	 * @param role
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid SyRole role,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.updateRole(role));
		
	}
	/**
	 * 删除角色
	 * @param ids
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(service.deleteRoles(ids));
	
	}
	
	/**
	 * 跳转到 角色--修改权限页面 ，并 查询出所有的权限，和已有的权限
	 * @param param
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("power/updatePage")
	public String powerPage(String id,ModelMap map){
		
		map.addAttribute("p",JSON.toJSONString(service.selectPowers(id)));
		
		return "system/organize/role/power/update";
	
	}
	/**
	 * 修改角色权限
	 * @param roleId	角色id
	 * @param addMenuIds	需要添加的菜单id，多个用，隔开
	 * @param delMenuIds	需要删除的菜单id，多个用，隔开
	 * @param addActionIds	需要添加的操作id，多个用，隔开
	 * @param delActionIds	需要删除的操作id，多个用，隔开
	 * @return
	 */
	@RequestMapping("power/update")
	public ModelAndView updatePowers(String roleId,String addMenuIds,String delMenuIds,String addActionIds,String delActionIds){
		
		return ajaxDone(service.updatePowers(roleId, addMenuIds, delMenuIds, addActionIds, delActionIds));
		
	}
	/**
	 * 条件查询 用户，用于角色分配
	 * @param param
	 * @param role
	 * @param map
	 * @return
	 */
	@RequestMapping("queryUsers")
	public String queryUsers(FormParam param,String roleId,SyUsers user,ModelMap map){
		
		map.addAttribute("users",service.selectUsers(param, roleId, user));
		param.setAllCount(service.selectUsersCount(user));
		map.addAttribute("fromParam",param);
		
		return "system/organize/role/select_users";
	
	}
	/**
	 * 为角色批量分配用户
	 * @param roleId
	 * @param ids
	 * @return
	 */
	@RequestMapping("roleAddUsers")
	public ModelAndView roleAddusers(String roleId,String[] ids){
		
	
		return ajaxDone(service.addUserRole(roleId, ids));
		
	}
	
	/**
	 * 分配管理，条件查询 已具有此角色的用户，
	 * @param param
	 * @param role
	 * @param map
	 * @return
	 */
	@RequestMapping("queryRoleUsers")
	public String queryRoleUsers(FormParam param,String roleId,SyUsers user,ModelMap map){
	
		map.addAttribute("users",service.selectRoleUsers(param, roleId, user));
		param.setAllCount(service.selectRoleUsersCount(roleId, user));
		map.addAttribute("fromParam",param);
		
		return "system/organize/role/select_role_users";
	
	}
	/**
	 * 批量删除角色已分配的用户
	 * @param ids
	 * @return
	 */
	@RequestMapping("delRoleUsers")
	public ModelAndView delRoleUsers(String[] ids){
		
		return ajaxDone(service.delUserRole( ids));
		
	}
	/**
	 * 角色查询，查找带回
	 * @param param
	 * @param role
	 * @param type 1:单选，2：多选，3：上级部门查询
	 * @param map
	 * @return
	 */
	@RequestMapping("lookUpPage")
	public String lookUpPage(FormParam param,SyRole role,Integer type,ModelMap map){
		
		map.addAttribute("roles",service.selectRoles(param, role));
		param.setAllCount(service.selectRolesCount(role));
		map.addAttribute("fromParam",param);
		if(type!=null){
			if(type==2){
				//多选
			
				return "system/organize/role/lookup_more";
			}else {
				//单选
				
				return "system/organize/role/lookup";
			}
		}else{
			//默认单选
			return "system/organize/role/lookup";
		}
	}

	
	
}
