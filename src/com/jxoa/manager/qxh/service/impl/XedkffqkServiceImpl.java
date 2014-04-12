/**
 * 
 */
package com.jxoa.manager.qxh.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Xedkffqk;
import com.jxoa.manager.qxh.service.IXedkffqkService;
import org.apache.commons.beanutils.BeanUtils;

/**
 * @author Administrator
 * 
 */
@Service
public class XedkffqkServiceImpl extends BaseServiceImpl implements
		IXedkffqkService {
	/**
	 * 初始化小额贷款发情况
	 * 
	 * @param param
	 * @param xedkffqk
	 * @return
	 */

	@Override
	public List xedkffqkList(FormParam param, Xedkffqk xedkffqk) {
		StringBuffer sb = new StringBuffer(
				"select new Map(xk as xk,rb.xm as xms) from Xedkffqk as xk,Rkjb as rb where xk.rkjbguid=rb.rkjbguid ");
		List list = new ArrayList();
		if (StringUtils.isNotBlank(xedkffqk.getRkjbguid())) {
			sb.append("  and xk.rkjbguid=?");
			list.add(xedkffqk.getRkjbguid());
		}
		System.out.println(param.getPageNum());
		System.out.println(param.getNumPerPage());
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	/**
	 * 初始小额贷款发放情况
	 * 
	 * @param xedkffqk
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Long countxedkffqk(Xedkffqk xedkffqk) {
		StringBuffer sb = new StringBuffer(
				"select count(*) from Xedkffqk as xk,Rkjb as rb where xk.rkjbguid=rb.rkjbguid");
		List list = new ArrayList();
		if (StringUtils.isNotBlank(xedkffqk.getRkjbguid())) {
			sb.append("  and xk.rkjbguid=?");
			list.add(xedkffqk.getRkjbguid());
		}

		return (Long) dao.findUniqueOne(sb.toString(), list);

	}

	/**
	 * 删除小额贷款发放情况
	 * 
	 * @param ids
	 * @return
	 */
	@Override
	public boolean delxedkffqk(String[] ids) {
		List<Object> c = new ArrayList<Object>();
		for (String id : ids) {
			Xedkffqk ng = dao.get(Xedkffqk.class, id);
			if (ng != null) {
				c.add(ng);
			}
		}
		return dao.deleteAll(c);
	}

	/**
	 * 修改小额贷款发放情况
	 * 
	 * @param xedkffqk
	 * @return
	 */
	@Override
	public String updatexedkffqk(Xedkffqk xedkffqk) {
		Xedkffqk xedkffqks = dao
				.get(Xedkffqk.class, xedkffqk.getXedkffqkguid());
		if (xedkffqks != null) {
			try {
				BeanUtils.copyProperties(xedkffqks, xedkffqk);
				return MsgConfig.MSG_KEY_SUCCESS;
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return MsgConfig.MSG_KEY_FAIL;

	}

	/**
	 * 查找要修改的小额贷款发放
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public Object findxedkffqk(String id) {
		Object object = dao
				.findOne(
						"select new Map(xk as xk,rb.xm as xms) from Xedkffqk as xk,Rkjb as rb where xk.rkjbguid=rb.rkjbguid and xk.xedkffqkguid=?",
						id);
		return object;
	}

}
