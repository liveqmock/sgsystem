/**  
 * @Project: jxoa
 * @Title: LoginInterceptor.java
 * @Package com.jxoa.commons.interceptor
 * @date 2013-4-2 上午10:13:29
 * @Copyright: 2013 
 */
package com.jxoa.commons.interceptor;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.model.Member;
import com.jxoa.commons.model.OnLineUser;
import com.jxoa.commons.util.IpUtil;
import com.jxoa.commons.util.ServletUtil;

/**
 * 
 * 类名：LoginInterceptor
 * 功能：登录验证拦截
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-2 上午10:13:29
 *
 */
public class LoginInterceptor implements HandlerInterceptor{
	
	private long st=0;
	
	//afterCompletion()方法在DispatcherServlet完全处理完请求后被调用
	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse arg1, Object arg2, Exception arg3)throws Exception {
	
		System.out.println("***请求完全处理完成***"+request.getRequestURI()+"耗时"+(System.currentTimeMillis()-st));
		
	}
	//postHandle()方法在业务处理器处理请求之后被调用
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse arg1,Object arg2, ModelAndView arg3) throws Exception {
		
		//System.out.println("***请求执行之后***"+request.getRequestURI());
		
	}
	//preHandle()方法在业务处理器处理请求之前被调用
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object obj) throws Exception {
		st=System.currentTimeMillis();
		return true;
		
		//System.out.println("***请求来源URL***"+refererUrl);

	}
	

}
