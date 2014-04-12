/**  
 * @Project: jxoa
 * @Title: NewsAction.java
 * @Package com.jxoa.manager.common_platform.action
 * @date 2013-5-19 上午10:25:25
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.action;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.ExcelUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.commons.util.sqlserverUtil;
import com.jxoa.manager.common_platform.bean.Newscomment;
import com.jxoa.manager.common_platform.bean.Newsmanagement;
import com.jxoa.manager.common_platform.service.INewsService;

/**
 * 
 * 类名：NewsAction
 * 功能：查询新闻
 * 详细：
 * 作者：QinXiaohua
 * 版本：1.0
 * 日期：2013-5-19 上午10:25:25
 *
 */
@Controller
@RequestMapping("news")
public class NewsAction extends BaseAction{
	@Autowired
	private INewsService inewsService;
	/**
	 * 查询新闻
	 * 
	 * @return
	 * 
	 */
	@RequestMapping("loadnews")
	public String loadnews(FormParam param,Newsmanagement ng, ModelMap map){
		map.addAttribute("news",inewsService.newsload(param,ng));
		param.setAllCount(inewsService.selectCount(ng));
		map.addAttribute("fromParam", param);
		return "common_platform/news/load";
	}
	/**
	 * 删除新闻
	 * 
	 * @return
	 */
	@RequestMapping("delete")
	public ModelAndView delete(String[] ids){
		return ajaxDone(inewsService.deletenews(ids));
	}
	/**
	 * 跳转到增加新闻
	 * @return
	 */
	@RequestMapping("addPage")
	public String jumpadd(){
		return "common_platform/news/add";
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
		Newsmanagement ng=inewsService.get(Newsmanagement.class, id);
		if(ng==null){
		return NODATA;
		}
		map.addAttribute("news",ng );
		return "common_platform/news/update";
	}
	/**
	 * 增加新闻
	 * @param mn
	 * @param errors
	 * @param request
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView addnews(@Valid Newsmanagement mn, Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
        Member me=ServletUtil.getMember();
        mn.setPromulgator(me.getId());
        mn.setStatus(0);
		if(mn.getStick()==null){
			mn.setStick(0);
		}
        mn.setHits(0);
		mn.setContents(0);
		mn.setCreatedtime(DateUtil.currentTimestamp());
	    mn.setModifiedate(DateUtil.currentTimestamp());
	    inewsService.save(mn);
	    String ip="192.168.0.4";
	    String sql="insert into Newsmanagement(id,newstitle,typeid,createdtime,modifiedate) values('5','123','313',21,1)";


	    sqlserverUtil.zhixsql(ip,sql);
		return ajaxDone(inewsService.save(mn));
	}
	/**
	 * 修改新闻
	 * @param mn
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(Newsmanagement mn){
        Member me=ServletUtil.getMember();
        mn.setModifyByname(me.getId());
		if(mn.getStick()==null){
			mn.setStick(0);
		}
	    mn.setModifiedate(DateUtil.currentTimestamp());
		return ajaxDone(inewsService.updatenews(mn));
	}
	/**
	 * 跳转到新闻内容查看页面
	 * @param id
	 * @param param
	 * @param map
	 * @return
	 */
	@RequestMapping("look")
	public String look(String id,FormParam param,ModelMap map){
		map.addAttribute("n",inewsService.updateSelectOne(id));
		Newsmanagement ng=inewsService.get(Newsmanagement.class, id);
		if(ng==null){
			return NODATA;
		}
		List list=inewsService.selectNewscomment(id, param);
		map.addAttribute("news",list );
		param.setAllCount(inewsService.selectNewscommentCount(id));
		map.addAttribute("fromParam", param);
		return "common_platform/news/looknews";
	}
	/**
	 * 加载评论
	 * @param id
	 * @param param
	 * @param map
	 * @return
	 */
	@RequestMapping("contents")
	public String contents(String id,FormParam param,ModelMap map){
		map.addAttribute("news", inewsService.selectNewscomment(id, param));
		param.setAllCount(inewsService.selectNewscommentCount(id));
		map.addAttribute("fromParam", param);
		return "common_platform/news/contents";
	}
	/**
	 * 删除评论
	 * @param id
	 * @return
	 */
	@RequestMapping("deletecontent")
	public ModelAndView deletecontent(String id,String newsid){ 
	     return	ajaxDone(inewsService.deletecontent(id,newsid));
	}
	/**
	 * 跳转到回复回复本贴
	 * @param id
	 * @param param
	 * @param nc
	 * @param ng
	 * @param map
	 * @return
	 */
	@RequestMapping("answer")
	public String answer(){
		return "common_platform/news/answer"; 
	}
	/**
	 * 回复帖子
	 * @param nc
	 * @return
	 */
	@RequestMapping("answernewscomment")
	public ModelAndView answernewscomment(@Valid Newscomment nc, Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		  nc.setConmmentsdate(DateUtil.currentTimestamp());
		  Member me=ServletUtil.getMember();
		  nc.setConmmentsnameId(me.getId());
	      return  ajaxDone(inewsService.updatecontent(nc));
	}
	/**
	 * 终止新闻
	 * @param ids
	 * @return
	 */
	@RequestMapping("stop")
	public ModelAndView stop(String[] ids){
		return ajaxDone(inewsService.updatestop(ids));
	}
	/**
	 * 生成新闻
	 * @param ids
	 * @return
	 */
	@RequestMapping("generate")
	public ModelAndView generate(String[] ids){
		return ajaxDone(inewsService.updategenerate(ids));
	}
	/**
	 * 管理评论
	 * @return
	 */
	@RequestMapping("managementcontent")
	public String managementcontent(String id,FormParam param,ModelMap map){
		Newsmanagement nc=inewsService.get(Newsmanagement.class, id);
		if(nc==null){
			return NODATA;
		}
		map.addAttribute("news", inewsService.selectNewscomment(id, param));
		param.setAllCount(inewsService.selectNewscommentCount(id));
		map.addAttribute("fromParam", param);
		return "common_platform/news/managementcontents"; 	
	}
	/**
	 * 加载个人办公的新闻
	 * @param param
	 * @param ng
	 * @param map
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unused" })
	@RequestMapping("load_news")
	public String load_news(FormParam param,Newsmanagement ng, ModelMap map){
		ng.setStatus(1);
		map.addAttribute("news",inewsService.newsload(param,ng));
		param.setAllCount(inewsService.selectCount(ng));
		map.addAttribute("fromParam", param);
		return "common_platform/news/news";
	}
	/**
	 * 跳转到导入页面
	 * @return
	 */
	@RequestMapping("extpor")
	public String extpor(){
		return "common_platform/news/extpor";
	}
	/**
	 * 导入
	 */
	@RequestMapping("excel")
      public ModelAndView  excel(@RequestParam MultipartFile file){
		List<Newsmanagement> list=new ArrayList<Newsmanagement>();
		if(!file.isEmpty()){
			try {
				list = ExcelUtils.staffExcelnew(file.getInputStream());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return ajaxDone(inewsService.addallnews(list));
		
	}
	
}
