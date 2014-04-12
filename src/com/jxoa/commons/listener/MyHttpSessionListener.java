/**  
 * @Project: jxoa
 * @Title: MyHttpSessionListener.java
 * @Package com.jxoa.commons.listener
 * @date 2013-4-11 上午8:46:26
 * @Copyright: 2013 
 */
package com.jxoa.commons.listener;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jxoa.commons.model.IpInfo;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.model.OnLineUser;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.manager.system.bean.SyLoginLog;
import com.jxoa.manager.system.service.ILoginService;

/**
 * 
 * 类名：MyHttpSessionListener
 * 功能：session监听器
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-11 上午8:46:26
 *
 */
public class MyHttpSessionListener implements HttpSessionListener{
	
	/**
	 * session创建
	 */
	@Override
	public void sessionCreated(HttpSessionEvent e) {
		HttpSession session=e.getSession();
		System.out.println("session创建===ID===="+session.getId());
		
		//获取全局在线用户
		Map<String,OnLineUser> usersMap =(Map<String,OnLineUser>)session.getServletContext().getAttribute("onLineUsers");
		
		System.out.println("当前用户在线数量:"+usersMap.size());
	}
	/**
	 * session销毁
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void sessionDestroyed(HttpSessionEvent e) {
		
		HttpSession session=e.getSession();
		System.out.println("销毁的sessionID===="+session.getId());
		//获取当前用户
		Member me=(Member)session.getAttribute("minfo");
		//获取全局在线用户
		Map<String,OnLineUser> usersMap =(Map<String,OnLineUser>)session.getServletContext().getAttribute("onLineUsers");
		System.out.println("当前用户在线数量:"+usersMap.size());
		if(me!=null){
			OnLineUser ol=usersMap.get(me.getId());
			if(ol!=null&&session.getId().equals(ol.getSessionId())){
				
				usersMap.remove(me.getId());//当前销毁的session如果存在于在线集合，就去删除，如果不在，则不需要删除
				
				//保存退出日志
				ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
				
				ILoginService service=ac.getBean(ILoginService.class);

				IpInfo ipInfo= me.getIpInfo();
				//登录日志
				SyLoginLog log=new SyLoginLog();
				log.setUserId(me.getId());
				if(session.getAttribute("isOut")!=null){
					log.setLoginType("正常退出("+DateUtil.timestamp2String(DateUtil.currentTimestamp(), "MM-dd HH:mm:ss")+")");
				}else{
					log.setLoginType("非正常退出("+DateUtil.timestamp2String(DateUtil.currentTimestamp(), "MM-dd HH:mm:ss")+")");
				}
				log.setIpInfoCountry(ipInfo.getCountry());
				log.setIpInfoRegion(ipInfo.getRegion());
				log.setIpInfoCity(ipInfo.getCity());
				log.setIpInfoIsp(ipInfo.getIsp());
				log.setLoginIp(ipInfo.getIp());
				log.setLoginTime(me.getLoginTime());
				
				service.save(log);//保存登录日志
				
			}
			Map<String,String> userId2Name=(Map<String,String>)session.getServletContext().getAttribute("userId2Name");
			
			System.out.println("用户:"+userId2Name.get(me.getId())+"下线之后，用户在线数量:"+usersMap.size());
			Timestamp loginTime=me.getLoginTime();
			long nowTime=System.currentTimeMillis()-loginTime.getTime();
			System.out.println("登录时间:"+loginTime+"在线时长:"+((double)nowTime/1000/60)+"分钟");
			
		}else{
			System.out.println("session中无用户");
		}

		
	}

}
