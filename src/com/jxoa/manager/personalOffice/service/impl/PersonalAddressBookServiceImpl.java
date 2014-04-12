/**  
 * @Project: jxoa
 * @Title: PersonalServiceImpl.java
 * @Package com.jxoa.manager.personalOffice.addressBook.Personal.service.impl
 * @date 2013-5-21 下午02:42:07
 * @Copyright: 2013 
 */
package com.jxoa.manager.personalOffice.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.personalOffice.bean.PersonalAddressBook;
import com.jxoa.manager.personalOffice.service.IPersonalAddressBookService;

/**
 * 
 * 类名：PersonalAddressBookServiceImpl
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-21 下午02:42:07
 *
 */
@Service
public class PersonalAddressBookServiceImpl extends BaseServiceImpl implements IPersonalAddressBookService{
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectPersonal(FormParam param, PersonalAddressBook p) {
		Member me = ServletUtil.getMember();
		StringBuffer sb = new StringBuffer("from PersonalAddressBook p where p.peUid=? ");
		List list = new ArrayList();
		list.add(me.getId());
		// 查询条件
		if (p.getPeName() != null && !"".equals(p.getPeName())) {
			sb.append(" and p.peName like ? ");
			list.add("%" + p.getPeName() + "%");

		}
		if (p.getPeGrouping() != null && !"".equals(p.getPeGrouping())) {
			sb.append(" and p.peGrouping = ? ");
			list.add( p.getPeGrouping());

		}
		if( p.getPePhone()!= null && !"".equals(p.getPePhone())){
			sb.append(" and p.pePhone like ? ");
			list.add("%"+p.getPePhone()+"%");
		}
		if(p.getPeCompany()!= null && !"".equals(p.getPeCompany())){
			sb.append(" and p.peCompany like ? ");
			list.add("%"+p.getPeCompany()+"%");
		}
		if(p.getPeOfficPhone()!= null && !"".equals(p.getPeOfficPhone())){
			sb.append(" and p.peOfficPhone like ?");
			list.add("%"+p.getPeOfficPhone()+"%");
		}
		if(p.getPeHomePhone()!= null && !"".equals(p.getPeHomePhone())){
			sb.append(" and p.peHomePhone like ?");
			list.add("%"+p.getPeHomePhone()+"%");
		}
		if (StringUtils.isNotBlank(param.getOrderField())) {

			sb.append(" order by p." + param.getOrderField() + " "
					+ param.getOrderDirection());

		} else {
			param.setOrderDirection("desc");
			sb.append(" order by p.peGrouping desc");
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	@Override
	public Long selectPersonalCount(PersonalAddressBook p) {
		Member me = ServletUtil.getMember();
		StringBuffer sb = new StringBuffer(" select count(*) from PersonalAddressBook p where p.peUid=? ");
		List list = new ArrayList();
		list.add(me.getId());
		// 查询条件

		if (p.getPeName() != null && !"".equals(p.getPeName())) {
			sb.append(" and p.peName like ? ");
			list.add("%" + p.getPeName() + "%");

		}if(StringUtils.isNotBlank(p.getPePhone())){
			sb.append(" and p.pePhone like ? ");
			list.add("%"+p.getPePhone()+"%");
		}
		if(StringUtils.isNotBlank(p.getPeCompany())){
			sb.append(" and p.peCompany like ? ");
			list.add("%"+p.getPeCompany()+"%");
		}
		if(StringUtils.isNotBlank(p.getPeOfficPhone())){
			sb.append(" and p.peOfficPhone like ?");
			list.add("%"+p.getPeOfficPhone()+"%");
		}
		if(StringUtils.isNotBlank(p.getPeOfficPhone())){
			sb.append(" and p.peOfficPhone like ?");
			list.add("%"+p.getPeOfficPhone()+"%");
		}
		if (p.getPeGrouping() != null && !"".equals(p.getPeGrouping())) {
			sb.append(" and p.peGrouping = ? ");
			list.add( p.getPeGrouping());

		}
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	
	public String addPersonal(PersonalAddressBook p) {
		Member me = ServletUtil.getMember();
		Object obj=dao.findOne("from PersonalAddressBook p where p.peUid=?  and p.peName=? and p.pePhone=?",me.getId(),p.getPeName(),p.getPePhone());
		if(obj==null){
			p.setPeUid(me.getId());
			if (dao.save(p)) {
				return MsgConfig.MSG_KEY_SUCCESS;
			} else {
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.personal.unique";//数据库已有值
		}
	}

	@Override
	public String updatePersonal(PersonalAddressBook p) {
		if (dao.update(p)) {
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return MsgConfig.MSG_KEY_FAIL;
		}
	}

	@Override
	public boolean deletePersonal(String[] ids) {
		for (String id : ids) {
			PersonalAddressBook p = dao.get(PersonalAddressBook.class, id);
			dao.delete(p);
		}
		return true;
	}

	@Override
	public PersonalAddressBook selectPersonal(String id) {
		return dao.get(PersonalAddressBook.class, id);
	}

	@Override
	public List selectGroup() {
		Member me = ServletUtil.getMember();
		return dao.find("from GroupAddressBook p where p.grUid=? order by p.grNo ",me.getId());
	}

}
