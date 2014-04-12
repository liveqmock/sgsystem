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
import com.jxoa.manager.personalOffice.bean.GroupAddressBook;
import com.jxoa.manager.personalOffice.bean.PersonalAddressBook;
import com.jxoa.manager.personalOffice.bean.PublicAddressBook;
import com.jxoa.manager.personalOffice.service.IGroupAddressBookService;
import com.jxoa.manager.personalOffice.service.IPublicAddressBookService;

/**
 * 
 * 类名：GroupAddressBookServiceImpl
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-23 下午02:42:07
 *
 */
@Service
public class GroupAddressBookServiceImpl extends BaseServiceImpl implements IGroupAddressBookService{
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectGroup(FormParam param, GroupAddressBook g) {
		Member me = ServletUtil.getMember();
		StringBuffer sb = new StringBuffer("from GroupAddressBook p where p.grUid=? ");
		List list = new ArrayList();
		list.add(me.getId());
		// 查询条件
		if (g.getGrName() != null && !"".equals(g.getGrName())) {
			sb.append(" and p.puName like ? ");
			list.add("%" + g.getGrName() + "%");

		}
		
		
			sb.append(" order by p.grNo ");

		
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	@Override
	public Long selectGroupCount(GroupAddressBook g) {
		Member me = ServletUtil.getMember();
		StringBuffer sb = new StringBuffer("  select count(*) from GroupAddressBook p where p.grUid=? ");
		List list = new ArrayList();
		list.add(me.getId());
		// 查询条件

		if (g.getGrName() != null && !"".equals(g.getGrName())) {
			sb.append(" and p.puName like ? ");
			list.add("%" + g.getGrName() + "%");

		}
		
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	
	public String addGroup(GroupAddressBook g) {
//		Object obj=dao.findOne("from Public p where  p.puName=? and p.puPhone=?",p.getPuName(),p.getPuPhone());
		Object obj=dao.findOne("from GroupAddressBook g where  g.grName=? and g.grUid=?",g.getGrName(),g.getGrUid());
		if(obj==null){
			Member me = ServletUtil.getMember();
			g.setGrUid(me.getId());
			if (dao.save(g)) {
				return MsgConfig.MSG_KEY_SUCCESS;
			} else {
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.Group.unique";//数据库已有值
		}
	}

	@Override
	public String updateGroup(GroupAddressBook g) {
		if (dao.update(g)) {
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return MsgConfig.MSG_KEY_FAIL;
		}
	}

	@Override
	public String deleteGroup(String[] ids) {
		Collection c = new ArrayList();
		for (String id : ids) {
			List<PersonalAddressBook> list=dao.find("from PersonalAddressBook where peGrouping=?",id);
			if(list.size()==0){
				GroupAddressBook g = dao.get(GroupAddressBook.class, id);
				c.add(g);
				
			}else{
				GroupAddressBook g = dao.get(GroupAddressBook.class, id);
				return "msg.group.delete";
			}
		}
		if (dao.deleteAll(c)) {
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return MsgConfig.MSG_KEY_FAIL;
		}
	}

	@Override
	public GroupAddressBook selectGroup(String id) {
		return dao.get(GroupAddressBook.class, id);
	}

}
