/**  
 * @Project: jxoa
 * @Title: NewsService.java
 * @Package com.jxoa.manager.common_platform.service.impl
 * @date 2013-5-19 上午11:14:34
 * @Copyright: 2013 
 */
package com.jxoa.manager.zck.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.zck.bean.Jncypx;
import com.jxoa.manager.zck.service.JncypxService;
import org.apache.commons.beanutils.BeanUtils;

/**
 * 
 * 类名：NewsService 功能：新闻管理 详细： 作者：QinXiaohua 版本：1.0 日期：2013-5-19 上午11:14:34
 * 
 */
@Service
public class JncypxServiceImpl extends BaseServiceImpl implements JncypxService {
	/**
	 * 加载总数
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override 
	public Long selectCount(Jncypx ng) {
		StringBuffer sb = new StringBuffer(
				"select count(*) from Jncypx where 1=1");
		List list = new ArrayList();
		if (ng.getRkjbguid() != null && !"".equals(ng.getRkjbguid())) {
			sb.append(" and rkjbguid=?");
			list.add(ng.getRkjbguid());
		}
		return (Long) dao.findOne(sb.toString(), list);
	}

	/**
	 * 加载查询
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List load(FormParam param, Jncypx ng) {
		StringBuffer sb = new StringBuffer(" from Jncypx  where 1=1");
		List list = new ArrayList();
		if (ng.getRkjbguid() != null && !"".equals(ng.getRkjbguid())) {
			sb.append(" and rkjbguid=?");
			list.add(ng.getRkjbguid());
		}
		sb.append(" order by pxsj desc");
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	/**
	 * 技能创业培训
	 */
	@Override
	public boolean deletejncy(String[] ids) {
		List<Object> c = new ArrayList<Object>();
		for (String id : ids) {
			Jncypx ng = dao.get(Jncypx.class, id);
			if (ng != null) {
				c.add(ng);
			}
		}
		return dao.deleteAll(c);
	}

	

	/**
	 * 修改失业人员
	 */
	public String update(Jncypx syry) {
		Object obj=dao.findOne("from Jncypx where rkjbguid=? ",syry.getRkjbguid());
		Jncypx na = dao.get(Jncypx.class, syry.getJncypxguid());
		if(obj!=null){
			if (na != null) {
				try {
					BeanUtils.copyProperties(na, syry);
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
		}else{
			return "msg.shyl.unique";
		}
	}
	/**
	 * 新增失业人员
	 */
	public String add(Jncypx syry) {
		Object obj=dao.findOne("from Jncypx where rkjbguid=? ",syry.getRkjbguid());
		if (obj == null) {
			if (dao.save(syry)) {
				return MsgConfig.MSG_KEY_SUCCESS;
			} else {
				return MsgConfig.MSG_KEY_FAIL;
			}
		}
		else {
			return "msg.shyl.unique";
		}
	}
	
}
