/**  
 * @Project: jxoa
 * @Title: ScheduleAction.java
 * @Package com.jxoa.manager.personalOffice.action
 * @date 2013-5-29 上午9:11:07
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.personalOffice.bean.PerSchedule;
import com.jxoa.manager.personalOffice.service.IScheduleService;

/**
 * 
 * 类名：ScheduleAction
 * 功能：个人办公--日程安排
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-29 上午9:11:07
 *
 */
@Controller
@RequestMapping("/schedule")
public class ScheduleAction extends BaseAction{

	@Autowired
	private IScheduleService service;
	
	/**
	 * 日程安排
	 * @param param
	 * @param s
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param,PerSchedule s,Date startDate,Date endDate,ModelMap map){
		
		s.setUserId(ServletUtil.getMember().getId());
		Date now=new Date();
		Date tomorrow=DateUtil.moveDate(now, 1);
		map.addAttribute("schs",service.selectSchedule(param, s, DateUtil.string2Date(DateUtil.date2String(now, null), null), DateUtil.string2Date(DateUtil.date2String(tomorrow, null), null)));
		param.setAllCount(service.selectScheduleCount(s, startDate, endDate));
		map.addAttribute("fromParam",param);
		
		return "personalOffice/schedule/load";
	
	}
	/**
	 * 日程安排管理
	 * @param param
	 * @param s
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("query")
	public String query(FormParam param,PerSchedule s,Date startDate,Date endDate,ModelMap map){
		s.setUserId(ServletUtil.getMember().getId());
		map.addAttribute("schs",service.selectSchedule(param, s, startDate, endDate));
		param.setAllCount(service.selectScheduleCount(s, startDate, endDate));
		map.addAttribute("fromParam",param);
		
		return "personalOffice/schedule/query";
	
	}
	/**
	 * 今日日程查询所有安排
	 * @param param
	 * @param s
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("queryToday")
	public String queryToday(ModelMap map){
		
		map.addAttribute("schs",service.selectTodaySchedule());
		
		
		
		return "personalOffice/schedule/query_today";
	
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		
		return "personalOffice/schedule/add";
	
	}
	/**
	 * 添加日程
	 * @param s
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid PerSchedule s,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		s.setUserId(ServletUtil.getMember().getId());
		return ajaxDone(service.save(s));
		
	}
	/**
	 * 跳转到日程安排编辑页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		PerSchedule s=service.get(PerSchedule.class, id);
		if(s==null){
			return NODATA;
		}
		if(!ServletUtil.getMember().getId().equals(s.getUserId())){
			return NOPOWER;
		}
		map.addAttribute("s",s);
		return "personalOffice/schedule/update";
	}
	/**
	 * 修改日程安排
	 * @param s
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid PerSchedule s,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		s.setUserId(ServletUtil.getMember().getId());
		return ajaxDone(service.updateSchedule(s));
		
	}
	/**
	 * 查看日程安排详情
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("show")
	public String show(String id,ModelMap map){
		PerSchedule s=service.get(PerSchedule.class, id);
		if(s==null){
			return NODATA;
		}
		if(!ServletUtil.getMember().getId().equals(s.getUserId())){
			return NOPOWER;
		}
		map.addAttribute("s",s);
		return "personalOffice/schedule/show";
	}
	
	/**
	 * 删除日程安排
	 * @param ids
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(service.deleteSchedule(ids));
	
	}
	
	/**
	 * 查询出今日日程安排，用于js提醒
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("queryWarn")
	public ModelAndView queryWarn(){
		
		Map map=new HashMap();

		map.put(MsgConfig.STATUSCODE, MsgConfig.CODE_SUCCESS);
		
		map.put("sch",service.selectAfterNowTodaySchedule());
		
		map.put("now",new Date().getTime());
		
		return ajaxJson(map);
		
	}
	
	
}
