/**  
 * @Project: jxoa
 * @Title: ILoginService.java
 * @Package com.jxoa.manager.system.service
 * @date 2013-4-1 下午3:23:07
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.IBaseService;

/**
 * 
 * 类名：ILoginService
 * 功能：
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-1 下午3:23:07
 *
 */

public interface ILoginService extends IBaseService{
	
	/**
	 * 用户登录验证
	 * @param vercode	验证码
	 * @param name		用户名
	 * @param password	登录密码
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView updateLogin(String vercode,String name,String password,HttpServletRequest request,HttpServletResponse response);
	
	
}
