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
import com.jxoa.manager.personalOffice.bean.PublicGroup;
import com.jxoa.manager.personalOffice.service.IGroupAddressBookService;
import com.jxoa.manager.personalOffice.service.IPublicAddressBookService;
import com.jxoa.manager.personalOffice.service.IPublicGroupService;

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
public class PublicGroupServiceImpl extends BaseServiceImpl implements IPublicGroupService{
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectGroup(FormParam param, PublicGroup g) {
		Member me = ServletUtil.getMember();
		StringBuffer sb = new StringBuffer("from PublicGroup p where 1=1");
		List list = new ArrayList();
		// 查询条件
		if (g.getGaName() != null && !"".equals(g.getGaName())) {
			sb.append(" and p.gaName like ? ");
			list.add("%" + g.getGaName() + "%");

		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	@Override
	public Long selectGroupCount(PublicGroup g) {
		Member me = ServletUtil.getMember();
		StringBuffer sb = new StringBuffer("  select count(*) from PublicGroup p where 1=1 ");
		List list = new ArrayList();
		// 查询条件

		if (g.getGaName() != null && !"".equals(g.getGaName())) {
			sb.append(" and p.gaName like ? ");
			list.add("%" + g.getGaName() + "%");

		}
		
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	
	public String addGroup(PublicGroup g) {
		Object obj=dao.findOne("from PublicGroup g where  g.gaName=? ",g.getGaName());
		if(obj==null){
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
	public String updateGroup(PublicGroup g) {
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
			List<PublicAddressBook> list=dao.find("from PublicAddressBook where puGrouping=?",id);
			if(list.size()==0){
				PublicGroup g = dao.get(PublicGroup.class, id);
				c.add(g);
				
			}else{
				
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
	public PublicGroup selectGroup(String id) {
		return dao.get(PublicGroup.class, id);
	}

}
