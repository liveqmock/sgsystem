/**  
 * @Project: jxoa
 * @Title: DistrictServiceImpl.java
 * @Package com.jxoa.manager.system.service.impl
 * @date 2013-6-19 下午2:03:19
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.system.bean.SyDistrict;
import com.jxoa.manager.system.service.IDistrictService;

/**
 * 
 * 类名：DistrictServiceImpl
 * 功能：
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-6-19 下午2:03:19
 *
 */
@Service
public class DistrictServiceImpl extends BaseServiceImpl implements IDistrictService{
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectDistrict(FormParam param,SyDistrict dis){
		
		StringBuffer sb=new StringBuffer("from SyDistrict d where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(dis.getSuperId())){
			sb.append(" and d.superId= ? ");
			list.add(dis.getSuperId());
		}
		if(StringUtils.isNotBlank(dis.getDisName())){
			sb.append(" and d.disName like ? ");
			list.add(dis.getDisName()+"%");
		}
		
		sb.append("order by d.disSort asc");
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectDistrictCount(SyDistrict dis){
		
		StringBuffer sb=new StringBuffer("select count(*)from SyDistrict d where 1=1 ");
		List list=new ArrayList();
		if(StringUtils.isNotBlank(dis.getSuperId())){
			sb.append(" and d.superId= ? ");
			list.add(dis.getSuperId());
		}
		if(StringUtils.isNotBlank(dis.getDisName())){
			sb.append(" and d.disName like ? ");
			list.add(dis.getDisName()+"%");
		}
		
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	
	public String addDistrict(SyDistrict dis){
		
		Object obj=dao.findOne("from SyDistrict where superId=? and  disName=? ",dis.getSuperId(),dis.getDisName());
		if(obj==null){
			return dao.save(dis)?MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
		}else{
			return "msg.district.unique";//名称重复
		}
		
		
	}
	public String updateDistrict(SyDistrict dis){
		Object obj=dao.findOne("from SyDistrict where superId=? and  disName=? and id!=?",dis.getSuperId(),dis.getDisName(),dis.getId());
		if(obj==null){
			return dao.update(dis)?MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
		}else{
			return "msg.district.unique";//名称重复
		}
	}
	
	public boolean deleteDistrict(String[] ids){
	
		for(String id:ids){
			dao.delete("delete SyDistrict where id=?",id);
		}
	
		return true;
	}
	@SuppressWarnings("rawtypes")
	public List selectAllDistrict(){
		
		return dao.find("from SyDistrict order by disSort asc");
	}
	
	@SuppressWarnings("rawtypes")
	public List selectDistrictBySuperId(int id){
		
		return dao.find("from SyDistrict where superId=? order by disSort asc",id);
	}
}
