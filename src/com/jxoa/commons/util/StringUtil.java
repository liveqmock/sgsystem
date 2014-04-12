/**  
 * @Project: jxoa
 * @Title: StringUtil.java
 * @Package com.jxoa.commons.util
 * @date 2013-6-6 下午03:40:21
 * @Copyright: 2013 
 */
package com.jxoa.commons.util;

import java.io.UnsupportedEncodingException;
import java.util.UUID;
 

/**
 * 
 * 类名：StringUtil
 * 功能：
 * 详细：
 * 作者：zcl
 * 版本：1.0
 * 日期：2013-6-6 下午03:40:21
 *
 */
public class StringUtil {

	
	

	/** 在字符串左侧补齐空格 */
	public final static int LEFT_SPACE = 0;
	/** 在字符串右侧补齐空格 */
	public final static int RIGHT_SPACE = 1;
	/** 如果字符串实际长度超出指定长度，将左侧截断 */
	public final static int TRUNC_LEFT = 0;
	/** 如果字符串实际长度超出指定长度，将右侧截断 */
	public final static int TRUNC_RIGHT = 1;

	/**
	 * 该方法去掉字符串的左边空格
	 * @param str   需要去掉左边空格的字符串
	 * @return String  已经去掉左边空格的字符串
	 */
	public static String leftTrim(String str) {
		if (str == null)
			return "";

		byte[] bytes = str.getBytes();
		int index = 0;
		byte ch;
		do {
			ch = bytes[index];
			if (ch != ' ')
				break;
			index++;
		} while (true);
		return str.substring(index);
	}

	/**
	 * 改方法去掉字符串的右边空格
	 * @param str   需要去掉右边空格的字符串
	 * @return String  已经去掉右边空格的字符串
	 */
	// duan_wliang update 2004-05-17
	public static String rightTrim(String str) {
		if (str == null)
			return "";

		byte[] bytes = str.getBytes();
		int index = StringUtil.length(str);

		String tmpStr = str.trim();
		if (index == 0)
			return "";

		index = index - 1;
		byte ch;
		do {
			ch = bytes[index];
			if (ch != ' ')
				break;
			index--;
		} while (index >= 0);

		return new String(str.getBytes(), 0, index + 1);
		//return str.substring(0, index + 1);

	}

	/**
	 *
	 * 将字符串中所有的空格删除，包括左边、右边、中间。
	 * @param str
	 */
	public static String allTrim(String str) {
		if (str == null) return "";
		String tmp = str.trim();
		if(tmp.equals("")) return "";
		int idx = 0;
		int len = 0;
		len = tmp.length();
		idx = tmp.indexOf(" ");
		while(idx > 0) {
			tmp = tmp.substring(0, idx) + tmp.substring(idx+1, len);
			idx = tmp.indexOf(" ");
			len = tmp.length();
		}

		return tmp;
	}

	/**
	 * 该方法首先判断传入的字符串是否是null,如果是null则返回"",否则对传入的字符串执行trim操作后返回trim的结果
	 * @param orin 需要进行处理的字符串
	 * @return String 处理完成的结果字符串
	 */
	public static String trim(String orin) {
		if (orin == null) {
			orin = "";
		}
		return orin.trim();
	}

	/**
	 * 该方法将传入的字符串扩充为指定长度的字符串,长度不足的话,补充空格
	 * 如果字符串长度大于指定的长度,就截断超出的那部分字符.
	 * @param str 需要处理的字符串
	 * @param len 指定的字符串长度
	 * @param direct    StringUtil.LEFT_SPACE    从左侧补充空格
	 *                   StringUtil.RIGHT_SPACE   从右侧补充空格
	 * @param truncWay  StringUtil.TRUNC_LEFT    从左侧截断空格
	 *                   StringUtil.TRUNC_RIGHT   从右侧截断空格
	 * @return 返回指定格式的字符串
	 */
	public static String alignStr(
		String str,
		int len,
		int direct,
		int truncWay) {

		return alignStr(str, len, direct, truncWay, ' ');

	}

	/**
	 * 该方法将传入的字符串扩充为指定长度的字符串,长度不足的话,以 fixStr 补充
	 * 如果字符串长度大于指定的长度,就截断超出的那部分字符.
	 * @param str 需要处理的字符串
	 * @param len 指定的字符串长度
	 * @param direct    StringUtil.LEFT_SPACE    从左侧补充空格
	 *                   StringUtil.RIGHT_SPACE   从右侧补充空格
	 * @param truncWay  StringUtil.TRUNC_LEFT    从左侧截断空格
	 *                   StringUtil.TRUNC_RIGHT   从右侧截断空格
	 * @param fixStr 用来填充的的字符
	 * @return 返回指定格式的字符串
	 */
	public static String alignStr(
		String str,
		int len,
		int direct,
		int truncWay,
		char fixStr) {

		/*
				if (str == null)
					return "";

				int l = length(str);
				if (l >= len) {
					if (truncWay == StringUtil.TRUNC_LEFT)
						return str.substring(l - len, l);
					else
						return str.substring(0, len);
				}

				StringBuffer sb = new StringBuffer(str);
				for (int i = l; i < len; i++) {
					if (direct == StringUtil.RIGHT_SPACE)
						sb = sb.insert(0, fixStr);
					else
						sb = sb.append(fixStr);
				}
				return sb.substring(0);
		*/
		if (str == null)
			return "";

		byte[] b = StringUtil.getBytes(str);
		int l = StringUtil.length(str);
		if (l >= len) {
			if (truncWay == StringUtil.TRUNC_LEFT)
				return new String(b, l - len, len);
			else
				return new String(b, 0, len);
		}

		StringBuffer sb = new StringBuffer(str);
		for (int i = l; i < len; i++) {
			if (direct == StringUtil.LEFT_SPACE)
				sb = sb.insert(0, fixStr);
			else
				sb = sb.append(fixStr);
		}
		return sb.substring(0);
	}

	/**
	 * 该方法计算字符串(包括中文)的实际长度.
	 * @param str 需要计算长度的字符串
	 * @return int 字符串的实际长度
	 */
	public static int length(String str) {

		if (str == null)
			return 0;
		try {
			return new String(str.getBytes("GBK"), "8859_1").length();
		} catch (UnsupportedEncodingException e) {
			return -1;
		}
	}

	/**
	 *
	 */
	public static byte[] getBytes(String str) {
		try {
			return str.getBytes("GBK");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "".getBytes();
		}
	}

	public static String getUUID() {
		UUID uuid = java.util.UUID.randomUUID();
		return uuid.toString();
		
	}
	public static void main(String[] args) {

		String str = "aaa        ";
		String str1 = null;

		System.out.println("str=[" + str + "]");
		System.out.println("str.left=[" + StringUtil.leftTrim(str) + "]");
		System.out.println("str.right=[" + StringUtil.rightTrim(str) + "]");

		System.out.println("null.trim=[" + StringUtil.trim(str1) + "]");
		str1 = "   ";
		System.out.println("null.trim=[" + StringUtil.trim(str1) + "]");
		str1 = "   aaa   ";
		System.out.println("null.trim=[" + StringUtil.trim(str1) + "]");

		str1 = "Hello交行";
		System.out.println("\"" + str1 + "\"的长度是:" + StringUtil.length(str1));

		str1 = "cvic";
		System.out.println(
			"10左 is ["
				+ StringUtil.alignStr(
					str1,
					8,
					StringUtil.LEFT_SPACE,
					StringUtil.TRUNC_RIGHT)
				+ "]");
		System.out.println(
			"10右 is ["
				+ StringUtil.alignStr(
					str1,
					8,
					StringUtil.RIGHT_SPACE,
					StringUtil.TRUNC_RIGHT)
				+ "]");

		System.out.println(
			"10右 is ["
				+ StringUtil.alignStr(
					str1,
					2,
					StringUtil.RIGHT_SPACE,
					StringUtil.TRUNC_LEFT)
				+ "]");
		System.out.println(
			"10右 is ["
				+ StringUtil.alignStr(
					str1,
					2,
					StringUtil.RIGHT_SPACE,
					StringUtil.TRUNC_RIGHT)
				+ "]");
		str1 = "中创";
		System.out.println(
			"10左 is ["
				+ StringUtil.alignStr(
					str1,
					8,
					StringUtil.LEFT_SPACE,
					StringUtil.TRUNC_RIGHT)
				+ "]");
		System.out.println(
			"10右 is ["
				+ StringUtil.alignStr(
					str1,
					8,
					StringUtil.RIGHT_SPACE,
					StringUtil.TRUNC_RIGHT)
				+ "]");

		str1 = "cvic";
		System.out.println(
			"10左 is ["
				+ StringUtil.alignStr(
					str1,
					8,
					StringUtil.LEFT_SPACE,
					StringUtil.TRUNC_RIGHT,
					'0')
				+ "]");
		System.out.println(
			"10右 is ["
				+ StringUtil.alignStr(
					str1,
					8,
					StringUtil.RIGHT_SPACE,
					StringUtil.TRUNC_RIGHT,
					'0')
				+ "]");
		System.out.println(
			"10右 is ["
				+ StringUtil.alignStr(
					str1,
					2,
					StringUtil.RIGHT_SPACE,
					StringUtil.TRUNC_LEFT,
					'0')
				+ "]");
		System.out.println(
			"10右 is ["
				+ StringUtil.alignStr(
					str1,
					2,
					StringUtil.RIGHT_SPACE,
					StringUtil.TRUNC_RIGHT,
					'0')
				+ "]");
		str1 = "中创";
		System.out.println(
			"10左 is ["
				+ StringUtil.alignStr(
					str1,
					4,
					StringUtil.LEFT_SPACE,
					StringUtil.TRUNC_RIGHT,
					'0')
				+ "]");
		System.out.println(
			"10右 is ["
				+ StringUtil.alignStr(
					str1,
					8,
					StringUtil.RIGHT_SPACE,
					StringUtil.TRUNC_RIGHT,
					'0')
				+ "]");

		System.out.println("[中创软件公司]进行rightTrim is:[" + StringUtil.rightTrim("中创软件公司") + "]");

		str1 = "中创软件1234567890";

		System.out.println(
			str1
				+ " 左截断 is ["
				+ StringUtil.alignStr(
					str1,
					8,
					StringUtil.RIGHT_SPACE,
					StringUtil.TRUNC_LEFT,
					'0')
				+ "]");

		System.out.println(
			str1
				+ " 右截断 is ["
				+ StringUtil.alignStr(
					str1,
					8,
					StringUtil.RIGHT_SPACE,
					StringUtil.TRUNC_RIGHT,
					'0')
				+ "]");

		str1 = " a 中 创 b ";
		System.out.println("[" + str1 + "] 删除空格后：" + "[" + StringUtil.allTrim(str1) + "]");
		System.out.println(StringUtil.length("leng7leng7leng7leng7leng7leng7leng7leng7多个手机号之间用，隔11111"));
	}
	
	
	
	
	
	
	
	 

}
