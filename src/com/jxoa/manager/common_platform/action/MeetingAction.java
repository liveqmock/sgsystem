/**  
 * @Project: jxoa
 * @Title: MeetingAction.java
 * @Package com.jxoa.manager.common_platform.action
 * @date 2013-5-9 上午10:14:29
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.common_platform.bean.Mapping;
import com.jxoa.manager.common_platform.bean.Meeting;
import com.jxoa.manager.common_platform.service.IMeetingService;

/**
 * 
 * 类名：MeetingAction 
 * 功能：公共平台-会议管理 
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0 日期：2013-5-9
 * 上午10:14:29
 * 
 */
@Controller
@RequestMapping("/meeting")
public class MeetingAction extends BaseAction {

	@Autowired
	private IMeetingService service;

	/**
	 * 查询会议
	 * 
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param, Meeting lv, ModelMap map) {
		
		map.addAttribute("list", service.selectRoom());
		map.addAttribute("values", service.selectMeeting(param, lv));
		param.setAllCount(service.selectMeetingCount(lv));
		map.addAttribute("fromParam", param);
		return "common_platform/meeting/load";

	}
	/**
	 * 查询个人会议
	 * 
	 * @return
	 */
	@RequestMapping("loadtome")
	public String loadTome(FormParam param, Meeting lv, ModelMap map) {
		map.addAttribute("list", service.selectRoom());
		map.addAttribute("values", service.selectMeetingTome(param, lv));
		param.setAllCount(service.selectMeetingCount(lv));
		map.addAttribute("fromParam", param);
		return "common_platform/meeting/loadtome";

	}
	/**
	 * 跳转到添加页面
	 * 
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(FormParam param, ModelMap map) {
		map.addAttribute("list", service.selectRoom());
		return "common_platform/meeting/add";

	}

	/**
	 * 添加会议
	 * 
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid Meeting m, Errors errors) {
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		m.setMPublished(formatter.format(date));
		if (errors.hasErrors()) {

			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		Member me = ServletUtil.getMember();
		m.setMUid(me.getId());

		return ajaxDone(service.addMeeting(m));

	}

	/**
	 * 跳转到会议编辑页面
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("updatePage")
	public String updatePage(FormParam param, String id, ModelMap map) {
		map.addAttribute("list", service.selectRoom());
		map.addAllAttributes(service.selectMapping( id));
		return "common_platform/meeting/update";
	}

	/**
	 * 修改会议
	 * 
	 * @param lv
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid Meeting m, Errors errors) {
		if (errors.hasErrors()) {
			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		return ajaxDone(service.updateMeeting(m));

	}
	
	/**
	 * 删除会议
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		return ajaxDone(service.deleteMeeting(ids));
	
	}
	/**
	 * 跳转到会议查看页面
	 * 
	 * @return
	 */
	@RequestMapping("find")
	public String find(FormParam param, String id, ModelMap map) {
		map.addAttribute("list", service.selectRoom());
		map.addAllAttributes(service.selectMapping( id));
		return "common_platform/meeting/find";
	}

	
}
