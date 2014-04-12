/**  
 * @Project: jxoa
 * @Title: DeptAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-4-2 下午4:11:32
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
import com.jxoa.manager.system.bean.SyDept;
import com.jxoa.manager.system.service.IDeptService;

/**
 * 
 * 类名：DeptAction
 * 功能：系统管理--组织机构--部门管理
 * 详细：部门的增删改查     
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-2 下午4:11:32
 *
 */
@Controller
@RequestMapping("/dept")
public class DeptAction extends BaseAction{
	
	@Autowired
	private IDeptService service; 
	
	/**
	 * 跳转到部门加载页面,查询出所有部门
	 * @return
	 */
	@RequestMapping("load")
	public String load(ModelMap map){
		
		
		return "system/organize/dept/load";
	
	}
	/**
	 * 查询所有部门，返回json格式数据
	 * @return
	 */
	@RequestMapping("load/all")
	public ModelAndView alldept(){
		
		
		return ajaxJson(service.selectAllDepts());
		
	}
	
	/**
	 * 跳转到部门添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		
		return "system/organize/dept/add";
	
	}
	/**
	 * 部门查询，查找带回
	 * @param param
	 * @param dept
	 * @param type 1:单选，2：多选，3：上级部门查询
	 * @param map
	 * @return
	 */
	@RequestMapping("lookUpPage")
	public String lookUpPage(FormParam param,Integer type,ModelMap map){
		
		
		map.addAttribute("fromParam",param);
		if(type!=null){
			if(type==2){
				return "system/organize/dept/lookup_more";
			}else{
				return "system/organize/dept/lookup";
			}
		}else{
			
			return "system/organize/dept/lookup";
		}
	}
	/**
	 * 部门查询，查找带回
	 * @param param
	 * @param dept
	 * @param type 1:单选，2：多选，3：上级部门查询
	 * @param map
	 * @return
	 */
	@RequestMapping("lookUp")
	public String lookUp(FormParam param,SyDept dept,Integer type,ModelMap map){
		
		if(type!=null){
			if(type==2){
				//多选
				map.addAttribute("depts",service.selectDepts(param, dept));
				param.setAllCount(service.selectDeptsCount(dept));
				map.addAttribute("fromParam",param);
				return "system/organize/dept/lookup_more_query";
			}else{
				//单选
				map.addAttribute("depts",service.selectDepts(param, dept));
				param.setAllCount(service.selectDeptsCount(dept));
				map.addAttribute("fromParam",param);
				return "system/organize/dept/lookup_query";
			}
		}else{
			//默认单选
			map.addAttribute("depts",service.selectDepts(param, dept));
			param.setAllCount(service.selectDeptsCount(dept));
			map.addAttribute("fromParam",param);
			return "system/organize/dept/lookup_query";
		}
	}
	/**
	 * 添加部门
	 * @param dept
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid SyDept dept,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		
		return ajaxDone(service.addDept(dept));
		
	}
	/**
	 * 部门修改页面 
	 * @param id
	 * @param mav
	 * @return
	 */
	
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		SyDept dept=service.get(SyDept.class,id);
		if(dept==null){
			return NODATA;
		}
		map.addAttribute("dept",dept);
		
		return "system/organize/dept/update";
	}
	
	/**
	 * 修改部门
	 * @param dept
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid SyDept dept,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.updateDept(dept));
	}
	/**
	 * 删除部门
	 * @param id
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String id){
		
		return ajaxDone(service.deleteDept(id));
	
	}
	
	
}
