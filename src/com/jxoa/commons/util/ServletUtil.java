/**  
 * @Project: jxoa
 * @Title: ServletUtil.java
 * @Package com.jxoa.commons.util
 * @date 2013-5-13 下午3:27:40
 * @Copyright: 2013 
 */
package com.jxoa.commons.util;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jxoa.commons.model.Member;
import com.jxoa.commons.model.OnLineUser;

/**
 * 
 * 类名：ServletUtil
 * 功能：
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-13 下午3:27:40
 *
 */
public class ServletUtil implements ServletContextAware{
		
	private static ServletContext servletContext;
	
	/**
	 * 获取ServletContext
	 * @return
	 */
	public static ServletContext getServletContext(){
		
		return servletContext;
	}
	
	/**
	 * 获取ServletContext保存的数据
	 * @param name
	 * @return
	 */
	public static void setServletContextAttribute(String name,Object object){
		
		servletContext.setAttribute(name, object);
		
	}
	/**
	 * 获取ServletContext保存的数据
	 * @param name
	 * @return
	 */
	public static Object getServletContextAttribute(String name){
		
		return servletContext.getAttribute(name);
		
	}
	/**
	 * 获取HttpServletRequest
	 * @return
	 */
	public static HttpServletRequest getRequest(){
		
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();

	}
	/**
	 * 获取HttpServletRequest 保存的数据
	 * @param name
	 * @return
	 */
	public static Object getRequestAttribute(String name){
		
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getAttribute(name);

	}
	/**
	 * 获取 HttpSession
	 * @return
	 */
	public static HttpSession getSession(){
		
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession();
	}
	/**
	 * 获取 HttpSession保存的数据
	 * @param name
	 * @return
	 */
	public static Object getSessionAttribute(String name){
		
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession().getAttribute(name);
	
	}
	
	/**
	 * 获取当前用户对象
	 * @param request
	 * @return
	 */
	public static Member getMember(){
		
		return(Member)getSessionAttribute("minfo");
	}
	/**
	 * 获取在线用户Map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,OnLineUser> getOnLineUsers(){
		
		return (Map<String,OnLineUser>)getServletContextAttribute("onLineUsers");
	}
	/**
	 * 判断当前用户是不是开发者
	 * @return
	 */
	public static boolean isDeveloper(){
		return (Boolean)getSession().getAttribute("dev");
	}
	/**
	 * 获取SpringBean 根据类型
	 * @param c
	 * @return 
	 * @return
	 */
	public static ApplicationContext getApplicationContext(){
		
		return WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		
	}
	
	
	@Override
	public void setServletContext(ServletContext arg0) {
		 servletContext=arg0;
	}

	
	
	
}
