/**  
 * @Project: jxoa
 * @Title: NoticeAction.java
 * @Package com.jxoa.manager.coordination.action
 * @date 2013-4-12 下午3:59:48
 * @Copyright: 2013 
 */
package com.jxoa.manager.coordination.action;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.config.BaseConfig;
import com.jxoa.commons.model.FileList;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.FileUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.coordination.bean.XtNotice;
import com.jxoa.manager.coordination.bean.XtNoticeContent;
import com.jxoa.manager.coordination.service.INoticeService;

/**
 * 
 * 类名：NoticeAction
 * 功能：协同办公--通知管理
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-12 下午3:59:48
 *
 */
@Controller
@RequestMapping("/notice")
public class NoticeAction extends BaseAction{
	
	@Autowired
	private INoticeService service;
	
	/**
	 * 通知上传的保存路径
	 */
	private static final String SAVEPATH=BaseConfig.uploadPath+"notice";
	
	/**
	 * 跳转到通知管理  
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param,XtNotice not,Date startDate,Date endDate,ModelMap map){
		
		map.addAttribute("notices",service.selectNotice(param, not, startDate, endDate));
		param.setAllCount(service.selectNoticeCount(not, startDate, endDate));
		map.addAttribute("fromParam",param);
		return "coordination/notice/load";
	}
	/**
	 * 跳转到通知查询，查询我能看到的通知
	 * @return
	 */
	@RequestMapping("loadtome")
	public String loadTome(FormParam param,XtNotice not,Date startDate,Date endDate,ModelMap map){
		
		map.addAttribute("notices",service.selectMyNotice(param, not, startDate, endDate));
		param.setAllCount(service.selectMyNoticeCount(not, startDate, endDate));
		map.addAttribute("fromParam",param);
		return "coordination/notice/load_tome";
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		return "coordination/notice/add";
	}
	/**
	 *  添加通知
	 * @param not
	 * @param errors
	 * @param nc
	 * @param errorsNc
	 * @param deptIds
	 * @param userIds
	 * @param request
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid XtNotice not,Errors errors,@Valid XtNoticeContent nc,Errors errorsNc,Integer isSendMsg,String[] deptIds,String[] userIds,FileList files){
		
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		if(errorsNc.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errorsNc);
			if(mav!=null)return mav;
        }
		//验证上传文件大小，格式
		List<MultipartFile> fs=files.getFile();
		if(fs!=null){
			for(MultipartFile file:fs){
				if(file!=null&&!file.isEmpty()){
					ModelAndView view=FileUtils.validateFile(file, 1024L*1024*500, null, new String[]{"exe"});
					if(view!=null)return view;
				}
			}
		}
		
		Member me=ServletUtil.getMember();
		
		not.setNoticeSendId(me.getId());
		not.setNoticeCreateTime(DateUtil.currentTimestamp());
	
		return ajaxDone(service.addNotice(not, nc,isSendMsg, deptIds, userIds,SAVEPATH,files));
		
	}
	/**
	 * 跳转到通知修改页面
	 * @param id
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		
		map.addAllAttributes(service.findNoticeById(id));
		if(map.get("n")==null){
			return NODATA;
		}
		return "coordination/notice/update";
		
	}
	/**
	 * 更新通知
	 * @param not
	 * @param errors
	 * @param nc
	 * @param errorsNc
	 * @param deptIds
	 * @param userIds
	 * @param request
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid XtNotice not,Errors errors,@Valid XtNoticeContent nc,Errors errorsNc,Integer isSendMsg,String[] deptIds,String[] userIds,FileList files){
		
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		if(errorsNc.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errorsNc);
			if(mav!=null)return mav;
        }
		//验证上传文件大小，格式
		List<MultipartFile> fs=files.getFile();
		if(fs!=null){
			for(MultipartFile file:fs){
				if(file!=null&&!file.isEmpty()){
					ModelAndView view=FileUtils.validateFile(file, 1024L*1024*500, null, new String[]{"exe"});
					if(view!=null)return view;
				}
			}
		}
		return ajaxDone(service.updateNotice(not, nc, isSendMsg,deptIds, userIds,SAVEPATH,files));
		
	}
	
	/**
	 * 单独删除通知附件
	 * @param id 附件id 
	 * @return
	 */
	@RequestMapping("delFile")
	public ModelAndView deleteFile(String id){
		
		return ajaxDone(service.deleteXtNoticeFiles(id,SAVEPATH));
		
	}
	/**
	 * 删除通知
	 * @param id
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(service.deleteXtNotice(ids,SAVEPATH));
		
	}
	/**
	 * 查看单个通知
	 * @param id
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("show")
	public String show(String id,ModelMap map){
		
		map.addAllAttributes(service.updateShowOneById(id));
		if(map.get("n")==null){
			return NODATA;
		}
		return "coordination/notice/show";
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
}
