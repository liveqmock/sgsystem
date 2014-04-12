/**  
 * @Project: jxoa
 * @Title: MainAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-4-1 下午3:18:28
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.action;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.config.BaseConfig;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.common_platform.bean.Newsmanagement;
import com.jxoa.manager.common_platform.bean.XtAffiche;
import com.jxoa.manager.common_platform.bean.XtAfficheDept;
import com.jxoa.manager.common_platform.service.IAfficheService;
import com.jxoa.manager.common_platform.service.IMeetingService;
import com.jxoa.manager.common_platform.service.INewsService;
import com.jxoa.manager.personalOffice.bean.Email;
import com.jxoa.manager.personalOffice.bean.PerInstantMessage;
import com.jxoa.manager.personalOffice.bean.PerMsg;
import com.jxoa.manager.personalOffice.service.IEmailService;
import com.jxoa.manager.personalOffice.service.IInstantMessageService;
import com.jxoa.manager.personalOffice.service.IPerMsgService;
import com.jxoa.manager.personalOffice.service.IScheduleService;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.system.service.IDeptService;
import com.jxoa.manager.system.service.IMainService;

/**
 * 
 * 类名：MainAction
 * 功能：系统主界面
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-1 下午3:18:28
 *
 */
@Controller
@RequestMapping("/main")
public class MainAction extends BaseAction{
	
	@Autowired
	private IMainService service; 
	@Autowired
	private IDeptService deptService; //部门
	@Autowired
	private IPerMsgService perMsgService; //消息提醒
	@Autowired
	private IInstantMessageService instantMessageService;//即时沟通
	@Autowired
	private IScheduleService scheduleService;//日程安排
	@Autowired
	private IAfficheService afficheService;//公告
	@Autowired
	private IMeetingService meetingService;//会议
	@Autowired
	private INewsService newsService;//新闻
	@Autowired
	private IEmailService emailService;//邮件
	

	
	/**
	 * 跳转到系统主界面  刷新主界面将会执行此方法
	 * @return
	 */
	@RequestMapping("")
	public String tologin(ModelMap map){
		
		Member me=ServletUtil.getMember();
		
		SyUsers	user=service.get(SyUsers.class, me.getId());
		user.setUserPassword("******");
		map.addAttribute("user",user);
		map.addAttribute("menus",JSON.toJSONString(service.init(user)));
		
		Set<String> urls=ServletUtil.getMember().getUrls();
		boolean isDev=(Boolean)ServletUtil.getSession().getAttribute("dev");
		if(isDev||urls.contains("main.do")){
			map.addAttribute("onlineNum",ServletUtil.getOnLineUsers().size() );
			FormParam param=new FormParam ();
			param.setNumPerPage(5);//只查询5条
			
			if(isDev||urls.contains("affiche/load/my.7do")){
				//查询系统公告
				map.addAttribute("affiche",afficheService.selectAffiche(param, new XtAffiche(), null, null));
			}
			if(isDev||urls.contains("affiche/dept/load/my.do")){
				//查询部门公告
				XtAfficheDept ad=new XtAfficheDept();
				ad.setDeptId(me.getDeptId());
				map.addAttribute("afficheDept",afficheService.selectAfficheDept(param, ad, null, null));
			}
		/*	if(isDev||urls.contains("scoringMonth/query.do")){
				//查询积分排名
				Scoring sm=new Scoring();
				if(true){
				String type="402881e53ff988d2013ff9a5b9f80002";
				List<Scoring> smList=scoringService.scoringLoad(param, sm,type);
				List<Scoring> l=new ArrayList<Scoring>();
				
				
				//挨个遍历算出排名然后封装返回
				for(int i=0;i<smList.size();i++){
					Scoring s=smList.get(i);
					s.setRank(""+scoringService.staffRank(s.getSmMinute(),s.getSmYear(),s.getSmDate(),type));
					l.add(s);
				}
				map.addAttribute("one",l );
				}
				if(true){
				
				String type="402881e53ff988d2013ff9a5f9520004";
				List<Scoring> smList=scoringService.scoringLoad(param, sm,type);
				List<Scoring> l=new ArrayList<Scoring>();
				
				
				//挨个遍历算出排名然后封装返回
				for(int i=0;i<smList.size();i++){
					Scoring s=smList.get(i);
					s.setRank(""+scoringService.staffRank(s.getSmMinute(),s.getSmYear(),s.getSmDate(),type));
					l.add(s);
				}
				map.addAttribute("two",l );
				}
			}*/
			
			/*if(isDev||urls.contains("schedule/load.do")){
				//查询今日日程安排
				Date now=new Date();
				Date tomorrow=DateUtil.moveDate(now, 1);
				
				PerSchedule ps=new PerSchedule();
				ps.setUserId(me.getId());

				map.addAttribute("schedule",scheduleService.selectSchedule(param, ps, DateUtil.string2Date(DateUtil.date2String(now, null), null), DateUtil.string2Date(DateUtil.date2String(tomorrow, null), null)));
			}
			if(isDev||urls.contains("meeting/loadtome.do")){
				//我的会议
				map.addAttribute("meetings", meetingService.selectMeetingTome(param, new Meeting()));			
			}*/
			if(isDev||urls.contains("msgwarn/load.do")){
				//查询出我的未读消息提醒
				PerMsg msg=new PerMsg();
				msg.setUserId(ServletUtil.getMember().getId());
				msg.setReadState((short)0);
				map.addAttribute("permsgs",perMsgService.selectPerMsg(param, msg, null, null));
			}
			if(isDev||urls.contains("news/load_news.do")){
				//新闻
				Newsmanagement news=new Newsmanagement();
				news.setStatus(1);
				map.addAttribute("news",newsService.newsload(param,news));
			}
			if(isDev||urls.contains("email/loadIn.do")){
				//收件箱
				Email email=new Email();
				map.addAttribute("emails",emailService.selectEmInbox(param, email,"未读"));
			}
			
			
			if(isDev||urls.contains("main/online.do")){
				//有查看在线人员的权限
				map.addAttribute("showOnLine",true);
			}
			if(isDev||urls.contains("schedule/queryWarn.do")){
				//有日程安排提醒权限
				map.addAttribute("scheduleWarn",true);
			}
			if(isDev||urls.contains("main/warnmsg.do")){
				//消息提醒
				map.addAttribute("msgWarn",true);
				map.addAttribute("msgWarnTime",BaseConfig.webconfig.getMsgwarnTime());
			}
			return "main";			
		}else{
			return "redirect:/nopower.jsp";
		}
		
	}
	/**
	 * 查询在线人员列表，部门列表，在线人员数量
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("online")
	public ModelAndView online(){
		
		Map map=new HashMap();
		map.put(MsgConfig.STATUSCODE, MsgConfig.CODE_SUCCESS);
		map.put("users", ServletUtil.getOnLineUsers());
		map.put("depts", deptService.selectAllDepts());
		map.put("onlineNum",ServletUtil.getOnLineUsers().size() );
		
		return ajaxJson(map);
		
	}
	
	/**
	 * 查询未读信息，页面Ajax定时请求
	 * @param id
	 * @param map
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("warnmsg")
	public ModelAndView queryNotReadNum(){
		Member me=ServletUtil.getMember();
		Map map=new HashMap();
		
		map.put(MsgConfig.STATUSCODE, MsgConfig.CODE_SUCCESS);
		//在线人员数量
		map.put("onlineNum",ServletUtil.getOnLineUsers().size());
		
		if(ServletUtil.isDeveloper()||me.getUrls().contains("msgwarn/load.do")){
			//消息提醒数量
			map.put("warnmsg_num",perMsgService.selectNotReadNumber());
		}
		if(ServletUtil.isDeveloper()||me.getUrls().contains("instantMessage/load.do")){
			PerInstantMessage im=new PerInstantMessage();
			im.setReceiveUid(me.getId());
			im.setReadState((short)0);
			//即时沟通未读信息数量
			map.put("instantmsg_num",instantMessageService.selectInstantMessageCount(im, null, null));
		}
		if(ServletUtil.isDeveloper()||me.getUrls().contains("schedule/load.do")){
			//查询出当天的日程安排数量
			map.put("todaySchedule_num",scheduleService.selectTodayScheduleCount());
		}
		if(ServletUtil.isDeveloper()||me.getUrls().contains("email/loadIn.do")){
			map.put("email_num",emailService.selectEmInboxCount( new Email(),"未读"));
		}
		
		
		
		
		
		return ajaxJson(map);
	}
	
	
	
	
}
