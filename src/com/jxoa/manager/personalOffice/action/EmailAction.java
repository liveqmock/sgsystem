/**  
 * @Project: jxoa
 * @Title: EmailAction.java
 * @Package com.jxoa.manager.personalOffice.action
 * @date 2013-5-28 下午02:47:25
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.config.BaseConfig;
import com.jxoa.commons.model.FileList;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.FileUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.personalOffice.bean.EmDraftbox;
import com.jxoa.manager.personalOffice.bean.EmInbox;
import com.jxoa.manager.personalOffice.bean.EmInboxFile;
import com.jxoa.manager.personalOffice.bean.EmInboxOutboxUser;
import com.jxoa.manager.personalOffice.bean.EmOutbox;
import com.jxoa.manager.personalOffice.bean.Email;
import com.jxoa.manager.personalOffice.bean.PersonalAddressBook;
import com.jxoa.manager.personalOffice.service.IEmailService;

/**
 * 
 * 类名：EmailAction
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-28 下午02:47:25
 *
 */
@Controller
@RequestMapping("/email")
public class EmailAction extends BaseAction{
	
	@Autowired
	private IEmailService service;
	
	/**
	 * 通知上传的保存路径
	 */
	private static final String SAVEPATH=BaseConfig.uploadPath+"email";
	
	
	
	/**
	 * 跳转到新建邮件页面
	 */
	@RequestMapping("addPage")
	public String addPage() {
		return "personalOffice/email/newEmail/add";

	}
	
	
	/**
	 *新建邮件
	 */
	
	@RequestMapping("add")
	public ModelAndView add(@Valid EmOutbox eo,Errors errors,String userIds,HttpServletRequest request,FileList files){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		Member me=ServletUtil.getMember();
		eo.setEoUid(me.getId());
		eo.setEoDate(DateUtil.currentTimestamp());
		return ajaxDone(service.addEmail(eo, userIds,"new","",SAVEPATH,request,files));
		
	}
	/**
	 * 跳转到转发页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("forwardIn")
	public String forwardIn(@Valid String id, ModelMap map){
		service.updateStatus(id);
		map.addAllAttributes(service.findIn(id));
		return "personalOffice/email/inEmail/forward";
	}
	/**
	 * 跳转到查看页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("findIn")
	public String findIn(@Valid String id, ModelMap map){
		service.updateStatus(id);
		map.addAllAttributes(service.findIn(id));
		return "personalOffice/email/inEmail/find";
	}
	/**
	 * 跳转到回复页面
	 * @return
	 */
	@RequestMapping("addPageIn")
	public String addPageIn(@Valid String id, ModelMap map){
		service.updateStatus(id);
		map.addAllAttributes(service.selectEmail(id));
		return "personalOffice/email/inEmail/add";
	}
	/**
	 * 回复
	 * @param eo
	 * @param errors
	 * @param userIds
	 * @param request
	 * @return
	 */
	@RequestMapping("addIn")
	public ModelAndView addIn(@Valid EmOutbox eo,Errors errors,String userIds,String type,String  id  ,HttpServletRequest request,FileList files){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		Member me=ServletUtil.getMember();
		eo.setEoUid(me.getId());
		eo.setEoDate(DateUtil.currentTimestamp());
		String detail=eo.getDetail()+eo.getEoDetail();
		eo.setDetail(detail);
		return ajaxDone(service.addEmail(eo, userIds,type,id,SAVEPATH,request,files));
		
	}
	
	
	/**
	 * 跳转到查看页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("findOut")
	public String findOut(@Valid String id, ModelMap map){
		map.addAllAttributes(service.selectOutbox(id));
		return "personalOffice/email/outEmail/find";
	}

	/**
	 * 跳转到发件箱转发页面
	 * @return
	 */
	@RequestMapping("forwardOut")
	public String forwardOut(@Valid String id, ModelMap map){
		map.addAllAttributes(service.selectOutbox(id));
		return "personalOffice/email/outEmail/forward";
	}
	
	/**
	 * 文件下载
	 * @param id 文件保存时名称
	 * @param name 文件原名
	 * @param ext  文件后缀
	 * @param request  
	 * @param response
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value = "/download")   
    public String down(String newName,String name,String ext,HttpServletRequest request,HttpServletResponse response){  
    	return FileUtils.down(SAVEPATH, name, newName, ext,request,response);
        
    }  
    

	/**
	 *保存草稿箱 
	 */
	
	@RequestMapping("save")
	public ModelAndView save(@Valid EmOutbox eo,Errors errors,String userIds,HttpServletRequest request,FileList files){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		Member me=ServletUtil.getMember();
		eo.setEoUid(me.getId());
		eo.setEoDate(DateUtil.currentTimestamp());
		return ajaxDone(service.saveEmail(eo, userIds,SAVEPATH,request,files));
		
	}
	/**
	 * 修改草稿箱
	 * @param eo
	 * @param errors
	 * @param userIds
	 * @param request
	 * @param files
	 * @return
	 */
	@RequestMapping("updateDraft")
	public ModelAndView updateDraft(@Valid EmOutbox eo,Errors errors,String userIds,HttpServletRequest request,FileList files){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		Member me=ServletUtil.getMember();
		eo.setEoUid(me.getId());
		eo.setEoDate(DateUtil.currentTimestamp());
		return ajaxDone(service.update(eo, userIds,SAVEPATH,request,files));
		
	}
	/**
	 *修改草稿箱 
	 */
	
	@RequestMapping("update")
	public ModelAndView update(@Valid EmOutbox eo,Errors errors,String userIds,HttpServletRequest request,FileList files){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		Member me=ServletUtil.getMember();
		eo.setEoUid(me.getId());
		eo.setEoDate(DateUtil.currentTimestamp());
		return ajaxDone(service.saveEmail(eo, userIds,SAVEPATH,request,files));
		
	}
	
	
	/**
	 * 草稿箱修改页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("edit")
	public String edit(@Valid String id, ModelMap map){
		map.addAllAttributes(service.findDraftOne(id));
		return "personalOffice/email/draftEmail/edit";
	}
	/**
	 * 草稿箱发送
	 * @param eo
	 * @param errors
	 * @param userIds
	 * @param edId
	 * @param request
	 * @param files
	 * @return
	 */
	@RequestMapping("addDraft")
	public ModelAndView addDraft(@Valid EmOutbox eo,Errors errors,String userIds,String edId,HttpServletRequest request,FileList files){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		Member me=ServletUtil.getMember();
		eo.setEoUid(me.getId());
		eo.setEoDate(DateUtil.currentTimestamp());
		return ajaxDone(service.addDraft(eo, userIds,SAVEPATH,request,files));
		
	}
	/**
	 * 删除所选的收件箱记录
	 * @param ids
	 * @return
	 */
	@RequestMapping("delIn")
	public ModelAndView deleteIn(String[] ids){
		
		return ajaxDone(service.deleteEmail(ids,1,SAVEPATH));
	}
	/**
	 * 删除所选的发件箱记录
	 * @param ids
	 * @return
	 */
	@RequestMapping("delOut")
	public ModelAndView deleteOut(String[] ids){
		
		return ajaxDone(service.deleteEmail(ids,2,SAVEPATH));
	}
	/**
	 * 删除所选的草稿箱记录
	 * @param ids
	 * @return
	 */
	@RequestMapping("deldraft")
	public ModelAndView deleteDraft(String[] ids){
		
		return ajaxDone(service.deleteEmail(ids,3,SAVEPATH));
	}
	
	@RequestMapping("delFile")
	public ModelAndView delFile(String id){
		return ajaxDone(service.deleteFile(id,SAVEPATH));
	}
	
	/**
	 * 加载收件箱
	 * @param param
	 * @param p
	 * @param map
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("loadIn")
	public String loadIn(FormParam param, Email e,String status, ModelMap map) throws UnsupportedEncodingException {
		if(status!=null&&!"".equals(status)){
			if(status.equals("1")){
				status="已读";
			}else if(status.equals("0")){
				status="未读";
			}
		}
		List l=service.selectEmInbox(param, e,status);
		map.addAttribute("values",l);
		param.setAllCount(service.selectEmInboxCount(e,status));
		map.addAttribute("fromParam", param);
		return "personalOffice/email/inEmail/load";

	}
	/**
	 * 加载发件箱
	 * @param param
	 * @param p
	 * @param map
	 * @return
	 */
	@RequestMapping("loadOut")
	public String loadOut(FormParam param, Email e, ModelMap map) {
	
		map.addAttribute("values",service.selectEmOutbox(param, e));
		param.setAllCount(service.selectEmOutboxCount(e));
		map.addAttribute("fromParam", param);
		return "personalOffice/email/outEmail/load";

	}
	/**
	 * 加载草稿箱
	 * @param param
	 * @param d
	 * @param map
	 * @return
	 */
	
	@RequestMapping("loadDraft")
	public String loadDraft(FormParam param, Email e,String name, ModelMap map){
		map.addAllAttributes(service.selectEmDraftbox(param, e));
		param.setAllCount(service.selectEmDraftboxCount(e));
		map.addAttribute("fromParam", param);
		return "personalOffice/email/draftEmail/load";
	}
}
