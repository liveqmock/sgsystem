/**  
 * @Project: jxoa
 * @Title: ParameterFilter.java
 * @Package com.jxoa.commons.filter
 * @date 2013-4-7 上午11:05:07
 * @Copyright: 2013 
 */
package com.jxoa.commons.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * 
 * 类名：ParameterFilter
 * 功能：统一参数处理
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-7 上午11:05:07
 *
 */
public class ParameterFilter implements Filter{

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {
		
		try{
			//将字符串参数去掉空格 
			HttpServletRequest req = (HttpServletRequest)request;
			Map<String, Object> params = req.getParameterMap();
	        for(String key : params.keySet()) {
	            Object value = params.get(key);
	            if(value instanceof String[]){
		            String[] o=(String[])value;
		            for(int i=0;i<o.length;i++){
		            	
		        	     System.out.println("==参数==="+key+"："+o[i]);
		            }
	            }
          
	        }
			chain.doFilter(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
