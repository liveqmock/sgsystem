/**  
 * @Project: jxoa
 * @Title: StringToDateConverter.java
 * @Package com.jxoa.commons.converter
 * @date 2013-5-23 下午4:26:45
 * @Copyright: 2013 
 */
package com.jxoa.commons.converter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * 
 * 类名：StringToDateConverter
 * 功能：Spring MVC 参数格式化 字符串转换Date
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-23 下午4:26:45
 *
 */
public class StringToDateConverter implements Converter<String,Date>{
	
	public Date convert(String source) {
		if(source==null||source.trim().length()==0)return null;
		DateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dateTimeFormat.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
}
