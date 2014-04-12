/**  
 * @Project: jxoa
 * @Title: MenuAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-4-24 上午8:41:21
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.action;

import java.io.UnsupportedEncodingException;

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
import com.jxoa.manager.system.bean.SyAction;
import com.jxoa.manager.system.bean.SyMenu;
import com.jxoa.manager.system.service.IMenuService;

/**
 * 
 * 类名：MenuAction
 * 功能：系统管理--菜单管理
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-24 上午8:41:21
 *
 */
@Controller
@RequestMapping("/menu")
public class MenuAction extends BaseAction{
	
	@Autowired
	private IMenuService service; 
	
	/**
	 * 跳转到菜单管理页面 查询出所有菜单
	 * @param map
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param,ModelMap map){
		
		map.addAttribute("menus",JSON.toJSONString(service.selectMenus()));
		
		map.addAttribute("fromParam",param);
		
		return "system/menu/load";
	
	}
	/**
	 * 跳转到菜单添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		
		return "system/menu/add";
	
	}
	/**
	 * 添加菜单
	 * @param menu
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid SyMenu menu,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.addMenu(menu));
		
	}
	/**
	 * 查询出所有可用菜单图标
	 * @return
	 */
	@RequestMapping("icons")
	public String showMenuIcons(ModelMap map){
		
		map.addAttribute("icons",service.selectMenusIcons());
		
		return "system/menu/icon_lookup";
	}
	/**
	 * 菜单查找带回
	 * @return
	 */
	@RequestMapping("lookUpPage")
	public String lookUp(ModelMap map){
		
		map.addAttribute("menus",JSON.toJSONString(service.selectMenus()));
		
		return "system/menu/lookup";
	}
	/**
	 * 菜单修改页面
	 * @param id
	 * @param map
	 * @return
	 */
	
	@SuppressWarnings("unchecked")
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		map.addAllAttributes(service.findMenuById(id));
		if(map.get("m")==null){
			return NODATA;
		}
		return "system/menu/update";
	}
	
	/**
	 * 修改菜单
	 * @param menu
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid SyMenu menu,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		
		return ajaxDone(service.updateMenu(menu));
		
	}
	/**
	 * 删除菜单
	 * @param id
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String id){
		
		return ajaxDone(service.deleteMenu(id));
	
	}
	/**
	 * action条件查询
	 * @param param
	 * @param action
	 * @param map
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("action/query")
	public String selectActions(FormParam param,SyAction action,ModelMap map) {
		
		map.addAttribute("actions",service.selectActions(param, action));
		param.setAllCount(service.selectActionCount(action));
		map.addAttribute("fromParam",param);
		
		return "system/menu/action/query";
	}
	/**
	 * 跳转到action添加页面
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("action/addPage")
	public String addActionPage() {
		
		return "system/menu/action/add";
	
	}
	/**
	 * 添加action
	 * @param action
	 * @param errors
	 * @return
	 */
	@RequestMapping("action/add")
	public ModelAndView addAction(@Valid SyAction action,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.save(action));
		
	}

	/**
	 * 跳转到action编辑页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("action/updatePage")
	public String editAction(String id,ModelMap map){
		SyAction a=service.get(SyAction.class,id);
		if(a==null){
			return NODATA;
		}
		map.addAttribute("act",a);
		
		return "system/menu/action/update";
	}
	/**
	 * 更新action
	 * @param action
	 * @param errors
	 * @return
	 */
	@RequestMapping("action/update")
	public ModelAndView updateAction(@Valid SyAction action,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.update(action));
		
	}
	/**
	 * 删除action
	 * @param id
	 * @return
	 */
	@RequestMapping("action/del")
	public ModelAndView deleteActions(String[] ids){
		
		return ajaxDone(service.deleteActions(ids));
	
	}
	
	
}
