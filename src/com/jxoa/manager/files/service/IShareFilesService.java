/**  
 * @Project: jxoa
 * @Title: IShareFilesService.java
 * @Package com.jxoa.manager.files.service
 * @date 2013-4-23 下午3:31:00
 * @Copyright: 2013 
 */
package com.jxoa.manager.files.service;

import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.files.bean.WdShareFiles;

/**
 * 
 * 类名：IShareFilesService
 * 功能：共享文档 业务层
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-23 下午3:31:00
 *
 */
public interface IShareFilesService extends IBaseService{
	
	/**
	 * 个人文档条件查询
	 * @param param
	 * @param f
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<WdShareFiles> selectFiles(FormParam param,WdShareFiles f,Date startDate,Date endDate);
	/**
	 * 个人文档条件查询 计算总数
	 * @param f
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectFilesCount(WdShareFiles f,Date startDate,Date endDate);
	/**
	 * 查询出某个目录的所有上级目录
	 * @param id
	 * @return
	 */
	public List<WdShareFiles> querySuperFiles(String id);
	/**
	 * 新建文档目录
	 * @param f
	 * @return
	 */
	public String addNode(WdShareFiles f);
	/**
	 * 新建文件
	 * @param f
	 * @param request
	 * @return
	 */
	public String addFile(WdShareFiles f,String savePath,@RequestParam MultipartFile file);
	/**
	 * 修改文件或文件夹
	 * @param f
	 * @return
	 */
	public String updateFile(WdShareFiles f,String savePath,@RequestParam MultipartFile file);

	/**
	 * 删除文件
	 * @param ids
	 * @param savePath
	 * @return
	 */
	public boolean deleteFile(String[] ids,String savePath);
	/**
	 * 删除文件夹
	 * @param id
	 * @return
	 */
	public String deleteNode(String id);
	
	
	/**
	 * 查询出所有目录信息，用于tree显示
	 * @return
	 */
	public List selectAllNodes();
	
}
