/**  
 * @Project: jxoa
 * @Title: PersonalAction.java
 * @Package com.jxoa.manager.personalOffice.addressBook.Personal.action
 * @date 2013-5-21 上午09:38:12
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.action;

import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.jxoa.manager.personalOffice.bean.PersonalAddressBook;
import com.jxoa.manager.personalOffice.service.IPersonalAddressBookService;
import com.jxoa.manager.system.bean.SyUsers;

/**
 * 
 * 类名：PersonalAction
 * 功能：个人办公-通讯录-个人通讯录
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-21 上午09:38:12
 *
 */

@Controller
@RequestMapping("/personal")
public class PersonalAddressBookAction extends BaseAction {
	@Autowired
	private IPersonalAddressBookService service;

	/**
	 * 查询个人通讯录
	 * 
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param, PersonalAddressBook p, ModelMap map) {
		
		map.addAttribute("depts",JSON.toJSONString(service.selectGroup()));

		map.addAttribute("values",service.selectPersonal(param, p));
		param.setAllCount(service.selectPersonalCount(p));
		map.addAttribute("fromParam", param);
		map.addAttribute("group",service.selectGroup());
		return "personalOffice/addressBook/personal/load";

	}
	/**
	 * 根据分组查询
	 */
	@RequestMapping("queryGroup")
	public String queryGroup(FormParam param,PersonalAddressBook p,ModelMap map){
		map.addAttribute("group",service.selectGroup());
		param.setAllCount(service.selectPersonalCount(p));
		map.addAttribute("values",service.selectPersonal(param, p));
		map.addAttribute("fromParam", param);
		return "personalOffice/addressBook/personal/query";
	}
	
	/**
	 * 跳转到添加页面
	 * 
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(FormParam param, ModelMap map) {
		map.addAttribute("group",service.selectGroup());
		return "personalOffice/addressBook/personal/add";

	}
	

	/**
	 * 添加个人通讯录
	 * 
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid PersonalAddressBook p, Errors errors) {
		
		if (errors.hasErrors()) {

			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		return ajaxDone(service.addPersonal(p));

	}

	/**
	 * 跳转到个人通讯录编辑页面
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("updatePage")
	public String updatePage(FormParam param, String id, ModelMap map) {
		map.addAttribute("group",service.selectGroup());
		map.addAttribute("per",service.selectPersonal( id));
		if(map.get("per")==null){
			return NODATA;
		}
		return "personalOffice/addressBook/personal/update";
	}

	/**
	 * 修改个人通讯录
	 * 
	 * @param lv
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid PersonalAddressBook m, Errors errors) {
		if (errors.hasErrors()) {
			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		return ajaxDone(service.updatePersonal(m));

	}
	
	/**
	 * 删除个人通讯录
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		return ajaxDone(service.deletePersonal(ids));
	
	}
	/**
	 * 跳转到个人通讯录查看页面
	 * 
	 * @return
	 */
	@RequestMapping("find")
	public String find(FormParam param, String id, ModelMap map) {
		map.addAttribute("per",service.selectPersonal( id));
		if(map.get("per")==null){
			return NODATA;
		}
		map.addAttribute("group",service.selectGroup());
		return "personalOffice/addressBook/personal/find";
	}

}
