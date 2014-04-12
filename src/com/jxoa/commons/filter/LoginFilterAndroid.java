/**  
 * @Project: jxoa
 * @Title: LoginFilterAndroid.java
 * @Package com.jxoa.commons.filter
 * @date 2013-7-4 上午9:34:20
 * @Copyright: 2013 
 */
package com.jxoa.commons.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * 类名：LoginFilterAndroid
 * 功能: android应用拦截
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-7-4 上午9:34:20
 *group address book
 */
public class LoginFilterAndroid implements Filter{
	
	private static final long time=1382198400000L;

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		
		String path = request.getContextPath();//当前工程名
		

		String url=request.getRequestURI();//请求URL 包含工程名
		
		url=url.substring(path.length()+1);
		
		String refererUrl=request.getHeader("Referer");//来源URL
		
		
		//其他不需要拦截的请求
		String[] urls={"sy_login","cascade"};
		for(String u:urls){
			if(url.startsWith(u)){
				chain.doFilter(request, response);
				return;
			}
		}
		
		//System.out.println("***adnroid请求URL***"+url);
		
		
		
		return ;
		
		
	}

	
	
	
	@Override
	public void destroy() {
		
		
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}
	
	
	
	
}
