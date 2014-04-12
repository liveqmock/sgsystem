/**  
 * @Project: jxoa
 * @Title: MsgAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-4-1 下午3:50:53
 * @Copyright: 2013 
 */
package com.jxoa.manager.base.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jxoa.commons.base.BaseAction;

/**
 * 
 * 类名：MsgAction
 * 功能：请求跳转
 * 详细：处理一些特殊请求 直接跳转页面
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-1 下午3:50:53
 *
 */
@Controller
public class SkipAction extends BaseAction{
	
	/**
	 * 跳转到功能待开发页面
	 * @return
	 */
	@RequestMapping("error/no")
	public String tono(){
		
		return "no";
	}
	/**
	 * 跳转到ajaxDone.jsp
	 * @return
	 */
	@RequestMapping("ajax/ajaxDonePage")
	public String toAjaxDone(){
		
		return "ajaxDone";
	}
	/**
	 * 跳转到服务器信息查看页面
	 * @return
	 */
	@RequestMapping("servlet/info")
	public String toservletinfo(){
		
		return "system/jspinfo";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
