/**  
 * @Project: jxoa
 * @Title: RoomAction.java
 * @Package com.jxoa.manager.common_platform.action
 * @date 2013-5-9 下午03:36:32
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.common_platform.bean.Mapping;
import com.jxoa.manager.common_platform.bean.Meeting;
import com.jxoa.manager.common_platform.bean.Room;
import com.jxoa.manager.common_platform.service.IMeetingService;
import com.jxoa.manager.common_platform.service.IRoomService;
import com.jxoa.manager.system.bean.ListValues;

/**
 * 
 * 类名：RoomAction 功能：会议室 详细： 作者：曹中德(caozhongde) 版本：1.0 日期：2013-5-9 下午03:36:32
 * 
 */

@Controller
@RequestMapping("/room")
public class RoomAction extends BaseAction {

	@Resource(name = "roomServiceImpl")
	private IRoomService service;

	/**
	 * 查询会议室
	 * 
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param, Room lv, ModelMap map) {

		map.addAttribute("values", service.selectRoom(param, lv));
		param.setAllCount(service.selectRoomCount(lv));
		map.addAttribute("fromParam", param);
		return "common_platform/meeting/room/set";

	}

	/**
	 * 跳转到添加页面
	 * 
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage() {

		return "common_platform/meeting/room/setAdd";

	}

	/**
	 * 添加
	 * 
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid Room lv, Errors errors) {
		if (errors.hasErrors()) {
			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		return ajaxDone(service.addRoom(lv));

	}
	
	/**
	 * 跳转到会议室编辑页面
	 * 
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(FormParam param, String id, ModelMap map) {

		map.addAttribute("room", service.get(Room.class, id));
	
		return "common_platform/meeting/room/setUpdate";
	}
	/**
	 * 修改会议室
	 * 
	 * @param lv
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid Room r, Errors errors, HttpSession session,FormParam param) {
		if (errors.hasErrors()) {
			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		return ajaxDone(service.updateRoom(r));

	}
	/**
	 * 删除会议室
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		return ajaxDone(service.deleteRoom(ids));
	
	}
}
