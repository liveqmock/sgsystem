/**  
 * @Project: jxoa
 * @Title: StringToTimestampConverter.java
 * @Package com.jxoa.commons.converter
 * @date 2013-5-23 下午4:27:31
 * @Copyright: 2013 
 */
package com.jxoa.commons.converter;

import java.sql.Timestamp;

import org.springframework.core.convert.converter.Converter;

/**
 * 
 * 类名：StringToTimestampConverter
 * 功能：Spring MVC 参数格式化 字符串转换Timestamp
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-23 下午4:27:31
 *
 */
public class StringToTimestampConverter implements Converter<String,Timestamp>{
	
	public Timestamp convert(String source) {
		if(source==null||source.trim().length()==0)return null;
		Timestamp date = null;
		try {
			date=Timestamp.valueOf(source);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}
}
