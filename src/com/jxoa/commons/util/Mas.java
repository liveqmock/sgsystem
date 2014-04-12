/**  
 * @Project: ktxs
 * @Title: Mas.java
 * @Package com.jxoa.commons.util
 * @date 2013-7-22 上午10:38:14
 * @Copyright: 2013 
 */
package com.jxoa.commons.util;

import com.huawei.eie.api.sm.DBSMProxy;
import com.huawei.eie.api.sm.SmReceiveBean;
import com.huawei.eie.api.sm.SmSendBean;  
import com.huawei.eie.api.sm.SmSendResultBean;
import com.jxoa.commons.config.BaseConfig;
import com.jxoa.manager.personalOffice.bean.SmsStencil;

import java.text.ParseException;
import java.text.SimpleDateFormat; 
import java.util.Date;
import java.util.HashMap; 
import java.util.Map;
/**
 * 
 * 类名：Mas
 * 功能：
 * 详细：
 * 作者：zcl
 * 版本：1.0
 * 日期：2013-7-22 上午10:38:14
 *
 */
public class Mas {

	/** 
	 * @param args
	 */
	public static void main(String[] args) {
	 

	}
	/***
	 * 发送单条短信
	 * @param phone
	 * @param content
	 * @throws Exception
	 */
	  @SuppressWarnings("unchecked")
		public static int[] sendM(String phone, String content) throws Exception {
		  //判断短信是否开启
		  if(BaseConfig.masconfig.getOpen().equals("1")){
		   
		    //处理手机号 
		    String[] number =phone.split("，|,");
		    DBSMProxy smproxy = new DBSMProxy();
		    Map paras = new HashMap();
		    
		    System.out.println(BaseConfig.masconfig.getLpw());
		   // paras.put("url", "jdbc:microsoft:sqlserver://218.201.155.100:1433;DatabaseName=db_customsms");
		 	paras.put("url", BaseConfig.masconfig.getUrl());

		    //数据库账户
		  //  paras.put("user", "CustomSMS");
		    paras.put("user",  BaseConfig.masconfig.getLuser());
		  //数据库密码
		  //  paras.put("password", "SqlMsde@InfoxEie2000");
		    paras.put("password", BaseConfig.masconfig.getLpw());
		    smproxy.initConn(paras);
		    //网关登录账户密码
		   // smproxy.login("admin", "dwndm");
		    smproxy.login(BaseConfig.masconfig.getUser(),BaseConfig.masconfig.getPw());
		    SmSendBean bean = new SmSendBean();
		      
		    bean.setSmDestAddrs(number);
		    bean.setSmMsgContent(content);
		    //服务代码
		    //106573160039
		    bean.setSmOrgAddr(BaseConfig.masconfig.getOrgaddr());
		 //   bean.setTaskName("wztest");
		    bean.setTaskName("415089"); 
		    //业务代码 MSD1210101 
		    bean.setSmServiceId(BaseConfig.masconfig.getServiceid());
		    //发送开始时间
		   long firstTime = System.currentTimeMillis();
		   int[] sm_ids = smproxy.sendSm(bean);
		   //发送结束时间 m.c
		   long lastTime = System.currentTimeMillis();
		   System.out.println("开始："+firstTime+"-结束时间："+lastTime+"相差"+((lastTime-firstTime)));
		   for(int sm_id: sm_ids){
			   System.out.println("sm_id"+sm_id);
		   }
		    smproxy.destroy();
		    
		    return sm_ids;
		 	
		    }else{ 
		    	//短信开关关闭
		    	return  new int[0];
		    	
		    }
		  }

	  @SuppressWarnings("unchecked")
     public static int[] sendJiFen(String phone,SmsStencil smsStencil) throws Exception {
		  //判断短信是否开启
		  if(BaseConfig.masconfig.getOpen().equals("1")){
			  //短信模板
			  /***
			   * ,[1]代表姓名,[2]代表本月积分,[3]代表本月积分排名,[4]代表本年度积分,[5]代表本年度积分排名,
			   * [6]代表当前月份,[7]代表当前年份,[8]代表变化积分,[9]考核内容
			   */
		    StringBuffer content = new StringBuffer(BaseConfig.masconfig.getSmsTemplate());
		    content = new StringBuffer(content.toString().replaceFirst("[1]", smsStencil.getUserName()));
		    content = new StringBuffer(content.toString().replaceFirst("[2]", smsStencil.getMonthMinute()));
		    content = new StringBuffer(content.toString().replaceFirst("[3]", smsStencil.getMonthRank()));
		    content = new StringBuffer(content.toString().replaceFirst("[4]", smsStencil.getYearMinute()));
		    content = new StringBuffer(content.toString().replaceFirst("[5]", smsStencil.getYearRank()));
		    content = new StringBuffer(content.toString().replaceFirst("[6]", smsStencil.getMonth()));
		    content = new StringBuffer(content.toString().replaceFirst("[7]", smsStencil.getYear()));
		    content = new StringBuffer(content.toString().replaceFirst("[8]", smsStencil.getMinute()));
		    content = new StringBuffer(content.toString().replaceFirst("[9]", smsStencil.getName())); 
		    String a="cabcdabcabcabc";
		     a = a.replaceFirst("abc","cba");
			 
		    //处理手机号 
		    String[] number =phone.split("，|,");
		    DBSMProxy smproxy = new DBSMProxy();
		    Map paras = new HashMap();
		     
		 	paras.put("url", BaseConfig.masconfig.getUrl());
 
		    paras.put("user",  BaseConfig.masconfig.getLuser()); 
		    paras.put("password", BaseConfig.masconfig.getLpw());
		    smproxy.initConn(paras); 
		    smproxy.login(BaseConfig.masconfig.getUser(),BaseConfig.masconfig.getPw());
		    SmSendBean bean = new SmSendBean();
		      
		    bean.setSmDestAddrs(number);
		    bean.setSmMsgContent(content.toString()); 
		    bean.setSmOrgAddr(BaseConfig.masconfig.getOrgaddr()); 
		    bean.setTaskName("415089");  
		    bean.setSmServiceId(BaseConfig.masconfig.getServiceid());
		    //发送开始时间
		   long firstTime = System.currentTimeMillis();
		   int[] sm_ids = smproxy.sendSm(bean);
		   //发送结束时间 m.c
		   long lastTime = System.currentTimeMillis();
		  
		    smproxy.destroy(); 
		    return sm_ids;
		 	
		    }else{ 
		    	//短信开关关闭
		    	return  new int[0];
		    	
		    }
		  }

	  
	  
   /**
    * 查看发送情况
    * @param sm_id
    * @param fromTime
    * @param endTime
    * @param orgAddr 发送地址(可根据地址查看)
    * @param destAddr 
    * @throws Exception
    */
	 @SuppressWarnings("unchecked")
	public static SmSendResultBean[] querysmResult(int sm_id,Date fromTime,Date endTime,String orgAddr,String destAddr) throws Exception{
		    DBSMProxy smproxy = new DBSMProxy();
		    Map paras = new HashMap();
		    paras.put("url", "jdbc:microsoft:sqlserver://218.201.155.100:1433;DatabaseName=db_customsms");
		  //数据库账户
		    paras.put("user", "CustomSMS");
		  //数据库密码
		    paras.put("password", "SqlMsde@InfoxEie2000");
		    smproxy.initConn(paras);
		    //网关登录账户密码
		    smproxy.login("admin", "dwndm");
		 
		    SmSendResultBean[] beans = smproxy.querySmsResult(sm_id,fromTime,endTime,orgAddr,destAddr);
		    smproxy.destroy();
		    for (SmSendResultBean bean:beans)
		    {
		      System.out.println("beangetSmMsgContent:"+bean.getSmMsgContent());
		      System.out.println("getSendSMID:"+bean.getSendSMID());
		      System.out.println("getSmMsgStatus:"+bean.getSmMsgStatus());
		      System.out.println("getSmRecvStatus0：成功:"+bean.getSmRecvStatus());
		      System.out.println("getSmMsgID:"+bean.getSmMsgID());
		      System.out.println("getSmOrgAddr:"+bean.getSmOrgAddr());
		    }
		    return beans;
	 }
	  
	@SuppressWarnings("unchecked")
	public static void queryReceivedSM(String fromTime,String endTime)throws Exception{
		
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		 Date time1 = sdf.parse(fromTime);
		 Date time2 = sdf.parse(endTime);
		 DBSMProxy smproxy = new DBSMProxy();
		    Map paras = new HashMap();
		    paras.put("url", "jdbc:microsoft:sqlserver://218.201.155.100:1433;DatabaseName=db_customsms");
		  //数据库账户
		    paras.put("user", "CustomSMS");
		  //数据库密码
		    paras.put("password", "SqlMsde@InfoxEie2000");
		    smproxy.initConn(paras);
		    //网关登录账户密码
		    smproxy.login("admin", "dwndm");
		    SmReceiveBean[] beans = smproxy.getReceivedSms(100 , time1, time2,"1065731600390000",null);
		  for(SmReceiveBean bean : beans ){
			  System.out.println("getSmDestAddr-"+bean.getSmDestAddr());
			  System.out.println("getSmId-"+bean.getSmId());
			  System.out.println("-"+bean.getSmOrgAddr());
			  System.out.println("-"+bean.getSmRecvTime());
			  System.out.println("-"+bean.getSmMsgContent());
			  System.out.println("-"+bean.getSmType());
			  System.out.println("-"+bean.getSmType());
		  }smproxy.destroy();
	}
	  
	  
	  
	  
	 
	/***
	 * 批量发送
	 */
	  @SuppressWarnings("unchecked")
	public static int [] sendMessage(String[] number, String content) throws Exception {
		  //判断短信是否开启
		if(BaseConfig.masconfig.getOpen().equals("1")){
			
		DBSMProxy smproxy = new DBSMProxy();
	    Map paras = new HashMap();
	    paras.put("url",BaseConfig.masconfig.getUrl());
	  //数据库账户
	    paras.put("user", BaseConfig.masconfig.getLuser());
	  //数据库密码
	    paras.put("password", BaseConfig.masconfig.getUser());
	    smproxy.initConn(paras);
	    //网关登录账户密码
	    smproxy.login(BaseConfig.masconfig.getUser(), BaseConfig.masconfig.getPw());
	    SmSendBean bean = new SmSendBean();
	    bean.setSmDestAddrs(number);
	    bean.setSmMsgContent(content);
	    //服务代码
	    bean.setSmOrgAddr(BaseConfig.masconfig.getOrgaddr());
	 //   bean.setTaskName("wztest");
	    bean.setTaskName("415089"); 
	    //业务代码
	    bean.setSmServiceId(BaseConfig.masconfig.getServiceid());
	   int[] smscount = smproxy.sendSm(bean);
	   for(int count: smscount){
		   System.out.println(count);
	   }
	    smproxy.destroy();
	    return smscount;
	  }else{ 
	    	//短信开关关闭
	    	return  new int[0];
	  }
	  }
	  
  
}
