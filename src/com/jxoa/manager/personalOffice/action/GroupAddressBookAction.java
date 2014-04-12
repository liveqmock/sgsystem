/**  
 * @Project: jxoa
 * @Title: GroupAddressBook.java
 * @Package com.jxoa.manager.GroupOffice.action
 * @date 2013-5-24 下午03:57:57
 * @Copyright: 2013 
 */
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
import com.jxoa.manager.personalOffice.bean.GroupAddressBook;
import com.jxoa.manager.personalOffice.service.IGroupAddressBookService;

/**
 * 
 * 类名：GroupAddressBook
 * 功能：个人办公-通讯录-个人通讯录-分组
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-24 下午03:57:57
 *
 */
@Controller
@RequestMapping("/group")
public class GroupAddressBookAction extends BaseAction {
	@Autowired
	private IGroupAddressBookService service;
	/**
	 * 查询个人通讯录分组
	 * 
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param, GroupAddressBook p, ModelMap map) {
		map.addAttribute("values",service.selectGroup(param, p));
		param.setAllCount(service.selectGroupCount(p));
		map.addAttribute("fromParam", param);
		
		return "personalOffice/addressBook/personal/set/load";

	}
	/**
	 * 跳转到添加页面
	 * 
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(FormParam param, ModelMap map) {
		return "personalOffice/addressBook/personal/set/add";

	}
	

	/**
	 * 添加个人通讯录分组
	 * 
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid GroupAddressBook p, Errors errors) {
		
		if (errors.hasErrors()) {

			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		return ajaxDone(service.addGroup(p));

	}

	/**
	 * 跳转到个人通讯录分组编辑页面
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("updatePage")
	public String updatePage(FormParam param, String id, ModelMap map) {
//		map.addAttribute("list", service.selectRoom());
		map.addAttribute("gro",service.selectGroup( id));
		return "personalOffice/addressBook/personal/set/update";
	}

	/**
	 * 修改个人通讯录分组
	 * 
	 * @param lv
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid GroupAddressBook m, Errors errors) {
		if (errors.hasErrors()) {
			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		return ajaxDone(service.updateGroup(m));

	}
	
	/**
	 * 删除个人通讯录分组
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		return ajaxDone(service.deleteGroup(ids));
	
	}
}
