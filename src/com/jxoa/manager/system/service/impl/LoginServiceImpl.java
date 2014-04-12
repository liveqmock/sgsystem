/**  
 * @Project: jxoa
 * @Title: LoginServiceImpl.java
 * @Package com.jxoa.manager.system.service.impl
 * @date 2013-4-1 下午3:23:32
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.BaseConfig;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.config.WebConfig;
import com.jxoa.commons.model.IpInfo;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.model.OnLineUser;
import com.jxoa.commons.util.AppUtil;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.IpUtil;
import com.jxoa.commons.util.MD5Util;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.system.bean.SyLoginLog;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.system.service.ILoginService;

/**
 * 
 * 类名：LoginServiceImpl
 * 功能：
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-1 下午3:23:32
 *
 */

@Service
public class LoginServiceImpl extends BaseServiceImpl implements ILoginService{
	

	public ModelAndView updateLogin(String vercode,String name,String password,HttpServletRequest request,HttpServletResponse response){
		
			ModelAndView mav = new ModelAndView("ajaxMessage");
			HttpSession session=request.getSession();
			
			/*if(StringUtils.isBlank(vercode)){
				mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
				mav.addObject(MsgConfig.MESSAGE,"msg.validation.code.empty");//验证码不能为空
				return mav;
			}
			
			if(!vercode.equalsIgnoreCase((String)session.getAttribute("imgCode"))){
				mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
				mav.addObject(MsgConfig.MESSAGE,"msg.validation.code.match");//验证码错误
				return mav;
			}
			*/
			SyUsers u=(SyUsers)dao.findOne("from SyUsers where userName = ?",name);
			if(u==null){
				System.out.println("不存在此用户");
				mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
				mav.addObject(MsgConfig.MESSAGE,"msg.login.failure");//用户名或密码错误， 请重新登录
	
				return mav;
			}
			if(u.getUserStatus()==(short)0){
				//用户被限制登陆
				mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
				mav.addObject(MsgConfig.MESSAGE,"msg.login.restrict");//用户被限制登陆，请联系管理员
				return mav;
			}
			
			//获取登录ip 
			String loginIp=IpUtil.getIpAddr(request);
			//IpInfo ipInfo=IpUtil.getIpInfo(loginIp);
			
			IpInfo ipInfo=new IpInfo();//模拟IP信息
			ipInfo.setIp(loginIp);
			ipInfo.setCountry("中国");
			ipInfo.setRegion("山东省");
			ipInfo.setCity("济南市");
			ipInfo.setIsp("联通");
			
			Timestamp loginTime=DateUtil.currentTimestamp();
			int num=BaseConfig.webconfig.getPwdErrorNum();
			int time=BaseConfig.webconfig.getPwdErrorTime();
			//判断用户密码输入错误的次数是否达到指定次数
			if(u.getErrorCount()>=num){
				//当用户密码输入错误次数大于系统配置的错误次数，获取错误时间 进行判断
				long gotime=loginTime.getTime()-u.getErrorTime().getTime();
				if(gotime<time*60000){
					//如果冷却时间未到
					
					mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
					mav.addObject(MsgConfig.MESSAGE,"msg.login.restricttime");//您已{0}次密码输入错误，请{1}之后再试！
					mav.addObject(MsgConfig.MESSAGEVALUES, num+","+time+"分钟");//占位符赋值
					return mav;
				}else{
					//如果冷却时间已到 将用户输入错误的次数重置
					u.setErrorCount((short)0);
					
				}
				
			}
			if(MD5Util.MD5Validate(password, u.getUserPassword())){
				
				
				if(u.getId().equals(BaseConfig.getInstance().getDevId())){
					session.setAttribute("dev", true);//当前登陆用户是开发者，拥有所有权限
				}else{
					session.setAttribute("dev", false);
				}
				if(u.getId().equals(BaseConfig.getInstance().getSaId())){
					session.setAttribute("sa", true);//当前登陆用户是系统超级管理员
				}else{
					session.setAttribute("sa", false);
				}
				
				//验证系统访问限制，先排除超级管理员
				if(!u.getId().equals(BaseConfig.getInstance().getDevId())||!u.getId().equals(BaseConfig.getInstance().getSaId())){
					WebConfig wc=BaseConfig.webconfig;
					//先判断系统是否禁止登陆
					if(wc.getAppStart()!=1){
						//禁止登陆系统
						
						mav.setViewName("ajaxDone");
						mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
						mav.addObject(MsgConfig.MESSAGE,"系统已设置禁止访问！请联系管理员！");
						return mav;
						
					}
					//判断是否在可以登录的时间范围内
					
					if(!AppUtil.checkLoginTime(new Date(), wc.getLoginStartTime(), wc.getLoginEndTime())){
						//不符合使用范围
						
						mav.setViewName("ajaxDone");
						mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
						mav.addObject(MsgConfig.MESSAGE,"系统只能在"+ wc.getLoginStartTime()+" 至 "+wc.getLoginEndTime()+"之间才能访问！");
						return mav;
					}
					//进行ip验证
					if(StringUtils.isNotBlank(wc.getAllowIps())&&!AppUtil.checkIp(wc.getAllowIps(), loginIp)){
						
						mav.setViewName("ajaxDone");
						mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
						mav.addObject(MsgConfig.MESSAGE,"系统已设置ip限制！");
						return mav;
					}else{
						
						if(StringUtils.isNotBlank(wc.getLimitIps())&&AppUtil.checkIp(wc.getLimitIps(), loginIp)){
							
							mav.setViewName("ajaxDone");
							mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);
							mav.addObject(MsgConfig.MESSAGE,"系统已设置ip限制！");
							return mav;
						}
						
					}
				}
				System.out.println("****登陆成功*****");
				
				Member me=new Member();//需要放入当前session 的用户信息
				
				me.setId(u.getId());
				me.setIpInfo(ipInfo);
				me.setLoginTime(loginTime);
				
				session.setAttribute("minfo",me ); //将当前用户信息存入session中
				
				//获取全局 用户列表
				Map<String,OnLineUser> usersMap=ServletUtil.getOnLineUsers();
				
				OnLineUser onmy=new OnLineUser();
				onmy.setId(u.getId());
				onmy.setSessionId(session.getId());
				onmy.setIp(loginIp);
				onmy.setIpInfo(ipInfo);
				usersMap.put(u.getId(), onmy);//将当前用户信息放入在线用户列表
				
				//登录日志
				SyLoginLog log=new SyLoginLog();
				log.setUserId(u.getId());
				if("x.x.x.x".equals(u.getLastLoginIp())){
					log.setLoginType("首次登录系统");
				}else{
					log.setLoginType("登录成功");
				}
				log.setIpInfoCountry(ipInfo.getCountry());
				log.setIpInfoRegion(ipInfo.getRegion());
				log.setIpInfoCity(ipInfo.getCity());
				log.setIpInfoIsp(ipInfo.getIsp());
				log.setLoginIp(loginIp);
				log.setLoginTime(loginTime);
				
				dao.save(log);//保存登录日志
				
				u.setLastLoginIp(loginIp);//登录ip
				u.setLastLoginTime(loginTime);//登录时间
				u.setErrorCount((short)0);//将密码错误次数重置为0
				dao.update(u);//更新用户登录时间和IP
				
				mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_SUCCESS);
				mav.addObject(MsgConfig.MESSAGE,"msg.login.success");//登录成功
				session.removeAttribute("jmpw");//清除加密密码
				return mav;
			}else{
				System.out.println("密码错误");
				//登录日志
				SyLoginLog log=new SyLoginLog();
				log.setUserId(u.getId());
				if("x.x.x.x".equals(u.getLastLoginIp())){
					log.setLoginType("首次登录密码错误");
				}else{
					log.setLoginType("登录密码错误");
				}
				log.setIpInfoCountry(ipInfo.getCountry());
				log.setIpInfoCity(ipInfo.getCity());
				log.setIpInfoIsp(ipInfo.getIsp());
				log.setIpInfoRegion(ipInfo.getRegion());
				log.setLoginIp(loginIp);
				log.setLoginTime(loginTime);
				
				dao.save(log);//保存登录日志
				
				u.setErrorTime(loginTime);
				u.setErrorCount((short)(u.getErrorCount()+1));
				
				dao.update(u);//更新用户
			
				mav.addObject(MsgConfig.STATUSCODE, MsgConfig.CODE_FAIL);//用户名或密码错误， 请重新登录
				mav.addObject(MsgConfig.MESSAGE,"msg.login.failure");
				return mav;
			}
		
		}
}
