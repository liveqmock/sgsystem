/**  
 * @Project: jxoa
 * @Title: ShareFilesServiceImpl.java
 * @Package com.jxoa.manager.files.service.impl
 * @date 2013-4-23 下午3:31:21
 * @Copyright: 2013 
 */
package com.jxoa.manager.files.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.FileUtils;
import com.jxoa.manager.files.bean.WdShareFiles;
import com.jxoa.manager.files.service.IShareFilesService;

/**
 * 
 * 类名：ShareFilesServiceImpl
 * 功能：共享文档 业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-23 下午3:31:21
 *
 */
@Service
public class ShareFilesServiceImpl extends BaseServiceImpl implements IShareFilesService{
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<WdShareFiles> selectFiles(FormParam param,WdShareFiles f,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("from WdShareFiles f where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(f.getWdName())){
			sb.append(" and f.wdName like ? ");
			list.add("%"+f.getWdName()+"%");
		}
		if(StringUtils.isNotBlank(f.getWdUserId())){
			sb.append(" and f.wdUserId = ? ");
			list.add(f.getWdUserId());	
		}
		if(StringUtils.isNotBlank(f.getWdSuperId())){
			sb.append(" and f.wdSuperId = ? ");
			list.add(f.getWdSuperId());	
		}
		if(f.getWdType()!=null&&f.getWdType()!=0){
			sb.append(" and f.wdType = ? ");
			list.add(f.getWdType());	
		}
		if(startDate!=null){
			sb.append(" and f.wdCreateTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and f.wdCreateTime <=? ");
			list.add(endDate);	
		}
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			sb.append(" order by f."+param.getOrderField()+" "+param.getOrderDirection());
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectFilesCount(WdShareFiles f,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(id)from WdShareFiles f where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(f.getWdName())){
			sb.append(" and f.wdName like ? ");
			list.add("%"+f.getWdName()+"%");
		}
		if(StringUtils.isNotBlank(f.getWdUserId())){
			sb.append(" and f.wdUserId = ? ");
			list.add(f.getWdUserId());	
		}
		if(StringUtils.isNotBlank(f.getWdSuperId())){
			sb.append(" and f.wdSuperId = ? ");
			list.add(f.getWdSuperId());	
		}
		if(f.getWdType()!=null&&f.getWdType()!=0){
			sb.append(" and f.wdType = ? ");
			list.add(f.getWdType());	
		}
		if(startDate!=null){
			sb.append(" and f.wdCreateTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and f.wdCreateTime <=? ");
			list.add(endDate);	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	public List<WdShareFiles> querySuperFiles(String id){
		
		List<WdShareFiles> supFiles=new ArrayList<WdShareFiles>();
		querySupFile(supFiles, id);
		Collections.reverse(supFiles);//排序
		return supFiles;
	}
	/**
	 * 递归查询目录上级，一直查到顶级目录
	 * @param supFiles
	 * @param id
	 */
	private void querySupFile(List<WdShareFiles> supFiles,String id){
		WdShareFiles f=dao.get(WdShareFiles.class, id);
		if(f==null){
			return;
		}
		supFiles.add(f);
		if(!"0".equals(f.getWdSuperId())){
			querySupFile(supFiles,f.getWdSuperId());
		}else{
			return ;
		}
	}
	
	public String addNode(WdShareFiles f){
		
		Object obj=dao.findOne("from WdShareFiles where wdSuperId=? and wdName=? and wdType=?",f.getWdSuperId(),f.getWdName(),(short)0);
		
		if(obj==null){
			return dao.save(f)? MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
			
		}else{
			return "msg.filenode.unique";//文件夹名称重复
		}
	}
	
	public String addFile(WdShareFiles f,String savePath,@RequestParam MultipartFile file){
		try {
			String uuid=FileUtils.getUUID();//uuid作为保存时的文件名
			String ext=FileUtils.getFileExt(file.getOriginalFilename());//获取文件后缀
			//保存文件
			File newFile = new File(savePath+"/"+uuid+"."+ext); 
			file.transferTo(newFile);
			f.setWdNewName(uuid);
			f.setWdSize((int)file.getSize());
			f.setWdExt(ext);
		
			return dao.save(f)? MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return MsgConfig.MSG_KEY_FAIL;
		
		
		
	}
	
	public String updateFile(WdShareFiles f,String savePath,@RequestParam MultipartFile file){
		WdShareFiles old=dao.get(WdShareFiles.class, f.getId());
		if(old==null)return MsgConfig.MSG_KEY_NODATA;
		if(old.getWdType()==0){
			//修改目录
			Object obj=dao.findOne("from WdShareFiles where wdSuperId=? and wdName=? and wdType=? and id!=?",f.getWdSuperId(),f.getWdName(),(short)0,f.getId());
			if(obj!=null){
			
				return "msg.filenode.unique";//文件夹名称重复
			}
		}else{
			if(!file.isEmpty()){
				try {
					//用户上传了文件，覆盖原文件
					String uuid=FileUtils.getUUID();//uuid作为保存时的文件名
					String ext=FileUtils.getFileExt(file.getOriginalFilename());//获取文件后缀
					//保存文件
					File newFile = new File(savePath+"/"+uuid+"."+ext); 
					file.transferTo(newFile);	
					//先删除旧文件
					File oldfile = new File(savePath+"/"+old.getWdNewName()+"."+old.getWdExt()); 
					oldfile.delete();
					//用户上传了文件，覆盖原文件
					old.setWdNewName(uuid);
					old.setWdSize((int)file.getSize());
					old.setWdExt(ext);
				} catch (Exception e) {
					e.printStackTrace();
					return MsgConfig.MSG_KEY_FAIL;
				}
			}
			
		}
		old.setWdName(f.getWdName());
		old.setWdDesc(f.getWdDesc());
		return MsgConfig.MSG_KEY_SUCCESS;
		
		
	}
	
	public boolean deleteFile(String[] ids,String savePath){
		for(String id:ids){
			WdShareFiles f=dao.get(WdShareFiles.class, id);
			if(f!=null&&f.getWdType()==1){
				//如果是文件则删除文件 
				File file = new File(savePath+"/"+f.getWdNewName()+"."+f.getWdExt()); 
				file.delete();
				dao.delete(f);
			}
		}
		return true;
	}
	public String deleteNode(String id){
		Object obj=dao.findOne("from WdShareFiles where wdSuperId=?",id);
		if(obj==null){
			return dao.delete("delete WdShareFiles where id=?", id)? MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
		}else{
			return "msg.fielnode.notempty";//文件夹不是空，无法删除
		}
	}
	
	//查询所有目录
	public List selectAllNodes(){
		
		return dao.find("select new Map(f.id as id,f.wdName as name, f.wdSuperId as pId) from WdShareFiles f where wdType=0 ");
	
	}
	
	
	
}
