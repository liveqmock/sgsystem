/**  
 * @Project: jxoa
 * @Title: PerMsgServiceImpl.java
 * @Package com.jxoa.manager.personalOffice.service.impl
 * @date 2013-5-21 下午4:24:05
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.personalOffice.bean.PerMsg;
import com.jxoa.manager.personalOffice.service.IPerMsgService;

/**
 * 
 * 类名：PerMsgServiceImpl
 * 功能：消息提醒 业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-21 下午4:24:05
 *
 */
@Service
public class PerMsgServiceImpl extends BaseServiceImpl implements IPerMsgService {

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<PerMsg> selectPerMsg(FormParam param,PerMsg msg,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("from PerMsg m where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(msg.getReadState()!=null){
			sb.append(" and readState=? ");
			list.add(msg.getReadState());
		}
		if(StringUtils.isNotBlank(msg.getUserId())){
			sb.append(" and userId=? ");
			list.add(msg.getUserId());
		}
		if(msg.getMsgType()!=null){
			sb.append(" and m.msgType = ? ");
			list.add(msg.getMsgType());	
		}
		if(startDate!=null){
			sb.append(" and m.msgTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and m.msgTime <=? ");
			list.add(endDate);	
		}
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			
			sb.append(" order by m."+param.getOrderField()+" "+param.getOrderDirection());
			
		}else{
			param.setOrderDirection("desc");
			sb.append(" order by m.msgTime desc");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectPerMsgCount(PerMsg msg,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(*) from PerMsg m where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(msg.getReadState()!=null){
			sb.append(" and readState=? ");
			list.add(msg.getReadState());
		}
		if(StringUtils.isNotBlank(msg.getUserId())){
			sb.append(" and userId=? ");
			list.add(msg.getUserId());
		}
		if(msg.getMsgType()!=null){
			sb.append(" and m.msgType = ? ");
			list.add(msg.getMsgType());	
		}
		if(startDate!=null){
			sb.append(" and m.msgTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and m.msgTime <=? ");
			list.add(endDate);	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	public PerMsg updatefindPerMsgById(String id){
		PerMsg msg=dao.get(PerMsg.class, id);
		if(msg!=null&&msg.getReadState()==0){
			msg.setReadState((short)1);
		}
		return msg;
	}
	
	public boolean deletePerMsg(String[] ids){
	
		for(String id:ids){
			dao.delete(" delete PerMsg where id=? ", id);
		}
		return true;
	}
	
	public Long selectNotReadNumber(){
		
		return (Long)dao.findUniqueOne("select count(*) from PerMsg m where readState=0  and  userId=? ",ServletUtil.getMember().getId());
	}
	
	
	
}
