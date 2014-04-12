/**  
 * @Project: jxoa
 * @Title: ListValuesAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-4-15 下午2:32:55
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

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.system.bean.ListValues;
import com.jxoa.manager.system.service.IListValuesService;

/**
 * 
 * 类名：ListValuesAction
 * 功能：系统管理--字典值管理
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-15 下午2:32:55
 *
 */
@Controller
@RequestMapping("/list")
public class ListValuesAction extends BaseAction{
	
	@Autowired
	private IListValuesService service; 
	
	/**
	 * 字典值条件分页查询
	 * @param param
	 * @param lv
	 * @param map
	 * @return
	 */
	@RequestMapping("load")
	public String load(){
		
		return "system/list_values/load";
	
	}
	/**
	 * 字典值条件分页查询
	 * @param param
	 * @param lv
	 * @param map
	 * @return
	 */
	@RequestMapping("query")
	public String query(FormParam param,ListValues lv,ModelMap map){
		
		map.addAttribute("values",service.selectListValues(param, lv));
		param.setAllCount(service.selectListValuesCount(lv));
		map.addAttribute("fromParam",param);
		
		return "system/list_values/query";
	
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		
		return "system/list_values/add";
	
	}
	/**
	 * 添加字典值
	 * @param lv
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid ListValues lv,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.addListValues(lv));
		
	}
	/**
	 * 跳转到字典值编辑页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		ListValues lv=service.get(ListValues.class, id);
		if(lv==null){
			return NODATA;
		}
		map.addAttribute("lv",lv);
		
		return "system/list_values/update";
	}
	/**
	 * 修改字典值
	 * @param lv
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid ListValues lv,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.updateListValues(lv));
		
	}
	/**
	 * 删除字典值
	 * @param ids
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(service.deleteListValues(ids));
	
	}
	
	
	/**
	 * select列表显示字典值，根据字典值类型查询
	 * @param type	字典值类型
	 * @return
	 */
	@RequestMapping("showSelectList")
	public ModelAndView showSelectList(Short type){
		
		return ajaxJson(service.selectListByType(type));
	}
	
	
	
	
}
