/**  
 * @Project: jxoa
 * @Title: SystemLogServiceImpl.java
 * @Package com.jxoa.manager.system.service.impl
 * @date 2013-4-11 下午3:48:17
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.system.bean.SyLog;
import com.jxoa.manager.system.bean.SyLoginLog;
import com.jxoa.manager.system.service.ISystemLogService;

/**
 * 
 * 类名：SystemLogServiceImpl
 * 功能：系统登录日志 系统重要操作日志 业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-11 下午3:48:17
 *
 */
@Service
public class SystemLogServiceImpl extends BaseServiceImpl implements ISystemLogService{
		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectSyLoginLog(FormParam param,SyLoginLog log,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("from SyLoginLog log where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(log.getUserId())){
			sb.append(" and log.userId = ? ");
			list.add(log.getUserId());
		}
		if(StringUtils.isNotBlank(log.getLoginType())){
			sb.append(" and log.loginType = ? ");
			list.add(log.getLoginType());	
		}
		if(StringUtils.isNotBlank(log.getLoginIp())){
			sb.append(" and log.loginIp = ? ");
			list.add(log.getLoginIp());	
		}
		if(startDate!=null){
			sb.append(" and log.loginTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and log.loginTime <=? ");
			list.add(endDate);	
		}
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			
			sb.append(" order by log."+param.getOrderField()+" "+param.getOrderDirection());
			
		}else{
			param.setOrderDirection("desc");
			sb.append(" order by log.loginTime desc");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectSyLoginLogCount(SyLoginLog log,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(*)from SyLoginLog log where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(log.getUserId())){
			sb.append(" and log.userId = ? ");
			list.add(log.getUserId());
		}
		if(StringUtils.isNotBlank(log.getLoginType())){
			sb.append(" and log.loginType = ? ");
			list.add(log.getLoginType());	
		}
		if(StringUtils.isNotBlank(log.getLoginIp())){
			sb.append(" and log.loginIp = ? ");
			list.add(log.getLoginIp());	
		}
		if(startDate!=null){
			sb.append(" and log.loginTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and log.loginTime <=? ");
			list.add(endDate);	
		}
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	public boolean deleteLoginLog(String[] ids){
		for(String id:ids){
			dao.delete("delete SyLoginLog where id=?", id);
		}
		saveLog("删除登录日志", "删除"+ids.length+"条");
		return true;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectSyLog(FormParam param,SyLog log,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("from SyLog log where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(log.getUserId())){
			sb.append(" and log.userId = ? ");
			list.add(log.getUserId());
		}
		if(StringUtils.isNotBlank(log.getActionIp())){
			sb.append(" and log.actionIp = ? ");
			list.add(log.getActionIp());	
		}
		if(startDate!=null){
			sb.append(" and log.actionTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and log.actionTime <=? ");
			list.add(endDate);	
		}
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			
			sb.append(" order by log."+param.getOrderField()+" "+param.getOrderDirection());

		}else{
			param.setOrderDirection("desc");
			sb.append(" order by log.actionTime desc");
		}
	
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectSyLogCount(SyLog log,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(*)from SyLog log where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(log.getUserId())){
			sb.append(" and log.userId = ? ");
			list.add(log.getUserId());
		}
		if(StringUtils.isNotBlank(log.getActionIp())){
			sb.append(" and log.actionIp = ? ");
			list.add(log.getActionIp());	
		}
		if(startDate!=null){
			sb.append(" and log.actionTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and log.actionTime <=? ");
			list.add(endDate);	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	public boolean deleteLog(String[] ids){
		for(String id:ids){
			dao.delete("delete SyLog where id=?", id);
		}
		saveLog("删除操作日志", "删除"+ids.length+"条");
		return true;
	}
}
