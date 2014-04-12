
package com.jxoa.manager.personalOffice.action;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.Assess;
import com.jxoa.manager.personalOffice.bean.GroupAddressBook;
import com.jxoa.manager.personalOffice.bean.PersonalAddressBook;
import com.jxoa.manager.personalOffice.service.IAssessService;
import com.jxoa.manager.personalOffice.service.IGroupAddressBookService;
import com.jxoa.manager.system.bean.SyRole;
import com.jxoa.manager.system.bean.SyUsers;

/**
 * 
 * 类名：IntegrationAction
 * 功能：积分考核
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-7-18 下午02:47:25
 *
 */
@Controller
@RequestMapping("/assess")
public class AssessAction  extends BaseAction {
	
	@Autowired
	private IAssessService service;
	/**
	 * 查询
	 * 
	 * @return
	 */
	@RequestMapping("assessLoad")
	public String assessLoad(FormParam param, GroupAddressBook p, ModelMap map) {
//		map.addAttribute("values",service.selectGroup(param, p));
//		param.setAllCount(service.selectGroupCount(p));
//		map.addAttribute("fromParam", param);
//		
		return "personalOffice/Integration/assess_set/load";

	}
	
	/**
	 * 根据组查询考核项
	 */
	@RequestMapping("assessQuery")
	public String assessQuery(FormParam param, Assess a ,ModelMap map){
//		map.addAttribute("group",service.selectGroup());
//		param.setAllCount(service.selectPersonalCount(p));
//		map.addAttribute("values",service.selectPersonal(param, p));
//		map.addAttribute("fromParam", param);

		map.addAttribute("group",a.getAsGroup() );
		param.setAllCount(service.selectAssessCount(a));
		map.addAttribute("fromParam", param);
		map.addAttribute("values", service.assessLoad(param, a));
		return "personalOffice/Integration/assess_set/query";
	}
	
	/**
	 * 跳转到考核项添加页面
	 * 
	 * @return
	 */
	@RequestMapping("assessAddPage")
	public String assessAddPage(FormParam param, ModelMap map,String group) {
		map.addAttribute("group", group);
		return "personalOffice/Integration/assess_set/add";

	}
	/**
	 * 添加考核项
	 * 
	 * @return
	 */
	@RequestMapping("assessAdd")
	public ModelAndView assessAdd(@Valid Assess a, Errors errors) {
		
		if (errors.hasErrors()) {

			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		if(a.getAsStatus()==null){
			a.setAsStatus(0);
		}
		return ajaxDone(service.addAssess(a));

	}
	
	/**
	 * 跳转到考核项修改页面
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("assessUpdatePage")
	public String assessUpdatePage(FormParam param, String id, ModelMap map) {
		map.addAttribute("as",service.selectAssess( id));
		return "personalOffice/Integration/assess_set/update";
	}
	
	
	
	
	

	/**
	 * 修改考核项
	 * 
	 * @param lv
	 * @return
	 */
	@RequestMapping("assessUpdate")
	public ModelAndView assessUpdate(@Valid Assess a, Errors errors) {
		if (errors.hasErrors()) {
			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		return ajaxDone(service.updateAssess(a));

	}
	
	/**
	 * 删除考核项
	 */
	@RequestMapping("assessDel")
	public ModelAndView assessDel(String[] ids){
		return ajaxDone(service.deleteAssess(ids));
	
	}
	/**
	 * 更新考核项状态
	 */
	@RequestMapping("assessStatus")
	public ModelAndView assessStatus(String[] ids,String status){
		return ajaxDone(service.updateStatus(ids,status));
	
	}
	/**
	 * 积分考核项查询，查找带回
	 * @param param
	 * @param as
	 * @param map
	 * @return
	 */
	@RequestMapping("lookUpPage")
	public String lookUpPage(FormParam param,Assess as,ModelMap map){
		map.addAttribute("value",service.lookUpAssess(param, as));
//		param.setAllCount(service.lookUpAssessCount(as));
		map.addAttribute("fromParam",param);
		
			return "personalOffice/Integration/assess_set/lookup_more";
		
	}

}
