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
import java.util.Collection;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.common_platform.bean.Newscomment;
import com.jxoa.manager.common_platform.bean.Newsmanagement;
import com.jxoa.manager.common_platform.service.INewsService;
import org.apache.commons.beanutils.BeanUtils;

/**
 * 
 * 类名：NewsService 功能：新闻管理 详细： 作者：QinXiaohua 版本：1.0 日期：2013-5-19 上午11:14:34
 * 
 */
@Service
public class NewsServiceImpl extends BaseServiceImpl implements INewsService {
	/**
	 * 加载总数
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Long selectCount(Newsmanagement ng) {
		StringBuffer sb = new StringBuffer(
				"select count(*) from Newsmanagement where 1=1");
		List list = new ArrayList();
		if (ng.getStatus() != null) {
			sb.append("  and status=?");
			list.add(ng.getStatus());
		}
		if (StringUtils.isNotBlank(ng.getNewstitle())) {
			sb.append(" and newstitle like ?");
			list.add("%" + ng.getNewstitle() + "%");
		}
		if (StringUtils.isNotBlank(ng.getTypeid())) {
			sb.append(" and typeid=?");
			list.add(ng.getTypeid());
		}
		if (ng.getStartDate() != null) {
			sb.append(" and createdtime>=?");
			list.add(ng.getStartDate());
		}
		if (ng.getEndDate() != null) {
			sb.append(" and createdtime<=?");
			list.add(ng.getEndDate());
		}
		return (Long) dao.findOne(sb.toString(), list);
	}

	/**
	 * 加载查询
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List newsload(FormParam param, Newsmanagement ng) {
		StringBuffer sb = new StringBuffer(" from Newsmanagement  where 1=1");
		List list = new ArrayList();
		if (ng.getStatus() != null) {
			sb.append(" and status=?");
			list.add(ng.getStatus());
		}
		if (StringUtils.isNotBlank(ng.getNewstitle())) {
			sb.append(" and newstitle like ?");
			list.add("%" + ng.getNewstitle() + "%");
		}
		if (StringUtils.isNotBlank(ng.getTypeid()) && ng.getTypeid() != "全部类型") {
			sb.append(" and typeid=?");
			list.add(ng.getTypeid());
		}
		if (ng.getStartDate() != null) {
			sb.append(" and createdtime>=?");
			list.add(ng.getStartDate());
		}
		if (ng.getEndDate() != null) {
			sb.append(" and createdtime<=?");
			list.add(ng.getEndDate());
		}

		if (StringUtils.isNotBlank(param.getOrderField())) {

			sb.append(" order by " + param.getOrderField() + " "
					+ param.getOrderDirection());

		} else {
			param.setOrderDirection("desc");
			sb.append(" order by stick desc , createdtime desc,hits desc,contents desc");
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	/**
	 * 删除新闻
	 */
	@Override
	public boolean deletenews(String[] ids) {
		List<Object> c = new ArrayList<Object>();
		for (String id : ids) {
			Newsmanagement ng = dao.get(Newsmanagement.class, id);
			if (ng != null) {
				c.add(ng);
			}
		}
		return dao.deleteAll(c);
	}

	/**
	 * 查询评论
	 */
	public List selectNewscomment(String id, FormParam param) {

		return dao
				.findPage(
						"select nc from Newscomment nc where nc.newsid=?  order by conmmentsdate desc",
						param.getPageNum(), param.getNumPerPage(), id);
	}

	/**
	 * 查询评论总条数
	 */
	public Long selectNewscommentCount(String id) {
		return (Long) dao
				.findOne(
						"select count(nc.newsid) from Newscomment nc where nc.newsid =?",
						id);
	}

	/**
	 * 删除评论
	 */
	@SuppressWarnings("unchecked")
	public String deletecontent(String id, String newsid) {
		Newsmanagement ng = dao.get(Newsmanagement.class, newsid);
		if (ng != null) {
			ng.setContents(ng.getContents() - 1);
			dao.delete("delete from Newscomment where id=?", id);
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return "msg.data.hasdelete";
		}

	}

	/**
	 * 评论总条数
	 */
	public Long contentCount(String id) {
		return (Long) dao
				.findOne(
						"select count(nc.answernewscomments) from Newscomment nc where nc.newsid =?",
						id);
	}

	/**
	 * 修改成终止
	 */
	public boolean updatestop(String[] ids) {
		for (String id : ids) {
			dao.update("update Newsmanagement set status=? where id=?", 0, id);
		}
		return true;
	}

	/**
	 * 修改成生成
	 */
	public boolean updategenerate(String[] ids) {
		for (String id : ids) {
			dao.update("update Newsmanagement set status=? where id=?", 1, id);
		}
		return true;
	}

	/**
	 * 修改点击数
	 */
	public Newsmanagement updateSelectOne(String id) {
		Newsmanagement ng = dao.get(Newsmanagement.class, id);
		if (ng != null) {
			ng.setHits(ng.getHits() + 1);// 当点击新闻以后新闻的点击数自动增1
		}
		return ng;
	}

	/**
	 * 修改评论数
	 */
	public String updatecontent(Newscomment nc) {
		Newsmanagement ng = dao.get(Newsmanagement.class, nc.getNewsid());
		if (ng != null) {
			ng.setContents(ng.getContents() + 1);// 当评论以后评论条自动增1
			dao.save(nc);
			return MsgConfig.MSG_KEY_SUCCESS;
		}
		return "msg.data.hasdelete";
	}

	/**
	 * 修改新闻
	 */
	public String updatenews(Newsmanagement ng) {
		Newsmanagement na = dao.get(Newsmanagement.class, ng.getId());
		if (na != null) {
			try {
				BeanUtils.copyProperties(na, ng);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return "msg.data.hasdelete";
		}
	}

	/**
	 * 批量导入
	 * 
	 * @param list
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String addallnews(List<Newsmanagement> list) {
		Collection cl = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			Newsmanagement nc = list.get(i);
			cl.add(nc);
		}
		if (dao.saveOrUpdateAll(cl)) {
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return "msg.data.hasdelete";
		}
	}
	/**
	 * 查询评论
	 */
	public List selectNewsByid(String id, FormParam param) {

		return dao.find(" from Newsmanagement  where id="+id+"  order by createdtime desc");
	}
}
