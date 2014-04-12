/**  
 * @Project: jxoa
 * @Title: NewsService.java
 * @Package com.jxoa.manager.common_platform.service.impl
 * @date 2013-5-19 上午11:14:34
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.common_platform.bean.Messagemanager;
import com.jxoa.manager.common_platform.service.MessageService;
import org.apache.commons.beanutils.BeanUtils;

/**
 * 
 * 类名：NewsService 功能：新闻管理 详细： 作者：QinXiaohua 版本：1.0 日期：2013-5-19 上午11:14:34
 * 
 */
@Service
public class MessageServiceImpl extends BaseServiceImpl implements MessageService {
	/**
	 * 加载总数
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override 
	public Long selectCount(Messagemanager ng) {
		StringBuffer sb = new StringBuffer(
				"select count(*) from Messagemanager where 1=1");
		List list = new ArrayList();
		if (ng.getStatus() != null) {
			sb.append(" and status=?");
			list.add(ng.getStatus());
		}
		if (StringUtils.isNotBlank(ng.getMestitle())) {
			sb.append(" and mestitle like ?");
			list.add("%" + ng.getMestitle() + "%");
		}
		if (StringUtils.isNotBlank(ng.getTypeid()) && ng.getTypeid() != "全部类型") {
			sb.append(" and typeid=?");
			list.add(ng.getTypeid());
		}
		if (ng.getStartDate() != null) {
			sb.append(" and createdtime>=? ");
			list.add(ng.getStartDate());
		}
		if (ng.getEndDate() != null) {
			sb.append(" and createdtime<=? ");
			list.add(ng.getEndDate());
		}
		
		return (Long) dao.findOne(sb.toString(), list);
	}

	/**
	 * 加载查询
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List messageload(FormParam param, Messagemanager ng) {
		StringBuffer sb = new StringBuffer(" from Messagemanager  where 1=1");
		List list = new ArrayList();
		if (ng.getStatus() != null) {
			sb.append(" and status=?");
			list.add(ng.getStatus());
		}
		if (StringUtils.isNotBlank(ng.getMestitle())) {
			sb.append(" and mestitle like ?");
			list.add("%" + ng.getMestitle() + "%");
		}
		if (StringUtils.isNotBlank(ng.getTypeid()) && ng.getTypeid() != "全部类型") {
			sb.append(" and typeid=?");
			list.add(ng.getTypeid());
		}
		if (ng.getStartDate() != null) {
			sb.append(" and createdtime>=? ");
			list.add(ng.getStartDate());
		}
		if (ng.getEndDate() != null) {
			sb.append(" and createdtime<=? ");
			list.add(ng.getEndDate());
		}
		

		sb.append(" order by createdtime desc");
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	/**
	 * 删除新闻
	 */
	@Override
	public boolean deletemes(String[] ids) {
		List<Object> c = new ArrayList<Object>();
		for (String id : ids) {
			Messagemanager ng = dao.get(Messagemanager.class, id);
			if (ng != null) {
				c.add(ng);
			}
		}
		return dao.deleteAll(c);
	}

	

	/**
	 * 修改留言
	 */
	public String updateMessage(Messagemanager messagemanager) {
		Messagemanager na = dao.get(Messagemanager.class, messagemanager.getId());
		if (na != null) {
			try {
				messagemanager.setStatus(1);
				BeanUtils.copyProperties(na, messagemanager);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
				return MsgConfig.MSG_KEY_SUCCESS;
			}
		else {
			return "msg.data.hasdelete";
		}
	}

	
}
