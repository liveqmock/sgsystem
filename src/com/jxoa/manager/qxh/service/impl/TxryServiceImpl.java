/**
 * 
 */
package com.jxoa.manager.qxh.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;


import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Txry;
import com.jxoa.manager.qxh.service.ITxryService;
import org.apache.commons.beanutils.BeanUtils;

/**
 * @author Administrator
 * 
 */
@Service
public class TxryServiceImpl extends BaseServiceImpl implements ITxryService {
	/**
	 * 初始化退休人员列表
	 * 
	 * @param txry
	 * @param param
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List txryList(Txry txry, FormParam param) {
		StringBuffer sb = new StringBuffer(
				"select new Map(ty as ty,rb.xm as xms)  from Txry as ty,Rkjb as rb where rb.rkjbguid=ty.rkjbguid");
		List list = new ArrayList();
		if (txry.getRkjbguid() != null) {
			sb.append(" and ty.rkjbguid= ?");
			list.add(txry.getRkjbguid());
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	/**
	 * 初始化退休人员总数
	 * 
	 * @param txry
	 * @return
	 */
	@Override
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long counttxry(Txry txry) {
		StringBuffer sb = new StringBuffer(
				"select count(*)from Txry as ty,Rkjb as rb where rb.rkjbguid=ty.rkjbguid");
		List list = new ArrayList();
		if (txry.getRkjbguid() != null) {
			sb.append(" and ty.rkjbguid= ?");
			list.add(txry.getRkjbguid());
		}
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	/**
	 * 删除退休人员
	 * 
	 * @param ids
	 * @return
	 */
	@Override
	public boolean deltxry(String[] ids) {
		for (String id : ids) {
			Txry txry = dao.get(Txry.class, id);
			dao.delete(txry);
		}
		return true;
	}

	/**
	 * 修改退休人员
	 * 
	 * @param txry
	 * @return
	 */
	@Override
	public String updatetxry(Txry txry) {
		Txry ty = dao.get(Txry.class, txry.getTxryguid());
		if (ty != null) {
			try {
				BeanUtils.copyProperties(ty, txry);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return MsgConfig.MSG_KEY_SUCCESS;

	}

	/**
	 * 查找要修改的退休人员
	 * @param txryid
	 * @return
	 */
	@Override
	public Object findtxry(String txryid) {
		Object txry =dao.findOne(
						"select new Map(ty as ty,rb.xm as xms)  from Txry as ty,Rkjb as rb where rb.rkjbguid=ty.rkjbguid and txryguid=?",
						txryid);
		return txry;
	}

}
