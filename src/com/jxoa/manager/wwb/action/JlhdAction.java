package com.jxoa.manager.wwb.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.wwb.bean.TbForum;
import com.jxoa.manager.wwb.service.IForumService;

/**
 * 功能：交流互动：
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/jlhd")
public class JlhdAction extends BaseAction {

	@Autowired
	private IForumService forumservice;

	@RequestMapping("jlhd")
	public String jlhd() {
		return "wwb/jlhd";
	}

	@RequestMapping("list")
	public String list(FormParam param, TbForum tbForum, Date startDate,
			Date endDate, ModelMap map) {
		map.addAttribute("tbForums",
				forumservice.selectTbForum(param, tbForum, startDate, endDate));
		param.setAllCount(forumservice.selectTbForumCount(tbForum, startDate,
				endDate));
		map.addAttribute("fromParam", param);
		return "wwb/list";
	}

	@RequestMapping("detail")
	public String detail(String id, ModelMap map) {
		map.addAttribute("id", id);
		return "wwb/detail";
	}

	@RequestMapping("forumdetail")
	public String forumdetail(String id, ModelMap map) {
		TbForum tbforum = forumservice.get(TbForum.class, id);

		if (tbforum == null) {
			return NODATA;
		} else {
			System.out.println(tbforum.getContent() + "------------");
			System.out.println(tbforum.getUsername());
		}
		map.addAttribute("tbforum", tbforum);
		return "wwb/forumdetail";
	}
}
