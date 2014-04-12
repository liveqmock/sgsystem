/**  
 * @Project: jxoa
 * @Title: AfficheAction.java
 * @Package com.jxoa.manager.common_platform.action
 * @date 2013-5-31 上午9:58:28
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.action;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.common_platform.bean.XtAffiche;
import com.jxoa.manager.common_platform.bean.XtAfficheDept;
import com.jxoa.manager.common_platform.service.IAfficheService;

/**
 * 
 * 类名：AfficheAction
 * 功能：公共平台--公告管理
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-31 上午9:58:28
 *
 */
@Controller
@RequestMapping("/affiche")
public class AfficheAction extends BaseAction{

	@Autowired
	private IAfficheService service;
	
	
	/**
	 * 系统公告管理
	 * @param param
	 * @param a
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param,XtAffiche a,Date startDate,Date endDate,ModelMap map){
		
		map.addAttribute("as",service.selectAffiche(param, a, startDate, endDate));
		param.setAllCount(service.selectAfficheCount(a, startDate, endDate));
		map.addAttribute("fromParam",param);
		return "common_platform/affiche/load";
	}
	/**
	 * 系统公告查看
	 * @param param
	 * @param a
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("load/my")
	public String loadmy(FormParam param,XtAffiche a,Date startDate,Date endDate,ModelMap map){
		
		map.addAttribute("as",service.selectAffiche(param, a, startDate, endDate));
		param.setAllCount(service.selectAfficheCount(a, startDate, endDate));
		map.addAttribute("fromParam",param);
		return "common_platform/affiche/load_my";
	}
	/**
	 * 跳转到系统公告添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		
		return "common_platform/affiche/add";
	}
	/**
	 * 添加系统公告
	 * @param a
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid XtAffiche a, Errors errors){
		if (errors.hasErrors()) {

			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		if(a.getIsTop()==null||a.getIsTop()!=1){
			a.setIsTop((short)0);
		}
		a.setCreateTime(DateUtil.currentTimestamp());
		a.setUserId(ServletUtil.getMember().getId());
		return ajaxDone(service.save(a));
		
	}
	/**
	 * 查看单个系统公告
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("show")
	public String show(String id,ModelMap map){
		XtAffiche xa=service.get(XtAffiche.class, id);
		
		System.out.println("系统公告："+id);
		if(xa==null){
			return NODATA;
		}
		
		map.addAttribute("xa",xa);
		return "common_platform/affiche/show";
		
		
	}
	/**
	 * 跳转到系统公告更新页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		
		XtAffiche xa=service.get(XtAffiche.class, id);
		if(xa==null){
			return NODATA;
		}
		
		map.addAttribute("xa",xa);
		return "common_platform/affiche/update";
		
		
	}
	/**
	 * 修改系统公告
	 * @param a
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid XtAffiche xa,Errors errors){
		
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		
		return ajaxDone(service.updateAffiche(xa));
		
	}
	/**
	 * 删除系统公告
	 * @param ids
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(service.deleteAffiche(ids));
		
	}
	
	
	
	
	/**
	 * 部门公告管理
	 * @param param
	 * @param a
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("dept/load")
	public String loadXtAfficheDept(FormParam param,XtAfficheDept a,Date startDate,Date endDate,ModelMap map){
		
		map.addAttribute("as",service.selectAfficheDept(param, a, startDate, endDate));
		param.setAllCount(service.selectAfficheDeptCount(a, startDate, endDate));
		map.addAttribute("fromParam",param);
		return "common_platform/affiche/dept/load";
	}
	/**
	 * 部门公告查看
	 * @param param
	 * @param a
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("dept/load/my")
	public String loadmyXtAfficheDept(FormParam param,XtAfficheDept a,Date startDate,Date endDate,ModelMap map){
		a.setDeptId(ServletUtil.getMember().getDeptId());
		map.addAttribute("as",service.selectAfficheDept(param, a, startDate, endDate));
		param.setAllCount(service.selectAfficheDeptCount(a, startDate, endDate));
		map.addAttribute("fromParam",param);
		return "common_platform/affiche/dept/load_my";
	}
	/**
	 * 跳转到部门公告添加页面
	 * @return
	 */
	@RequestMapping("dept/addPage")
	public String addPageXtAfficheDept(){
		
		return "common_platform/affiche/dept/add";
	}
	/**
	 * 添加部门公告
	 * @param a
	 * @param errors
	 * @return
	 */
	@RequestMapping("dept/add")
	public ModelAndView addXtAfficheDept(@Valid XtAfficheDept a, Errors errors){
		if (errors.hasErrors()) {

			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		if(a.getIsTop()==null||a.getIsTop()!=1){
			a.setIsTop((short)0);
		}
		a.setCreateTime(DateUtil.currentTimestamp());
		a.setUserId(ServletUtil.getMember().getId());
		return ajaxDone(service.save(a));
		
	}
	/**
	 * 查看单个部门公告
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("dept/show")
	public String showXtAfficheDept(String id,ModelMap map){
		XtAfficheDept xa=service.get(XtAfficheDept.class, id);
		if(xa==null){
			return NODATA;
		}
		
		map.addAttribute("xa",xa);
		return "common_platform/affiche/dept/show";
		
		
	}
	/**
	 * 跳转到部门公告更新页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("dept/updatePage")
	public String updatePageXtAfficheDept(String id,ModelMap map){
		
		XtAfficheDept xa=service.get(XtAfficheDept.class, id);
		if(xa==null){
			return NODATA;
		}
		
		map.addAttribute("xa",xa);
		return "common_platform/affiche/dept/update";
		
		
	}
	/**
	 * 修改部门公告
	 * @param a
	 * @param errors
	 * @return
	 */
	@RequestMapping("dept/update")
	public ModelAndView updateXtAfficheDept(@Valid XtAfficheDept xa,Errors errors){
		
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		
		return ajaxDone(service.updateAfficheDept(xa));
		
	}
	/**
	 * 删除部门公告
	 * @param ids
	 * @return
	 */
	@RequestMapping("dept/del")
	public ModelAndView deleteXtAfficheDept(String[] ids){
		
		return ajaxDone(service.deleteAfficheDept(ids));
		
	}
	
	
	
	
	
	
	
}
