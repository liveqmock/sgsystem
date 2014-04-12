package com.jxoa.manager.wwb.action;



import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.wwb.bean.TbForum;
import com.jxoa.manager.wwb.service.IForumService;

/**
 * 类名：ForumAction 功能：社区服务--居民论坛
 * 
 * @author Administrator 日期：2014-03-20 14:36
 */

@Controller
@RequestMapping("/forum")
public class ForumAction extends BaseAction {

	@Autowired
	private IForumService forumservice;

	/**
	 * 1.跳转到论坛列表页面
	 * 
	 * @param model
	 * @return
	 */
	
	@RequestMapping("load")
	public String load(FormParam param,TbForum tbForum,Date startDate,Date endDate,ModelMap map){
		map.addAttribute("tbForums", forumservice.selectTbForum(param, tbForum, startDate, endDate));
		param.setAllCount(forumservice.selectTbForumCount(tbForum, startDate, endDate));
		map.addAttribute("fromParam",param);
		return "communityService/forum/load";
	}
	

	/**
	 * 2.跳转到发表新帖页面
	 */

	@RequestMapping("add")
	public String publish() {
		return "communityService/forum/addForum";
	}
	
	
	/**
	 * 3.发表新帖子
	 */
	@RequestMapping("addForum")
	public ModelAndView publishNew(TbForum tbForum) {
		return ajaxDone(forumservice.addForum(tbForum));
	}
	/**
	 * 4.批量删除帖子
	 */
	@RequestMapping("delete")
	public ModelAndView delete(String[] ids) {
		return ajaxDone(forumservice.delete(ids));
	}
	/**
	 * 5.查看帖子详情
	 */
	@RequestMapping("details")
	public String details(String id,ModelMap map){
		TbForum tbforum = forumservice.get(TbForum.class, id);
		if(tbforum==null){
			return NODATA;
		}
		map.addAttribute("tbforum", tbforum);
		return "communityService/forum/details";
	}
	
	
}
