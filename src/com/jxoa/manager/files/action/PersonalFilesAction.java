/**  
 * @Project: jxoa
 * @Title: PersonalFilesAction.java
 * @Package com.jxoa.manager.files.action
 * @date 2013-4-18 下午5:14:10
 * @Copyright: 2013 
 */
package com.jxoa.manager.files.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.config.BaseConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.FileUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.files.bean.WdPersonalFiles;
import com.jxoa.manager.files.service.IPersonalFilesService;

/**
 * 
 * 类名：PersonalFilesAction
 * 功能：文档管理--个人文档
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-18 下午5:14:10
 *
 */
@Controller
@RequestMapping("/personalFiles")
public class PersonalFilesAction extends BaseAction{
	
	@Autowired
	private IPersonalFilesService service; 
	/**
	 * 文件保存的目录
	 */
	private static final String SAVEPATH=BaseConfig.uploadPath+"personalFiles";
	
	/**
	 * 跳转到文件加载页面
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param,WdPersonalFiles f,Date startDate,Date endDate,ModelMap map){
		
		if(StringUtils.isBlank(f.getWdSuperId())){
			f.setWdSuperId("0");
		}
		
		Member me=ServletUtil.getMember();
		f.setWdUserId(me.getId());
		
		map.addAttribute("files",service.selectFiles(param, f, startDate, endDate));
		param.setAllCount(service.selectFilesCount(f, startDate, endDate));
		map.addAttribute("fromParam",param);
		
		if(!"0".equals(f.getWdSuperId())){
			map.addAttribute("superFiles",service.querySuperFiles(f.getWdSuperId()));
		}
		map.addAttribute("id",f.getWdSuperId());
		
		return "files/personal/load";

	}
	/**
	 * 跳转到添加文件页面
	 * @return
	 */
	@RequestMapping("addFilePage")
	public String addFilePage(){
		
		return "files/personal/add_file";
	
	}
	/**
	 * 添加文件
	 * @return
	 */
	@RequestMapping("addFile")
	public ModelAndView addFile(@Valid WdPersonalFiles f,Errors errors,@RequestParam MultipartFile file){
		
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		if(file.isEmpty()){
			return ajaxDoneError();
		}
		ModelAndView view=FileUtils.validateFile(file, 1024L*1024*500, null, new String[]{"exe"});
		if(view!=null)return view;
		return ajaxDone(service.addFile(f,SAVEPATH,file));
	}
	/**
	 * 跳转到添加目录页面
	 * @return
	 */
	@RequestMapping("addNodePage")
	public String addNodePage(){
		
		return "files/personal/add_node";
	
	}
	/**
	 * 添加目录
	 * @return
	 */
	@RequestMapping("addNode")
	public ModelAndView addNode(@Valid WdPersonalFiles f,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        } 
		
		return ajaxDone(service.addNode(f));
	}
	
	/**
	 * 查看文件信息
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("show")
	public String showFile(String id,ModelMap map){
		WdPersonalFiles wf=service.get(WdPersonalFiles.class, id);
		if(wf==null){
			return NODATA;
		}
		if(!ServletUtil.getMember().getId().equals(wf.getWdUserId())){
			return NOPOWER;
		}
		map.addAttribute("f",wf);
		
		return "files/personal/show";
	}
	/**
	 * 跳转到文件编辑页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		WdPersonalFiles file=service.get(WdPersonalFiles.class, id);
		if(file==null){
			return NODATA;
		}
		if(!ServletUtil.getMember().getId().equals(file.getWdUserId())){
			return NOPOWER;
		}
		map.addAttribute("f",file);
		if(file.getWdType()==0){
			//目录
			return "files/personal/update_node";
		}else{
			return "files/personal/update_file";
		}
	}
	/**
	 * 修改文件或文件夹
	 * @param f
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid WdPersonalFiles f,Errors errors,@RequestParam MultipartFile file){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		if(!file.isEmpty()){
			ModelAndView view=FileUtils.validateFile(file, 1024L*1024*500, null, new String[]{"exe"});
			if(view!=null)return view;
		}
		return ajaxDone(service.updateFile(f, SAVEPATH,file));
		
	}
	
	/**
	 * 批量删除文件
	 * @param ids
	 * @return
	 */
	@RequestMapping("delFile")
	public ModelAndView deleteFile(String[] ids){
		
		return ajaxDone(service.deleteFile(ids, SAVEPATH));
	}
	/**
	 * 删除文件夹 只能删除单个文件夹，而且文件夹必须为空才能删除
	 * @param ids
	 * @return
	 */
	@RequestMapping("delNode")
	public ModelAndView deleteNode(String id){
		
		return ajaxDone(service.deleteNode(id));
	
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
	 * 个人文件 ，查找带回
	 * @param session
	 * @param type 查到带回类型	1:单选，2:多选
	 * @param param
	 * @param f
	 * @param startDate
	 * @param endDate
	 * @param map
	 * @return
	 */
	@RequestMapping("lookUpPage")
	public String lookUpPage(Integer type,FormParam param,WdPersonalFiles f,@DateTimeFormat(pattern="yyyy-MM-dd")Date startDate,@DateTimeFormat(pattern="yyyy-MM-dd")Date endDate,ModelMap map){
		
		if(StringUtils.isBlank(f.getWdSuperId())){
			f.setWdSuperId("0");
		}else{
			//解决DWZ发送多次ID，spring封装多值问题
			f.setWdSuperId(f.getWdSuperId().split(",")[0]);
		}
		Member me=ServletUtil.getMember();
		f.setWdUserId(me.getId());
		map.addAttribute("files",service.selectFiles(param, f, startDate, endDate));
		param.setAllCount(service.selectFilesCount(f, startDate, endDate));
		map.addAttribute("fromParam",param);
		
		if(!"0".equals(f.getWdSuperId())){
			map.addAttribute("superFiles",service.querySuperFiles(f.getWdSuperId()));
		}
		map.addAttribute("id",f.getWdSuperId());
		
		if(type!=null){
			if(type==2){
				//多选
				return "files/personal/lookup_more";
			}else {
				//单选
				return "files/personal/lookup";
			}
		}else{
			//默认单选
			return "files/personal/lookup";
		}

	}
	   /**
		 * 跳转到文件加载页面 树状
		 * @return
		 */
		@RequestMapping("tree/load")
		public String loadTree(ModelMap map){
			
			return "files/personal/tree/load";

		}
	    
	    
		/**
		 * 跳转到文件加载页面 树状
		 * @return
		 */
		@RequestMapping("tree/allNode")
		public ModelAndView allNode(){
			
			return ajaxJson(service.selectAllNodesByUserId(ServletUtil.getMember().getId()));

		}
	    
		/**
		 * 查询目录下的文件
		 * @return
		 */
		@RequestMapping("tree/query")
		public String query(FormParam param,WdPersonalFiles f,Date startDate,Date endDate,ModelMap map){
			
			f.setWdType((short)1);
			f.setWdUserId(ServletUtil.getMember().getId());
			map.addAttribute("files",service.selectFiles(param, f, startDate, endDate));
			param.setAllCount(service.selectFilesCount(f, startDate, endDate));
			map.addAttribute("fromParam",param);
			
			return "files/personal/tree/query";

		}
	
	
}
