/**  
 * @Project: jxoa
 * @Title: InstantMessageServiceImpl.java
 * @Package com.jxoa.manager.personalOffice.service.impl
 * @date 2013-5-24 下午5:06:14
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.personalOffice.bean.PerInstantMessage;
import com.jxoa.manager.personalOffice.bean.PerMsg;
import com.jxoa.manager.personalOffice.service.IInstantMessageService;

/**
 * 
 * 类名：InstantMessageServiceImpl
 * 功能：即时消息 业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-24 下午5:06:14
 *
 */
@Service
public class InstantMessageServiceImpl extends BaseServiceImpl implements IInstantMessageService{

	public boolean addInstantMessage(String messageContent,String[] userIds){
		
		if(userIds.length==0)return false;
		String sendUid=ServletUtil.getMember().getId();
		Timestamp time= DateUtil.currentTimestamp();
		//等待保存的对象集合
		List<PerInstantMessage> c=new ArrayList<PerInstantMessage>();
		for(String id:userIds){
			PerInstantMessage im=new PerInstantMessage();
			im.setCreateTime(time);
			im.setMessageContent(messageContent);
			im.setReceiveUid(id);
			im.setSendUid(sendUid);
			im.setReadState((short)0);
			c.add(im);
		}
		return  dao.saveOrUpdateAll(c);
		
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<PerMsg> selectInstantMessage(FormParam param,PerInstantMessage im,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("from PerInstantMessage m where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(im.getReadState()!=null){
			sb.append(" and m.readState =? ");
			list.add(im.getReadState());
		}
		if(StringUtils.isNotBlank(im.getSendUid())){
			sb.append(" and m.sendUid =? ");
			list.add(im.getSendUid());
		}
		if(StringUtils.isNotBlank(im.getReceiveUid())){
			sb.append(" and m.receiveUid =? ");
			list.add(im.getReceiveUid());
		}
		if(startDate!=null){
			sb.append(" and m.createTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and m.createTime <=? ");
			list.add(endDate);	
		}
		
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			sb.append(" order by m."+param.getOrderField()+" "+param.getOrderDirection());
		}else{
			param.setOrderDirection("desc");
			sb.append(" order by m.createTime desc");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectInstantMessageCount(PerInstantMessage im,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(*) from PerInstantMessage m where 1=1  ");
		List list=new ArrayList();
		//查询条件
		if(im.getReadState()!=null){
			sb.append(" and m.readState =? ");
			list.add(im.getReadState());
		}
		if(StringUtils.isNotBlank(im.getSendUid())){
			sb.append(" and m.sendUid =? ");
			list.add(im.getSendUid());
		}
		if(StringUtils.isNotBlank(im.getReceiveUid())){
			sb.append(" and m.receiveUid =? ");
			list.add(im.getReceiveUid());
		}
		if(startDate!=null){
			sb.append(" and m.createTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and m.createTime <=? ");
			list.add(endDate);	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<PerMsg> selectHistoryMessage(FormParam param,String userId,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("from PerInstantMessage m where (sendUid=? and receiveUid=?) or (sendUid=? and receiveUid=?) ");
		List list=new ArrayList();
		String myId=ServletUtil.getMember().getId();
		list.add(myId);
		list.add(userId);
		list.add(userId);
		list.add(myId);
		//查询条件
		if(startDate!=null){
			sb.append(" and m.createTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and m.createTime <=? ");
			list.add(endDate);	
		}
		
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			sb.append(" order by m."+param.getOrderField()+" "+param.getOrderDirection());
		}else{
			param.setOrderDirection("desc");
			sb.append(" order by m.createTime desc");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectHistoryMessageCount(String userId,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(*) from PerInstantMessage m where (sendUid=? and receiveUid=?) or (sendUid=? and receiveUid=?) ");
		List list=new ArrayList();
		String myId=ServletUtil.getMember().getId();
		list.add(myId);
		list.add(userId);
		list.add(userId);
		list.add(myId);
		//查询条件
		if(startDate!=null){
			sb.append(" and m.createTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and m.createTime <=? ");
			list.add(endDate);	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	public PerInstantMessage updatefindInstantMessageById(String id){
		PerInstantMessage msg=dao.get(PerInstantMessage.class, id);
		if(msg!=null&&msg.getReadState()==0){
			if(msg.getReceiveUid().equals(ServletUtil.getMember().getId()))
			msg.setReadState((short)1);
		}
		return msg;
	}
	
	public boolean deleteInstantMessage(String[] ids){
		
		for(String id:ids){
			dao.delete(" delete PerInstantMessage where id=? ", id);
		}
		return true;
	}
	
	
	
	
}
