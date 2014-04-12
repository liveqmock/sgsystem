/**  
 * @Project: jxoa
 * @Title: MyActionException.java
 * @Package com.jxoa.commons.exception
 * @date 2013-4-2 下午3:39:49
 * @Copyright: 2013 
 */
package com.jxoa.commons.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.config.MsgConfig;

/**
 * 
 * 类名：MyActionException
 * 功能：统一异常处理
 * 详细：统一处理所有请求异常
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-2 下午3:39:49
 *
 */
public class MyActionException implements HandlerExceptionResolver {
	
	private static Logger logger = Logger.getLogger(MyActionException.class);
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request,HttpServletResponse arg1, Object obj, Exception e) {
		
		String url=request.getRequestURI();//请求URL
		String urlLy=request.getHeader("Referer");//来源URL
		System.out.println("请求url====="+url);
		System.out.println("请求来源url====="+urlLy);
		logger.error("发生异常：请求："+url+"请求来源:"+urlLy+"异常名称:"+e.getClass().getName()+"异常信息:"+e.getMessage()+"异常来源action"+obj);
		
		e.printStackTrace();
		
		System.out.println("=="+request.getContentType());
		if(e instanceof MyRuntimeException){
			//数据格式封装错误
			ModelAndView mav = new ModelAndView(MsgConfig.PAGE_AJAXDONE);
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL );
			mav.addObject(MsgConfig.MESSAGE, e.getMessage());//自定义异常信息
			return mav;
		}
		else if(e instanceof org.springframework.validation.BindException|| e instanceof org.springframework.beans.TypeMismatchException){
			//数据格式封装错误
			ModelAndView mav = new ModelAndView(MsgConfig.PAGE_AJAXMESSAGE);
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL );
			mav.addObject(MsgConfig.MESSAGE, "msg.exception.typeError");//数据类型错误，请根据要求修正！
			return mav;
		}else if(e instanceof org.springframework.orm.hibernate3.HibernateOptimisticLockingFailureException){
			
			ModelAndView mav = new ModelAndView(MsgConfig.PAGE_AJAXMESSAGE);
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL );
			mav.addObject(MsgConfig.MESSAGE, "msg.error.database");//操作失败！原因：数据操作失败，可能是您要操作的数据已经不存在，请更新为最新数据再操作！
			return mav;
			
		}
		if (request != null&& "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))){
			System.out.println("异常：ajax请求");
			ModelAndView mav = new ModelAndView(MsgConfig.PAGE_AJAXMESSAGE);
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL );
			mav.addObject(MsgConfig.MESSAGE, "msg.exception.error");//服务器异常...请稍后再试....
			return mav;
			
		}else{
			System.out.println("异常：非ajax请求");
			
			if(request.getContentType()!=null&&request.getContentType().indexOf("multipart/form-data")!=-1){
				System.out.println("上传请求");
				ModelAndView mav = new ModelAndView(MsgConfig.PAGE_AJAXMESSAGE);
				mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL );
				mav.addObject(MsgConfig.MESSAGE, "msg.exception.error");//服务器异常...请稍后再试....
				return mav;
			}
			
			ModelAndView mav = new ModelAndView("exception");
			
			//mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL );
			
			//mav.addObject(MsgConfig.MESSAGE, "msg.exception.error");//服务器异常...请稍后再试....
			
			return mav;
		}
		
	}

}
