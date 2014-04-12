/**  
 * @Project: jxoa
 * @Title: NewsAction.java
 * @Package com.jxoa.manager.common_platform.action
 * @date 2013-5-19 上午10:25:25
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.action;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.common_platform.bean.Messagemanager;
import com.jxoa.manager.common_platform.service.MessageService;

/**
 * 
 * 类名：NewsAction
 * 功能：留言板
 * 详细：
 * 版本：1.0
 *
 */
@Controller
@RequestMapping("message")
public class MessageAction extends BaseAction{
	@Autowired
	private MessageService messageService;
	/**
	 * 查询留言板
	 * 
	 * @return
	 * 
	 */
	@RequestMapping("load")
	public String load(FormParam param,Messagemanager ng, ModelMap map){
		
		map.addAttribute("message",messageService.messageload(param,ng));
		param.setAllCount(messageService.selectCount(ng));
		map.addAttribute("fromParam", param);
		return "common_platform/message/load";
	}
	/**
	 * 删除新闻
	 * 
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		return ajaxDone(messageService.deletemes(ids));
	}
	
	/**
	 *查询点击修改按扭时传过来要修改的记录 
	 * @param id
	 * @param mn
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String jumpupdate(String id,ModelMap map){
		Messagemanager ng=messageService.get(Messagemanager.class, id);
		if(ng==null){
		return NODATA;
		}
		String date = getNowdate();
		Timestamp tamp = null;
		tamp = DateUtil.currentTimestamp();
		ng.setReplydatetime(tamp);
		Member me=ServletUtil.getMember();
		if(ng.getReplypep()==null){
			ng.setReplypep(me.getId());
		}
		if(ng.getReplydatetime()==null){
			ng.setReplydatetime(DateUtil.string2Timestamp(getNowdate(),"yyyy-MM-dd HH:mm:ss"));
		}
		map.addAttribute("message",ng );
		
		return "common_platform/message/update";
	}
	
	/**
	 * 回复
	 * @param mn
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(Messagemanager messagemanager){
		messagemanager.setModifiedate(DateUtil.currentTimestamp());
		return ajaxDone(messageService.updateMessage(messagemanager));
	}
	/**
	 *查询点击查看详细
	 * @param id
	 * @param mn
	 * @param map
	 * @return
	 */
	@RequestMapping("check")
	public String queryMessage(String id,ModelMap map){
		Messagemanager ng=messageService.get(Messagemanager.class, id);
		if(ng==null){
		return NODATA;
		}
		String date = getNowdate();
		Timestamp tamp = null;
		tamp = DateUtil.currentTimestamp();
		ng.setReplydatetime(tamp);
		Member me=ServletUtil.getMember();
		ng.setReplypep(me.getId());
		map.addAttribute("message",ng );
		
		return "common_platform/message/check";
	}
	
	public String getNowdate(){
		String temp_str="";   
	    Date dt = new Date();   
	    //最后的aa表示“上午”或“下午”    HH表示24小时制    如果换成hh表示12小时制   
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
	    temp_str=sdf.format(dt);   
	    return temp_str;
	}
	
}
