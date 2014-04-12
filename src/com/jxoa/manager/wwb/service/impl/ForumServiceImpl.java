package com.jxoa.manager.wwb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.wwb.bean.TbForum;
import com.jxoa.manager.wwb.service.IForumService;

@Service
public class ForumServiceImpl extends BaseServiceImpl implements IForumService {

	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<TbForum> selectTbForum(FormParam param, TbForum tbForum,
			Date startDate, Date endDate) {

		StringBuffer sb = new StringBuffer("from TbForum  tbForum where 1=1 ");
		List list = new ArrayList();

		/*
		 * 拼查询条件
		 */
		// 1.标题
		if (StringUtils.isNotBlank(tbForum.getSubject())) {
			sb.append(" and tbForum.subject like ? ");
			list.add("%" + tbForum.getSubject() + "%");
		}
		// 2.发布人
		if (StringUtils.isNotBlank(tbForum.getId())) {
			sb.append(" and tbForum.id =? ");
			list.add(tbForum.getId());
		}
		// 3.开始时间
		if (startDate != null) {
			sb.append(" and tbForum.publishTime >=? ");
			list.add(startDate);
		}
		// 4.结束时间
		if (endDate != null) {
			sb.append(" and tbForum.publishTime <=? ");
			list.add(endDate);
		}
		// 5.排序规则
		if (StringUtils.isNotBlank(param.getOrderField())) {
			sb.append(" order by tbForum." + param.getOrderField() + " "
					+ param.getOrderDirection());
		} else {
			param.setOrderDirection("desc");
			sb.append(" order by tbForum.isTop desc,tbForum.publishTime desc");
		}

		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectTbForumCount(TbForum tbForum, Date startDate, Date endDate) {
		StringBuffer sb = new StringBuffer(
				"select count(*) from TbForum tbForum where 1=1  ");
		List list = new ArrayList();
		/**
		 * 拼查询条件
		 */
		// 1.标题
		if (StringUtils.isNotBlank(tbForum.getSubject())) {
			sb.append(" and tbForum.subject like ? ");
			list.add("%" + tbForum.getSubject() + "%");
		}
		// 2.发布人
		if (StringUtils.isNotBlank(tbForum.getId())) {
			sb.append(" and tbForum.id =? ");
			list.add(tbForum.getId());
		}
		// 3.开始时间
		if (startDate != null) {
			sb.append(" and tbForum.publishTime >=? ");
			list.add(startDate);
		}
		// 4.结束时间
		if (endDate != null) {
			sb.append(" and tbForum.publishTime <=? ");
			list.add(endDate);
		}
		return (Long)dao.findUniqueOne(sb.toString(),list);
	}



	@Override
	public boolean delete(String[] ids) {
		List<Object> c = new ArrayList<Object>();
		for (String id : ids) {
			TbForum tbforum = dao.get(TbForum.class, id);
			if (tbforum != null) {
				c.add(tbforum);
			}
		}
		return dao.deleteAll(c);
	}

	@Override
	public boolean addForum(TbForum tbforum) {
		//获取当前登录用户
		Member me = ServletUtil.getMember();
		
		//设置发帖人
		tbforum.setUsername(me.getId());
		//设置发帖时间
		tbforum.setPublishTime(DateUtil.currentTimestamp());
		
		return dao.save(tbforum);
	}

}
