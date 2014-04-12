/**  
 * @Project: jxoa
 * @Title: DateUtil.java
 * @Package com.jxoa.commons.util
 * @date 2013-4-12 下午1:55:18
 * @Copyright: 2013 
 */
package com.jxoa.commons.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.regex.Pattern;

/**
 * 
 * 类名：DateUtil
 * 功能：时间格式化
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-12 下午1:55:18
 *
 */
public class DateUtil {

	public static final String PATTERN_STANDARD = "yyyy-MM-dd HH:mm:ss";

	public static final String PATTERN_DATE = "yyyy-MM-dd";
	
	/**
	 * 时间格式化 
	 * @param timestamp
	 * @param pattern 可传入 null 或"" 默认格式  yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String timestamp2String(Timestamp timestamp, String pattern) {
		if (timestamp == null) {
			return null;
		}
		if (pattern == null || pattern.equals("")) {
			pattern = PATTERN_STANDARD;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(new Date(timestamp.getTime()));
	}
	/**
	 * 日期格式化
	 * @param date
	 * @param pattern 可传入 null 或"" 默认格式 yyyy-MM-dd
	 * @return
	 */
	public static String date2String(java.util.Date date, String pattern) {
		if (date == null) {
			return null;
		}
		if (pattern == null || pattern.equals("")) {
			pattern = PATTERN_DATE;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}
	/**
	 * 获取当前时间
	 * @return
	 */
	public static Timestamp currentTimestamp() {
		return new Timestamp(new Date().getTime());
	}
	/**
	 * 获取当前时间并按自定义格式化
	 * @param pattern
	 * @return
	 */
	public static String currentTimestamp2String(String pattern) {
		return timestamp2String(currentTimestamp(), pattern);
	}
	/**
	 * 字符串 转换为 时间 
	 * @param strDateTime
	 * @param pattern 可传入 null 或"" 默认格式  yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static Timestamp string2Timestamp(String strDateTime, String pattern) {
		if (strDateTime == null || strDateTime.equals("")) {
			return null;
		}
		if (pattern == null || pattern.equals("")) {
			pattern = PATTERN_STANDARD;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date date = null;
		try {
			date = sdf.parse(strDateTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return new Timestamp(date.getTime());
	}
	/**
	 * 字符串转换为日期类型
	 * @param strDate
	 * @param pattern 可传入 null 或"" 默认格式 yyyy-MM-dd
	 * @return
	 */
	public static Date string2Date(String strDate, String pattern) {
		if (strDate == null || strDate.equals("")) {
			return null;
		}
		if (pattern == null || pattern.equals("")) {
			pattern = DateUtil.PATTERN_DATE;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date date = null;

		try {
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 判断两个时间是否为同一天
	 * @param firstDate
	 * @param secondDate
	 * @return
	 */
	public static boolean compareDate(Date firstDate, Date secondDate) {
		if (firstDate == null || secondDate == null) {
			throw new java.lang.RuntimeException();
		}

		String strFirstDate = date2String(firstDate, "yyyy-MM-dd");
		String strSecondDate = date2String(secondDate, "yyyy-MM-dd");
		if (strFirstDate.equals(strSecondDate)) {
			return true;
		}
		return false;
	}
	/**
	 * 前后移动日期
	 * @param date
	 * @param move -1:向前移动一天，1:向后移动一天
	 * @return
	 */
	public static Date moveDate(Date date,int move){
		
		 Calendar calendar = new GregorianCalendar();
		 calendar.setTime(date);
		 calendar.add(calendar.DATE,move);//把日期往后增加一天.整数往后推,负数往前移动
		 return calendar.getTime(); //这个时间就是日期移动之后的时间
		
	}
	
	
	
	
	public static void main(String[] args){
		
		//System.out.println(moveDate(new Date(),1).toLocaleString());
		
		String t=date2String(new Date(), null);
		
		System.out.println(t);
		
		Timestamp end=string2Timestamp(t+" 23:59:59", null);
		
		System.out.println(end);
		
		System.out.println(string2Timestamp("2013-10-20 00:00:00", null).getTime());
	
	
		System.out.println("=========="+Pattern.matches("^192.168.1.*$", "192.168.2.1"));
	
	
	
	
	}
	
	
}
