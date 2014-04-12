/**  
 * @Project: jxoa
 * @Title: PerMsgAction.java
 * @Package com.jxoa.manager.personalOffice.action
 * @date 2013-5-21 下午4:21:54
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.personalOffice.bean.PerMsg;
import com.jxoa.manager.personalOffice.service.IPerMsgService;

/**
 * 
 * 类名：PerMsgAction
 * 功能：个人办公--消息提醒
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-21 下午4:21:54
 *
 */
@Controller
@RequestMapping("/msgwarn")
public class PerMsgAction extends BaseAction{
	
	@Autowired
	private IPerMsgService service; 
	
	/**
	 * 跳转到消息提醒，查询出未读消息提醒
	 * @param myContent
	 * @param param
	 * @param msg
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("load")
	public String load(String myContent ,FormParam param,PerMsg msg,Date startDate,Date endDate,ModelMap map){
		msg.setUserId(ServletUtil.getMember().getId());
		msg.setReadState((short)0);
		map.addAttribute("msgs",service.selectPerMsg(param, msg, startDate, endDate));
		param.setAllCount(service.selectPerMsgCount(msg, startDate, endDate));
		map.addAttribute("fromParam",param);
		
		return "personalOffice/msgwarn/load";
	}
	/**
	 * 查询出未读消息 
	 * @return
	 */
	@RequestMapping("load/notread")
	public String load_notRead(FormParam param,PerMsg msg,Date startDate,Date endDate,ModelMap map){
		msg.setUserId(ServletUtil.getMember().getId());
		msg.setReadState((short)0);
		map.addAttribute("msgs",service.selectPerMsg(param, msg, startDate, endDate));
		param.setAllCount(service.selectPerMsgCount(msg, startDate, endDate));
		map.addAttribute("fromParam",param);
		
		return "personalOffice/msgwarn/query_notread";
	}
	/**
	 * 查询出已读消息 
	 * @return
	 */
	@RequestMapping("load/isread")
	public String load_isRead(FormParam param,PerMsg msg,Date startDate,Date endDate,ModelMap map){
		msg.setUserId(ServletUtil.getMember().getId());
		msg.setReadState((short)1);
		map.addAttribute("msgs",service.selectPerMsg(param, msg, startDate, endDate));
		param.setAllCount(service.selectPerMsgCount(msg, startDate, endDate));
		map.addAttribute("fromParam",param);
		
		return "personalOffice/msgwarn/query_isread";
	}
	
	/**
	 * 查看单个消息提醒
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("show")
	public String show(String id,ModelMap map){
		PerMsg m=service.updatefindPerMsgById(id);
		if(m==null){
			return NODATA;
		}
		map.addAttribute("msg",m);
		return "personalOffice/msgwarn/show";
	}
	
	/**
	 * 删除消息提醒
	 * @param ids
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(service.deletePerMsg(ids));
	}
	

	
	
}
