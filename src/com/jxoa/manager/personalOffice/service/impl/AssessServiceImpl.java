
package com.jxoa.manager.personalOffice.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personalOffice.bean.Assess;
import com.jxoa.manager.personalOffice.bean.GroupAddressBook;
import com.jxoa.manager.personalOffice.service.IAssessService;

/**
 * 
 * 类名：IntegrationServiceImpl
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-7-19 上午09:42:07
 *
 */
@Service
public class AssessServiceImpl  extends BaseServiceImpl implements IAssessService{

	@Override
	public List assessLoad(FormParam param, Assess a) {
		
		StringBuffer sb = new StringBuffer("from Assess  where asGroup=? ");
		List list = new ArrayList();
		list.add(a.getAsGroup());
		// 查询条件
		if (a.getAsName() != null && !"".equals(a.getAsName())) {
			sb.append(" and asName like ? ");
			list.add("%" + a.getAsName() + "%");

		}
		if(a.getAsStatus() != null && !"".equals(a.getAsStatus())){
			sb.append(" and asStatus=?");
			list.add(a.getAsStatus());
		}
		if(a.getAsMinute()!= null && !"".equals(a.getAsMinute())){
			sb.append(" and asMinute=?");
			list.add(a.getAsMinute());
		}
		if (StringUtils.isNotBlank(param.getOrderField())) {

			sb.append(" order by " + param.getOrderField() + " "
					+ param.getOrderDirection());

		} else {
			param.setOrderDirection("desc");
			sb.append(" order by asName desc");
			
		}
		
			
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
		
	}
	@Override
	public Long selectAssessCount(Assess a) {
		
		StringBuffer sb = new StringBuffer("select count(*)  from Assess  where asGroup=? ");
		List list = new ArrayList();
		list.add(a.getAsGroup());
		// 查询条件
		if (a.getAsName() != null && !"".equals(a.getAsName())) {
			sb.append(" and asName like ? ");
			list.add("%" + a.getAsName() + "%");

		}
		if(a.getAsStatus() != null && !"".equals(a.getAsStatus())){
			sb.append(" and asStatus=?");
			list.add(a.getAsStatus());
		}
		if(a.getAsMinute()!= null && !"".equals(a.getAsMinute())){
			sb.append(" and asMinute=?");
			list.add(a.getAsMinute());
		}
		
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	@Override
	public String addAssess(Assess a) {
		Object obj=dao.findOne("from Assess where asGroup=? and asName=?", a.getAsGroup(),a.getAsName());
		if(obj==null){
			if (dao.save(a)) {
				return MsgConfig.MSG_KEY_SUCCESS;
			} else {
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.Group.unique";//数据库已有值
		}
	}

	@Override
	public Assess selectAssess(String id) {
		
		return (Assess) dao.findOne("from Assess where id=?", id);
	}

	@Override
	public String updateAssess(Assess a) {
		if (dao.update(a)) {
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return MsgConfig.MSG_KEY_FAIL;
		}
	}

	@Override
	public boolean deleteAssess(String[] ids) {
		for (String id : ids) {
			Assess a = dao.get(Assess.class, id);
			dao.delete(a);
		}
		return true;
	}

	@Override
	public boolean updateStatus(String[] ids,String status) {
		if(status.equals("1")){
			for (String id : ids) {
				Assess a = dao.get(Assess.class, id);
				a.setAsStatus(1);
				dao.update(a);
			}
		}else{
			for (String id : ids) {
				Assess a = dao.get(Assess.class, id);
				a.setAsStatus(0);
				dao.update(a);
			}
		}
		return true;
	}
	@Override
	public List lookUpAssess(FormParam param, Assess as) {
		StringBuffer sb=new StringBuffer("from Assess  where asGroup=? and asStatus=1");
		List list=new ArrayList();
		list.add(as.getAsGroup());
		//查询条件
		if(StringUtils.isNotBlank(as.getAsName())){
			sb.append(" and asName like ? ");
			list.add("%"+as.getAsName()+"%");
		}
//		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		return dao.find(sb.toString(),list);
	}
	@Override
	public Long lookUpAssessCount(Assess as) {
		StringBuffer sb=new StringBuffer("select count(*) from Assess  where asGroup=? and asStatus=1");
		List list=new ArrayList();
		list.add(as.getAsGroup());
		//查询条件
		if(StringUtils.isNotBlank(as.getAsName())){
			sb.append(" and asName like ? ");
			list.add("%"+as.getAsName()+"%");
		}
		 return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	

}
