/**  
 * @Project: jxoa
 * @Title: NoticeServiceImpl.java
 * @Package com.jxoa.manager.administrativeoffice.service.impl
 * @date 2013-4-12 下午4:00:47
 * @Copyright: 2013 
 */
package com.jxoa.manager.coordination.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FileList;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.FileUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.coordination.bean.XtNotice;
import com.jxoa.manager.coordination.bean.XtNoticeContent;
import com.jxoa.manager.coordination.bean.XtNoticeFiles;
import com.jxoa.manager.coordination.bean.XtNoticeReceive;
import com.jxoa.manager.coordination.service.INoticeService;
import com.jxoa.manager.zck.bean.Jncypx;

/**
 * 
 * 类名：NoticeServiceImpl
 * 功能：通知管理 业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-12 下午4:00:47
 *
 */
@Service
public class NoticeServiceImpl extends BaseServiceImpl implements INoticeService{
	
	
	public boolean addNotice(XtNotice not,XtNoticeContent nc,Integer isSendMsg,String[] deptIds,String[] userIds,String savePath,FileList files){
		try {
			//先保存通知主表
			String noticeId=(String)dao.saveReturnId(not);
			nc.setNoticeId(noticeId);
			
			//等待保存的对象集合
			List<Object> c=new ArrayList<Object>();
			c.add(nc);
			
			Set<String> addUserIds=new HashSet<String>();//需要发送的人员集合，部门，和人员交集
			
			
			//查询出此部门所有的用户id
			for(String id:deptIds){
				List<String> uid=dao.find("select id from SyUsers where deptId=?",id);
				addUserIds.addAll(uid);
			}
			for(String id:userIds){
				addUserIds.add(id);
			}
			for(String id:addUserIds){
				XtNoticeReceive nr=new XtNoticeReceive();
				nr.setNoticeId(noticeId);
				nr.setUserId(id);
				nr.setReadTime(null);
				c.add(nr);
			}
			//发送消息提醒
			if(isSendMsg!=null&&isSendMsg==1){
				saveMsgWarn(1, noticeId, addUserIds,null);
			}
			//上传文件
			List<MultipartFile> fileList=files.getFile();
			if(fileList!=null){
				for(MultipartFile f:fileList){
					if(f!=null&&!f.isEmpty()){
						String uuid=FileUtils.getUUID();//uuid作为保存时的文件名
						String ext=FileUtils.getFileExt(f.getOriginalFilename());//获取文件后缀
						//保存文件
						File newFile = new File(savePath+"/"+uuid+"."+ext); 
						f.transferTo(newFile);
						XtNoticeFiles nf=new XtNoticeFiles();
						nf.setFileExt(ext);
						nf.setFileName(f.getOriginalFilename());
						nf.setFileNewName(uuid);
						nf.setFileSize((int)f.getSize());
						nf.setNoticeId(noticeId);
						c.add(nf);
					}
				}
			}
			return  dao.saveOrUpdateAll(c);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectMyNotice(FormParam param,XtNotice not,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select  n from XtNotice n,XtNoticeReceive nr where n.id=nr.noticeId and  nr.userId=? ");
		List list=new ArrayList();
		list.add(ServletUtil.getMember().getId());
		//查询条件
		if(StringUtils.isNotBlank(not.getNoticeTitle())){
			sb.append(" and n.noticeTitle like ? ");
			list.add("%"+not.getNoticeTitle()+"%");
		}
		if(StringUtils.isNotBlank(not.getNoticeType())){
			sb.append(" and n.noticeType = ? ");
			list.add(not.getNoticeType());	
		}
		if(StringUtils.isNotBlank(not.getNoticeSendId())){
			sb.append(" and n.noticeSendId = ? ");
			list.add(not.getNoticeSendId());	
		}
		if(startDate!=null){
			sb.append(" and n.noticeCreateTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and n.noticeCreateTime <=? ");
			list.add(endDate);	
		}
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			
			sb.append(" order by n."+param.getOrderField()+" "+param.getOrderDirection());
			
		}else{
			param.setOrderDirection("desc");
			sb.append(" order by n.noticeCreateTime desc");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectMyNoticeCount(XtNotice not,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(n.id)from XtNotice n,XtNoticeReceive nr where n.id=nr.noticeId and  nr.userId=? ");
		List list=new ArrayList();
		list.add(ServletUtil.getMember().getId());
		//查询条件
		if(StringUtils.isNotBlank(not.getNoticeTitle())){
			sb.append(" and n.noticeTitle like  ? ");
			list.add("%"+not.getNoticeTitle()+"%");
		}
		if(StringUtils.isNotBlank(not.getNoticeType())){
			sb.append(" and n.noticeType = ? ");
			list.add(not.getNoticeType());	
		}
		if(StringUtils.isNotBlank(not.getNoticeSendId())){
			sb.append(" and n.noticeSendId = ? ");
			list.add(not.getNoticeSendId());	
		}
		if(startDate!=null){
			sb.append(" and n.noticeCreateTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and n.noticeCreateTime <=? ");
			list.add(endDate);	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectNotice(FormParam param,XtNotice not,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("from XtNotice n where 1=1 ");
		List list=new ArrayList();
		
		//查询条件
		if(StringUtils.isNotBlank(not.getNoticeSendId())){
			sb.append(" and n.noticeSendId = ? ");
			list.add(not.getNoticeSendId());
		}
		if(StringUtils.isNotBlank(not.getNoticeTitle())){
			sb.append(" and n.noticeTitle like ? ");
			list.add("%"+not.getNoticeTitle()+"%");
		}
		if(StringUtils.isNotBlank(not.getNoticeType())){
			sb.append(" and n.noticeType = ? ");
			list.add(not.getNoticeType());	
		}
		if(startDate!=null){
			sb.append(" and n.noticeCreateTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and n.noticeCreateTime <=? ");
			list.add(endDate);	
		}
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			
			sb.append(" order by n."+param.getOrderField()+" "+param.getOrderDirection());
			
		}else{
			param.setOrderDirection("desc");
			sb.append(" order by n.noticeCreateTime desc");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectNoticeCount(XtNotice not,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(*)from XtNotice n where 1=1 ");
		List list=new ArrayList();
		
		//查询条件
		if(StringUtils.isNotBlank(not.getNoticeSendId())){
			sb.append(" and n.noticeSendId = ? ");
			
			list.add(not.getNoticeSendId());
		}
		if(StringUtils.isNotBlank(not.getNoticeTitle())){
			sb.append(" and n.noticeTitle like ? ");
			list.add("%"+not.getNoticeTitle()+"%");
		}
		if(StringUtils.isNotBlank(not.getNoticeType())){
			sb.append(" and n.noticeType = ? ");
			list.add(not.getNoticeType());	
		}
		if(startDate!=null){
			sb.append(" and n.noticeCreateTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and n.noticeCreateTime <=? ");
			list.add(endDate);	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map findNoticeById(String id){
		
		XtNotice not=dao.get(XtNotice.class, id);
		Map map=new HashMap();
		map.put("n", not);
		if(not!=null){
			XtNoticeContent nc=dao.get(XtNoticeContent.class, id);
			List<XtNoticeFiles> nfs=dao.find("from XtNoticeFiles nf where nf.noticeId=? ",id);
			map.put("nc", nc);
			map.put("nfs", nfs);
		}
		return map;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map updateShowOneById(String id){
		
		XtNotice not=dao.get(XtNotice.class, id);
		Map map=new HashMap();
		map.put("n", not);
		if(not!=null){
			XtNoticeContent nc=dao.get(XtNoticeContent.class, id);
			List<XtNoticeFiles> nfs=dao.find("from XtNoticeFiles nf where nf.noticeId=? ",id);
			List<XtNoticeReceive> nrs=dao.find("from XtNoticeReceive nr where nr.noticeId=?",id);
			
			int isRead=0;
			for(XtNoticeReceive n:nrs){
				if(n.getReadTime()!=null){
					isRead++;
				}
			}
			
			map.put("nc", nc);
			map.put("nfs", nfs);
			map.put("nrs", nrs);
			map.put("readNum", isRead);
			map.put("allNum", nrs.size());
			
			String userId=ServletUtil.getMember().getId();
			for(XtNoticeReceive nr:nrs){
				if(userId.equals(nr.getUserId())){
					if(nr.getReadTime()==null){
						nr.setReadTime(DateUtil.currentTimestamp());
						dao.update(nr);
					}
				}
			}
		}
		return map;
	}
	
	
	public String deleteXtNoticeFiles(String id,String savePath){
		
		XtNoticeFiles nf=dao.get(XtNoticeFiles.class, id);
		if(nf==null)return MsgConfig.MSG_KEY_NODATA;
		File file = new File(savePath+"/"+nf.getFileNewName()+"."+nf.getFileExt()); 
		file.delete();
		return dao.delete(nf)?MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
	}
	
	public String updateNotice(XtNotice not,XtNoticeContent nc,Integer isSendMsg,String[] deptIds,String[] userIds,String savePath,FileList files){
		
		try{
			XtNotice oldnot=dao.get(XtNotice.class, not.getId());
			if(oldnot==null){
				return MsgConfig.MSG_KEY_NODATA;
			}
			
			oldnot.setNoticeTitle(not.getNoticeTitle());
			oldnot.setNoticeType(not.getNoticeType());
			
			//等待更新的对象集合
			List<Object> c=new ArrayList<Object>();
			nc.setNoticeId(oldnot.getId());
			c.add(nc);
			
			List<String> oldUserIds=dao.find("select userId from XtNoticeReceive nr where nr.noticeId=?",oldnot.getId());
			Set<String> addUserIds=new HashSet<String>();//需要发送的人员集合，部门，和人员交集
			
			//查询出此部门所有的用户id
			for(String id:deptIds){
				List<String> uid=dao.find("select id from SyUsers where deptId=?",id);
				addUserIds.addAll(uid);
			}
			for(String id:userIds){
				addUserIds.add(id);
			}
			
			//原先已有的-现在需要添加的==需要删除的
			List<String> delUserIds=new ArrayList<String>(oldUserIds);//需要删除的
			delUserIds.remove(addUserIds);
			for(String id:delUserIds){
				dao.delete("delete XtNoticeReceive where noticeId=? and userId=? ",oldnot.getId(),id);
			}
			//现在需要添加的-原先已有的=需要真正添加的
			addUserIds.remove(oldUserIds);
			
			for(String id:addUserIds){
				XtNoticeReceive nr=new XtNoticeReceive();
				nr.setNoticeId(oldnot.getId());
				nr.setUserId(id);
				nr.setReadTime(null);
				c.add(nr);
			}
			if(isSendMsg!=null&&isSendMsg==1)
				saveMsgWarn(1, oldnot.getId(), addUserIds,null);
			
			//上传文件
			List<MultipartFile> fileList=files.getFile();
			if(fileList!=null){
				for(MultipartFile f:fileList){
					if(f!=null&&!f.isEmpty()){
						String uuid=FileUtils.getUUID();//uuid作为保存时的文件名
						String ext=FileUtils.getFileExt(f.getOriginalFilename());//获取文件后缀
						//保存文件
						File newFile = new File(savePath+"/"+uuid+"."+ext); 
						
						f.transferTo(newFile);
						
						XtNoticeFiles nf=new XtNoticeFiles();
						nf.setFileExt(ext);
						nf.setFileName(f.getOriginalFilename());
						nf.setFileNewName(uuid);
						nf.setFileSize((int)f.getSize());
						nf.setNoticeId(oldnot.getId());
						c.add(nf);
					}
				}
			}
			return  dao.saveOrUpdateAll(c)?MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	public boolean deleteXtNotice(String[] ids,String savePath){
		//等待删除的对象集合
		List<Object> c=new ArrayList<Object>();
		for(String id:ids){
			XtNotice notice=dao.get(XtNotice.class, id);
			if(notice!=null){
				c.add(notice);
				List<XtNoticeFiles> nfs=dao.find("from XtNoticeFiles where noticeId=?",id);
				for(XtNoticeFiles nf:nfs){
					if(nf!=null){
						File file = new File(savePath+"/"+nf.getFileNewName()+"."+nf.getFileExt()); 
						file.delete();
					}
					
				}
			}
		}
		
		return dao.deleteAll(c);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectMyNoticeContent(String id){
		
		StringBuffer sb = new StringBuffer(
				"select new Map(jz as jz,rb.noticeContent as content) from XtNotice as jz,XtNoticeContent as rb where jz.id=rb.noticeId ");
		sb.append(" and jz.id='"+id+"' ");
		List list=new ArrayList();
	
		
		return dao.find(sb.toString());// dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	
	/**
	 * 加载公告文档查询
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List loadNoticeFile(String id) {
		StringBuffer sb = new StringBuffer(" from XtNoticeFiles  where 1=1");
		List list = new ArrayList();
		sb.append(" and noticeId='"+id+"' ");
		return dao.find(sb.toString());
	}
	/**
	 * 根据id查询文档
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List loadNoticeFileByid(String id) {
		StringBuffer sb = new StringBuffer(" from XtNoticeFiles  where 1=1");
		List list = new ArrayList();
		sb.append(" and id='"+id+"' ");
		return dao.find(sb.toString());
	}
}
