/**  
 * @Project: jxoa
 * @Title: StringToStringConverter.java
 * @Package com.jxoa.commons.converter
 * @date 2013-5-23 下午4:26:45
 * @Copyright: 2013 
 */
package com.jxoa.commons.converter;

import org.springframework.core.convert.converter.Converter;

/**
 * 
 * 类名：StringToStringConverter
 * 功能：Spring MVC 参数封装
 * 详细：去除前后空格
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-23 下午4:26:45
 *
 */
public class StringToStringConverter implements Converter<String,String>{
	
	public String convert(String source) {
		
		if(source!=null){
			source=source.trim();//去除前后半角空格
			//去除前后全角半角空格
			while(source.startsWith("　")){
				source = source.substring(1,source.length()).trim();   
			}   
		    while(source.endsWith("　")){   
			   source = source.substring(0,source.length()-1).trim();   
			}
			 
		}
		return source;
	}
}
