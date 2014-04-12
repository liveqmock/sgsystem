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
import java.util.List;

import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.StringUtil;
import com.jxoa.manager.zck.bean.Syrygl;
import com.jxoa.manager.zck.service.SyryglService;
import org.apache.commons.beanutils.BeanUtils;

/**
 * 
 * 类名：NewsService 功能：新闻管理 详细： 作者：QinXiaohua 版本：1.0 日期：2013-5-19 上午11:14:34
 * 
 */
@Service
public class SyryglServiceImpl extends BaseServiceImpl implements SyryglService {
	/**
	 * 加载总数
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override 
	public Long selectCount(Syrygl ng) {
		StringBuffer sb = new StringBuffer(
				"select count(*) from Syrygl where 1=1");
		List list = new ArrayList();
		if (ng.getRkjbguid() != null) {
			sb.append(" and rkjbguid=?");
			list.add(ng.getRkjbguid());
		}
		return (Long) dao.findOne(sb.toString(), list);
	}

	/**
	 * 加载查询
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List load(FormParam param, Syrygl ng) {
		StringBuffer sb = new StringBuffer(" from Syrygl  where 1=1");
		List list = new ArrayList();
		if (ng.getRkjbguid() != null && !"".equals(ng.getRkjbguid())) {
			sb.append(" and rkjbguid=?");
			list.add(ng.getRkjbguid());
		}
		sb.append(" order by sysj desc");
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
			Syrygl ng = dao.get(Syrygl.class, id);
			if (ng != null) {
				c.add(ng);
			}
		}
		return dao.deleteAll(c);
	}

	

	/**
	 * 修改失业人员
	 */
	public String update(Syrygl syry) {
		Object obj=dao.findOne("from Syrygl where rkjbguid=? ",syry.getRkjbguid());
		Syrygl na = dao.get(Syrygl.class, syry.getSyryglguid());
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
	public String add(Syrygl syry) {
		Object obj=dao.findOne("from Syrygl where rkjbguid=? ",syry.getRkjbguid());
		if (obj == null) {
			syry.setSyryglguid(StringUtil.getUUID());
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
