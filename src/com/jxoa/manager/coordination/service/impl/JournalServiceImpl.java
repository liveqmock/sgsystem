/**  
 * @Project: jxoa
 * @Title: JournalServiceImpl.java
 * @Package com.jxoa.manager.coordination.service.impl
 * @date 2013-5-23 上午10:14:22
 * @Copyright: 2013 
 */
package com.jxoa.manager.coordination.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.coordination.bean.XtJournal;
import com.jxoa.manager.coordination.bean.XtJournalUser;
import com.jxoa.manager.coordination.service.IJournalService;

/**
 * 
 * 类名：JournalServiceImpl
 * 功能：日志管理 业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-23 上午10:14:22
 *
 */
@Service
public class JournalServiceImpl extends BaseServiceImpl implements IJournalService{
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectJournal(FormParam param,XtJournal xj,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("from XtJournal j where 1=1 ");
		List list=new ArrayList();
		
		//查询条件
		if(StringUtils.isNotBlank(xj.getUserId())){
			sb.append(" and j.userId = ? ");
			list.add(xj.getUserId());
		}
		if(StringUtils.isNotBlank(xj.getJournalTitle())){
			sb.append(" and j.journalTitle like ? ");
			list.add("%"+xj.getJournalTitle()+"%");
		}
		if(StringUtils.isNotBlank(xj.getJournalType())){
			sb.append(" and j.journalType = ? ");
			list.add(xj.getJournalType());	
		}
		if(startDate!=null){
			sb.append(" and j.journalTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and j.journalTime <=? ");
			list.add(endDate);	
		}
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			
			sb.append(" order by j."+param.getOrderField()+" "+param.getOrderDirection());
			
		}else{
			param.setOrderDirection("desc");
			sb.append(" order by j.journalTime desc");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectJournalCount(XtJournal xj,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(*)from XtJournal j where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(xj.getUserId())){
			sb.append(" and j.userId = ? ");
			list.add(xj.getUserId());
		}
		if(StringUtils.isNotBlank(xj.getJournalTitle())){
			sb.append(" and j.journalTitle like ? ");
			list.add("%"+xj.getJournalTitle()+"%");
		}
		if(StringUtils.isNotBlank(xj.getJournalType())){
			sb.append(" and j.journalType = ? ");
			list.add(xj.getJournalType());	
		}
		if(startDate!=null){
			sb.append(" and j.journalTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and j.journalTime <=? ");
			list.add(endDate);	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectJournalShare(FormParam param,XtJournal xj,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select j from XtJournal j,XtJournalUser u where u.userId=? and u.journalId=j.id ");
		List list=new ArrayList();
		list.add(ServletUtil.getMember().getId());
		//查询条件
		if(StringUtils.isNotBlank(xj.getUserId())){
			sb.append(" and j.userId = ? ");
			list.add(xj.getUserId());
		}
		if(StringUtils.isNotBlank(xj.getJournalTitle())){
			sb.append(" and j.journalTitle like ? ");
			list.add("%"+xj.getJournalTitle()+"%");
		}
		if(StringUtils.isNotBlank(xj.getJournalType())){
			sb.append(" and j.journalType = ? ");
			list.add(xj.getJournalType());	
		}
		if(startDate!=null){
			sb.append(" and j.journalTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and j.journalTime <=? ");
			list.add(endDate);	
		}
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			
			sb.append(" order by j."+param.getOrderField()+" "+param.getOrderDirection());
			
		}else{
			param.setOrderDirection("desc");
			sb.append(" order by j.journalTime desc");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectJournalShareCount(XtJournal xj,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(*)from XtJournal j,XtJournalUser u where u.userId=? and u.journalId=j.id  ");
		List list=new ArrayList();
		list.add(ServletUtil.getMember().getId());
		//查询条件
		if(StringUtils.isNotBlank(xj.getUserId())){
			sb.append(" and j.userId = ? ");
			list.add(xj.getUserId());
		}
		if(StringUtils.isNotBlank(xj.getJournalTitle())){
			sb.append(" and j.journalTitle like ? ");
			list.add("%"+xj.getJournalTitle()+"%");
		}
		if(StringUtils.isNotBlank(xj.getJournalType())){
			sb.append(" and j.journalType = ? ");
			list.add(xj.getJournalType());	
		}
		if(startDate!=null){
			sb.append(" and j.journalTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and j.journalTime <=? ");
			list.add(endDate);	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	
	
	public boolean saveJournal(XtJournal xj,String[] userIds,Integer isSendMsg){
		
		String id=(String)dao.saveReturnId(xj);
		List<XtJournalUser> list=new ArrayList<XtJournalUser>();
		for(String uid:userIds){
			XtJournalUser ju=new XtJournalUser();
			ju.setJournalId(id);
			ju.setUserId(uid);
			list.add(ju);
		}
		//发送消息提醒
		if(isSendMsg!=null&&isSendMsg==1){
			saveMsgWarn(4, id, userIds,null);
		}
		return dao.saveOrUpdateAll(list);
	}
	public String updateJournal(XtJournal xj,String[] userIds,Integer isSendMsg){
		
		XtJournal oldxj=dao.get(XtJournal.class, xj.getId());
		if(oldxj==null){
			return MsgConfig.MSG_KEY_NODATA;
		}
		if(!ServletUtil.getMember().getId().equals(oldxj.getUserId())){
			return MsgConfig.MSG_KEY_FAIL;
		}
		oldxj.setJournalContent(xj.getJournalContent());
		oldxj.setJournalTime(xj.getJournalTime());
		oldxj.setJournalTitle(xj.getJournalTitle());
		oldxj.setJournalType(xj.getJournalType());
		
		List<String> addUserIds=new ArrayList<String>();
		for(String id:userIds){
			addUserIds.add(id);
		}
		List<String> oldUserIds=dao.find("select userId from XtJournalUser where journalId=?",oldxj.getId());
		
		//原先已有的-现在需要添加的==需要删除的
		List<String> delUserIds=new ArrayList<String>(oldUserIds);//需要删除的
		delUserIds.remove(addUserIds);
		for(String id:delUserIds){
			dao.delete("delete XtJournalUser where journalId=? and userId=? ",oldxj.getId(),id);
		}
		//现在需要添加的-原先已有的=需要真正添加的
		addUserIds.remove(oldUserIds);
		
		//等待更新的对象集合
		List<Object> c=new ArrayList<Object>();
		
		for(String id:addUserIds){
			XtJournalUser ju=new XtJournalUser();
			ju.setJournalId(oldxj.getId());
			ju.setUserId(id);
			c.add(ju);
		}
		//发送消息提醒
		if(isSendMsg!=null&&isSendMsg==1){
			saveMsgWarn(4, oldxj.getId(), addUserIds,null);
		}
		return dao.saveOrUpdateAll(c)?MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
		
	}
	
	public boolean deleteJournal(String[] ids){
		String userId=ServletUtil.getMember().getId();
		for(String id:ids){
			
			dao.delete("delete XtJournal where id=? and userId=?", id,userId);
		}
		return true;
	}
	
	public String selectJournalUserIds(String id){
		
		return StringUtils.join(dao.find("select userId from XtJournalUser where journalId=?",id),",");
		
	}
	
	
}
