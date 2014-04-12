/**  
 * @Project: jxoa
 * @Title: BaseAction.java
 * @Package com.jxoa.commons.base
 * @date 2013-3-28 下午2:53:27
 * @Copyright: 2013 
 */
package com.jxoa.commons.base;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.jxoa.commons.config.MsgConfig;


/**
 * 
 * 类名：BaseAction
 * 功能：action 父类
 * 详细：所有action类的父类 一些常用方法
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-3-28 下午2:53:27
 *
 */
public abstract class BaseAction {
	
	public static final String NODATA="nodata"; 
	public static final String NOPOWER="nopower";
	/**
	 * 自定义状态码 和自定义提示信息，
	 * @param statusCode
	 * @param message
	 * @return
	 */
	protected ModelAndView ajaxDoneText(int statusCode, String message) {
		ModelAndView mav = new ModelAndView(MsgConfig.PAGE_AJAXDONE);
		mav.addObject(MsgConfig.STATUSCODE, statusCode);
		mav.addObject(MsgConfig.MESSAGE,message);
	
		return mav;
	}
	/**
	 * 自定义状态码 和提示信息， message为国际化资源key
	 * @param statusCode
	 * @param message
	 * @return
	 */
	protected ModelAndView ajaxDone(int statusCode, String messageKey) {
		ModelAndView mav = new ModelAndView(MsgConfig.PAGE_AJAXMESSAGE);
		mav.addObject(MsgConfig.STATUSCODE, statusCode);
		mav.addObject(MsgConfig.MESSAGE,messageKey);
		
		return mav;
	}
	/**
	 * 传入boolean 返回操作成功 或者失败  使用默认提示信息
	 * @param f
	 * @return
	 */
	protected ModelAndView ajaxDone(boolean f){
		if(f){
			return ajaxDoneSuccess();
		}else{
			return ajaxDoneError();
		}
	}
	/**
	 * 传入反馈的信息  使用默认提示信息
	 * @param f
	 * @return
	 */
	protected ModelAndView ajaxDone(String messageKey){
		if(MsgConfig.MSG_KEY_SUCCESS.equals(messageKey)){
			return ajaxDoneSuccess();
		}else{
			return ajaxDoneError(messageKey);
		}
	}
	/**
	 * 操作成功 使用默认提示信息
	 * @return
	 */
	protected ModelAndView ajaxDoneSuccess() {
		return ajaxDone(MsgConfig.CODE_SUCCESS, MsgConfig.MSG_KEY_SUCCESS);//默认信息 操作成功
	}
	/**
	 * 操作成功，自定义提示信息，
	 * @param messageKey
	 * @return
	 */
	protected ModelAndView ajaxDoneSuccess(String messageKey) {
		return ajaxDone(MsgConfig.CODE_SUCCESS, messageKey);
	}
	
	/**
	 * 操作成功 使用默认提示信息
	 * @return
	 */
	protected String ajaxDoneSuccess(ModelMap map) {
		
		map.addAttribute(MsgConfig.STATUSCODE, MsgConfig.CODE_SUCCESS);
		map.addAttribute(MsgConfig.MESSAGE,MsgConfig.MSG_KEY_SUCCESS);
		return MsgConfig.PAGE_AJAXMESSAGE;	
	}
	
	/**
	 * 操作失败，使用默认提示信息
	 * @return
	 */
	protected ModelAndView ajaxDoneError() {
		return ajaxDone(MsgConfig.CODE_FAIL, MsgConfig.MSG_KEY_FAIL);//默认信息  操作失败
	}
	/**
	 * 操作失败，自定义提示信息
	 * @param messageKey
	 * @return
	 */
	protected ModelAndView ajaxDoneError(String messageKey) {
		return ajaxDone(MsgConfig.CODE_FAIL, messageKey);
	}
	/**
	 * 操作成功 使用默认提示信息
	 * @return
	 */
	protected String ajaxDoneError(ModelMap map) {
		
		map.addAttribute(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
		map.addAttribute(MsgConfig.MESSAGE,MsgConfig.MSG_KEY_FAIL);
		return MsgConfig.PAGE_AJAXMESSAGE;	
	}
	
	/**
	 * 直接输出信息
	 * @param message
	 * @return
	 */
	protected ModelAndView ajaxText(String message) {
		ModelAndView mav = new ModelAndView(MsgConfig.PAGE_AJAXJSON);
		mav.addObject(MsgConfig.MSGINFO, message);
		return mav;
	}
	/**
	 * 将信息格式化成json输出
	 * @param message
	 * @return
	 */
	protected ModelAndView ajaxJson(Object message) {
		ModelAndView mav = new ModelAndView(MsgConfig.PAGE_AJAXJSON);
		mav.addObject(MsgConfig.MSGINFO, JSON.toJSONString(message));
		return mav;
	}
	
	/**
	 * 返回数据校验失败视图
	 * @param errors 数据校验错误信息
	 * @param excludeField 排除验证的 属性(可变参)
	 * @return
	 */
	protected ModelAndView getValidationMessage(Errors errors,String...excludeField) {
		
		System.out.println("错误数量"+errors.getErrorCount());
		
		System.out.println("xx"+errors.hasFieldErrors("userName"));
		
		List<FieldError> fes=errors.getFieldErrors();
		List<String> errorMessages=new ArrayList<String>();
		
		//遍历所有错误信息
		c:for(FieldError e:fes){
			System.out.println("f=="+e.getField());
			System.out.println("code=="+e.getCode());
			System.out.println("msg=="+e.getDefaultMessage());
			String fileName=e.getField();
			for(String ef:excludeField){
				if(fileName.equals(ef)){
					//如果是不需要验证的属性，直接继续遍历下面的错误信息
					System.out.println(ef+"不需要验证");
					continue c;
				}
			}
			errorMessages.add(e.getDefaultMessage());
		}
		
		if(errorMessages.isEmpty()){
			//排除不需要验证的信息之后没有错误信息
			return null;
		}
	
		ModelAndView mav = new ModelAndView("ajaxValidationMessage");
		mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL);
		mav.addObject("errorCount",errorMessages.size());
		mav.addObject(MsgConfig.MESSAGE,errorMessages);
		return mav;
		
	}
	
	
	
}
