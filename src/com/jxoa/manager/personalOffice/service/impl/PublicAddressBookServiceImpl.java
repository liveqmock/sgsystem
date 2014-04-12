/**  
 * @Project: jxoa
 * @Title: PublicServiceImpl.java
 * @Package com.jxoa.manager.PublicOffice.addressBook.Public.service.impl
 * @date 2013-5-21 下午02:42:07
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.personalOffice.bean.PublicAddressBook;
import com.jxoa.manager.personalOffice.service.IPublicAddressBookService;
import com.jxoa.manager.system.bean.ListValues;

/**
 * 
 * 类名：PublicAddressBookServiceImpl
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-23 下午02:42:07
 *
 */
@Service
public class PublicAddressBookServiceImpl extends BaseServiceImpl implements IPublicAddressBookService{
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectPublic(FormParam param, PublicAddressBook p) {
		StringBuffer sb = new StringBuffer("from PublicAddressBook p where 1=1 ");
		List list = new ArrayList();
		// 查询条件
		if (p.getPuName() != null && !"".equals(p.getPuName())) {
			sb.append(" and p.puName like ? ");
			list.add("%" + p.getPuName() + "%");

		}
		if( p.getPuGrouping()!= null && !"".equals(p.getPuGrouping())){
			sb.append(" and p.puGrouping = ? ");
			list.add(p.getPuGrouping());
		}
		if( p.getPuPhone()!= null && !"".equals(p.getPuPhone())){
			sb.append(" and p.puPhone like ? ");
			list.add("%"+p.getPuPhone()+"%");
		}
		if(p.getPuCompany()!= null && !"".equals(p.getPuCompany())){
			sb.append(" and p.puCompany like ? ");
			list.add("%"+p.getPuCompany()+"%");
		}
		if(p.getPuOfficPhone()!= null && !"".equals(p.getPuOfficPhone())){
			sb.append(" and p.puOfficPhone like ?");
			list.add("%"+p.getPuOfficPhone()+"%");
		}
		if(p.getPuHomePhone()!= null && !"".equals(p.getPuHomePhone())){
			sb.append(" and p.puHomePhone like ?");
			list.add("%"+p.getPuHomePhone()+"%");
		}
		if (StringUtils.isNotBlank(param.getOrderField())) {

			sb.append(" order by p." + param.getOrderField() + " "
					+ param.getOrderDirection());

		} else {
			param.setOrderDirection("desc");
			sb.append(" order by p.puGrouping desc");
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	@Override
	public Long selectPublicCount(PublicAddressBook p) {
		StringBuffer sb = new StringBuffer(" select count(*) from PublicAddressBook p where 1=1 ");
		List list = new ArrayList();
		// 查询条件

		if (p.getPuName() != null && !"".equals(p.getPuName())) {
			sb.append(" and p.puName like ? ");
			list.add("%" + p.getPuName() + "%");

		}if(StringUtils.isNotBlank(p.getPuPhone())){
			sb.append(" and p.puPhone like ? ");
			list.add("%"+p.getPuPhone()+"%");
		}
		if(StringUtils.isNotBlank(p.getPuCompany())){
			sb.append(" and p.puCompany like ? ");
			list.add("%"+p.getPuCompany()+"%");
		}
		if(StringUtils.isNotBlank(p.getPuOfficPhone())){
			sb.append(" and p.puOfficPhone like ?");
			list.add("%"+p.getPuOfficPhone()+"%");
		}
		if(StringUtils.isNotBlank(p.getPuOfficPhone())){
			sb.append(" and p.puOfficPhone like ?");
			list.add("%"+p.getPuOfficPhone()+"%");
		}if( p.getPuGrouping()!= null && !"".equals(p.getPuGrouping())){
			sb.append(" and p.puGrouping = ? ");
			list.add(p.getPuGrouping());
		}
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	
	public String addPublic(PublicAddressBook p) {
		Object obj=dao.findOne("from PublicAddressBook p where  p.puName=? and p.puPhone=?",p.getPuName(),p.getPuPhone());
		if(obj==null){
			if (dao.save(p)) {
				return MsgConfig.MSG_KEY_SUCCESS;
			} else {
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.Public.unique";//数据库已有值
		}
	}

	@Override
	public String updatePublic(PublicAddressBook p) {
		if (dao.update(p)) {
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return MsgConfig.MSG_KEY_FAIL;
		}
	}

	@Override
	public boolean deletePublic(String[] ids) {
		for (String id : ids) {
			PublicAddressBook p = dao.get(PublicAddressBook.class, id);
			dao.delete(p);
		}
		return true;
	}

	@Override
	public PublicAddressBook selectPublic(String id) {
		return dao.get(PublicAddressBook.class, id);
	}

	@Override
	public String addExcelPublic( List<PublicAddressBook> list,String group) {
		Collection c=new ArrayList();
		for(int i=0;i<list.size();i++){
			PublicAddressBook p=list.get(i);
			p.setPuGrouping(group);
			c.add(p);
		}
		if (dao.saveOrUpdateAll(c)) {
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return MsgConfig.MSG_KEY_FAIL;
		}
	}

	@Override
	public List selectGroup() {
		return dao.find("from PublicGroup");
	}


}
