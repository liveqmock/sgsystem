/**  
 * @Project: jxoa
 * @Title: AfficheServiceImpl.java
 * @Package com.jxoa.manager.common_platform.service.impl
 * @date 2013-5-31 上午9:59:41
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.common_platform.bean.XtAffiche;
import com.jxoa.manager.common_platform.bean.XtAfficheDept;
import com.jxoa.manager.common_platform.service.IAfficheService;

/**
 * 
 * 类名：AfficheServiceImpl
 * 功能：公共平台--公告管理业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-5-31 上午9:59:41
 *
 */
@Service
public class AfficheServiceImpl extends BaseServiceImpl implements IAfficheService{

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<XtAffiche> selectAffiche(FormParam param,XtAffiche a,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("from XtAffiche a where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(a.getAfficheType())){
			sb.append(" and a.afficheType =? ");
			list.add(a.getAfficheType());
		}
		if(StringUtils.isNotBlank(a.getUserId())){
			sb.append(" and a.userId =? ");
			list.add(a.getUserId());
		}
		if(startDate!=null){
			sb.append(" and a.createTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and a.createTime <=? ");
			list.add(endDate);	
		}
		if(StringUtils.isNotBlank(a.getAfficheTitle())){
			sb.append(" and a.afficheTitle =? ");
			list.add("%"+a.getAfficheTitle()+"%");
		}
		
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			sb.append(" order by a."+param.getOrderField()+" "+param.getOrderDirection());
		}else{
			param.setOrderDirection("desc");
			sb.append(" order by a.isTop desc,a.createTime desc");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectAfficheCount(XtAffiche a,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(*) from XtAffiche a where 1=1  ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(a.getAfficheType())){
			sb.append(" and a.afficheType =? ");
			list.add(a.getAfficheType());
		}
		if(StringUtils.isNotBlank(a.getUserId())){
			sb.append(" and a.userId =? ");
			list.add(a.getUserId());
		}
		if(startDate!=null){
			sb.append(" and a.createTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and a.createTime <=? ");
			list.add(endDate);	
		}
		if(StringUtils.isNotBlank(a.getAfficheTitle())){
			sb.append(" and a.afficheTitle =? ");
			list.add("%"+a.getAfficheTitle()+"%");
		}
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	public String updateAffiche(XtAffiche xa){
		
		XtAffiche oldxa=dao.get(XtAffiche.class, xa.getId());
		if(oldxa==null){
			return MsgConfig.MSG_KEY_NODATA;
		}
		oldxa.setAfficheContent(xa.getAfficheContent());
		oldxa.setAfficheTitle(xa.getAfficheTitle());
		oldxa.setAfficheType(xa.getAfficheType());
		if(xa.getIsTop()==null||xa.getIsTop()!=1){
			oldxa.setIsTop((short)0);
		}else{
			oldxa.setIsTop((short)1);
		}
		
		return dao.update(oldxa)?MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
	}
	
	public boolean deleteAffiche(String[] ids){
		
		for(String id:ids){
			
			dao.delete("delete XtAffiche where id=? ", id);
		}
		return true;
	}
	
	
	
	
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<XtAfficheDept> selectAfficheDept(FormParam param,XtAfficheDept a,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("from XtAfficheDept a where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(a.getDeptId())){
			sb.append(" and a.deptId =? ");
			list.add(a.getDeptId());
		}
		if(StringUtils.isNotBlank(a.getAfficheType())){
			sb.append(" and a.afficheType =? ");
			list.add(a.getAfficheType());
		}
		if(StringUtils.isNotBlank(a.getUserId())){
			sb.append(" and a.userId =? ");
			list.add(a.getUserId());
		}
		if(startDate!=null){
			sb.append(" and a.createTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and a.createTime <=? ");
			list.add(endDate);	
		}
		if(StringUtils.isNotBlank(a.getAfficheTitle())){
			sb.append(" and a.afficheTitle =? ");
			list.add("%"+a.getAfficheTitle()+"%");
		}
		
		//排序规则
		if(StringUtils.isNotBlank(param.getOrderField())){
			sb.append(" order by a."+param.getOrderField()+" "+param.getOrderDirection());
		}else{
			param.setOrderDirection("desc");
			sb.append(" order by a.isTop desc,a.createTime desc");
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectAfficheDeptCount(XtAfficheDept a,Date startDate,Date endDate){
		
		StringBuffer sb=new StringBuffer("select count(*) from XtAfficheDept a where 1=1  ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(a.getAfficheType())){
			sb.append(" and a.afficheType =? ");
			list.add(a.getAfficheType());
		}
		if(StringUtils.isNotBlank(a.getUserId())){
			sb.append(" and a.userId =? ");
			list.add(a.getUserId());
		}
		if(startDate!=null){
			sb.append(" and a.createTime >=? ");
			list.add(startDate);	
		}
		if(endDate!=null){
			sb.append(" and a.createTime <=? ");
			list.add(endDate);	
		}
		if(StringUtils.isNotBlank(a.getAfficheTitle())){
			sb.append(" and a.afficheTitle =? ");
			list.add("%"+a.getAfficheTitle()+"%");
		}
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	public boolean updateAfficheDept(XtAfficheDept xa){
		
		XtAfficheDept oldxa=dao.get(XtAfficheDept.class, xa.getId());
		oldxa.setAfficheContent(xa.getAfficheContent());
		oldxa.setAfficheTitle(xa.getAfficheTitle());
		oldxa.setAfficheType(xa.getAfficheType());
		oldxa.setDeptId(xa.getDeptId());
		if(xa.getIsTop()==null||xa.getIsTop()!=1){
			oldxa.setIsTop((short)0);
		}else{
			oldxa.setIsTop((short)1);
		}
		
		return dao.update(oldxa);
	}
	
	public boolean deleteAfficheDept(String[] ids){
		
		for(String id:ids){
			
			dao.delete("delete XtAfficheDept where id=? ", id);
		}
		return true;
	}
	
	
	
}
