/**  
 * @Project: jxoa
 * @Title: SystemLogAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-4-11 下午3:45:10
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.ExcelUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.system.bean.SyLog;
import com.jxoa.manager.system.bean.SyLoginLog;
import com.jxoa.manager.system.service.ISystemLogService;
import com.jxoa.manager.system.service.ITableCustomService;

/**
 * 
 * 类名：SystemLog
 * 功能：日志功能
 * 详细：系统登录日志 系统重要操作日志
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-11 下午3:45:10
 *
 */
@Controller
@RequestMapping("/log")
public class SystemLogAction extends BaseAction{
	
	@Autowired
	private ISystemLogService service; 
	@Autowired
	private ITableCustomService tableCustomService; //打印导出自定义设置
	
	/**
	 * 查询出登录日志，跳转到登录日志界面
	 * @param param
	 * @param log
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("login")
	public String loginLoad(FormParam param,SyLoginLog log,Date startDate,Date endDate,ModelMap map){
		
		map.addAttribute("logs",service.selectSyLoginLog(param, log,startDate,endDate));
		param.setAllCount(service.selectSyLoginLogCount(log,startDate,endDate));
		map.addAttribute("fromParam",param);
		return "system/logs/login_log_load";
	
	}
	/**
	 * 导出当前查询出的数据
	 * @param param
	 * @param log
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("export")
	public String loginExport(FormParam param,SyLoginLog log,Date startDate,Date endDate,HttpServletRequest request,HttpServletResponse response){
	
		return ExcelUtils.export(service.selectSyLoginLog(param, log,startDate,endDate), tableCustomService.selectTableCustomExport((short)1), "登陆日志导出.xls", request, response);
		
	}
	/**
	 * 打印当前查询出的数据
	 * @param param
	 * @param log
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("print")
	public String loginExport(FormParam param,SyLoginLog log,Date startDate,Date endDate,ModelMap map){
	
		map.addAttribute("data",service.selectSyLoginLog(param, log,startDate,endDate));
		
		map.addAttribute("tc",tableCustomService.selectTableCustomPrint((short)1));
		
		map.addAttribute("tableTitle", "登陆日志");
		
		return "print";
	
	}
	/**
	 * 查询出个人登录日志，跳转到登录日志界面
	 * @param param
	 * @param log
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("login/my")
	public String loginLoadMy(FormParam param,SyLoginLog log,Date startDate,Date endDate,ModelMap map){
		log.setUserId(ServletUtil.getMember().getId());
		map.addAttribute("logs",service.selectSyLoginLog(param, log,startDate,endDate));
		param.setAllCount(service.selectSyLoginLogCount(log,startDate,endDate));
		map.addAttribute("fromParam",param);
		return "system/logs/login_log_load_my";
	
	}
	/**
	 * 删除登录日志
	 * @param ids
	 * @return
	 */
	@RequestMapping("login/del")
	public ModelAndView deleteLoginLog(String[] ids){
		
		return ajaxDone(service.deleteLoginLog(ids));
	
	}
	
	
	/**
	 * 查询出系统操作日志，跳转到系统操作日志界面
	 * @param param
	 * @param log
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("action")
	public String actionLoad(FormParam param,SyLog log,Date startDate,Date endDate,ModelMap map){
		
		map.addAttribute("logs",service.selectSyLog(param, log,startDate,endDate));
		param.setAllCount(service.selectSyLogCount(log,startDate,endDate));
		map.addAttribute("fromParam",param);
		return "system/logs/action_log_load";
	
	}
	/**
	 * 批量删除操作日志
	 * @param ids
	 * @return
	 */
	@RequestMapping("action/del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(service.deleteLog(ids));
	
	}
	
	
}
