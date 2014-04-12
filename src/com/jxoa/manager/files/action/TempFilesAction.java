/**  
 * @Project: jxoa
 * @Title: TempFilesAction.java
 * @Package com.jxoa.manager.files.action
 * @date 2013-6-2 下午12:29:20
 * @Copyright: 2013 
 */
package com.jxoa.manager.files.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;

/**
 * 
 * 类名：TempFilesAction
 * 功能：临时文件上传
 * 详细：falsh上传
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-6-2 下午12:29:20
 *
 */
@Controller
@RequestMapping("/tempFiles")
public class TempFilesAction extends BaseAction{

	/**
	 * 上传附件
	 * @param file
	 * @param userId
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@RequestParam MultipartFile file,String userId){
		
		System.out.println("文件上传==="+file.getOriginalFilename());
		
		return ajaxDoneSuccess();
	}
	
}
