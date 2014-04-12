/**
 * 
 */
package com.jxoa.manager.qxh.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Rkjb;
import com.jxoa.manager.qxh.service.IPersonService;

/**
 * @author Administrator
 * 
 */
@Service
public class PersonServiceImpl extends BaseServiceImpl implements
		IPersonService {
	/**
	 * 查询人员管理列表信息
	 * 
	 * @param param
	 * @param rkjb
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List RKJBList(FormParam param, Rkjb rkjb) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer("from Rkjb where 1=1");
		if (rkjb.getXm() != null) {
			sb.append(" and xm like ?");
			list.add("%" + rkjb.getXm() + "%");
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	/**
	 * 查询人员管理信息总数
	 * 
	 * @param rkjb
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Long countRKJB(Rkjb rkjb) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer(
				"select count(*) from Rkjb where 1=1");
		if (rkjb.getXm() != null) {
			sb.append(" and xm like ?");
			list.add("%" + rkjb.getXm() + "%");
		}
		return (Long) dao.findOne(sb.toString(), list);

	}

	public Rkjb findRKJB(String id) {
		return dao.get(Rkjb.class, id);
	}

	/**
	 * 修改人员管理
	 * 
	 * @param rkjb
	 * @return
	 */
	@Override
	public String editRKJB(Rkjb rkjb) {
		Rkjb rkjbs = dao.get(Rkjb.class, rkjb.getRkjbguid());
		if (rkjb != null) {
			BeanUtils.copyProperties(rkjb, rkjbs);
			return MsgConfig.MSG_KEY_SUCCESS;
		}
		return MsgConfig.MSG_KEY_FAIL;

	}

	/**
	 * 删除人员管理
	 * 
	 * @param ids
	 * @return
	 */
	@Override
	public boolean delRKJB(String[] ids) {
		for (String id : ids) {
			Rkjb rkjb = dao.get(Rkjb.class, id);
			dao.delete(rkjb);
		}
		return true;
	}
	/**
	 * 删除suoyou人员管理
	 * 
	 * @param ids
	 * @return
	 */
	@Override
	public boolean delRKJBAll() {
		dao.delete("delete from Rkjb where rkjbguid!=?","");
		return true;
	}
}
