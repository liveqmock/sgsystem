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
import com.jxoa.manager.qxh.bean.Ldjc;
import com.jxoa.manager.qxh.service.ILdjcService;
import org.apache.commons.beanutils.BeanUtils;

import org.apache.commons.lang.StringUtils;
/**
 * @author Administrator
 * 
 */
@Service
public class LdjcServiceImpl extends BaseServiceImpl implements ILdjcService {
	/**
	 * 初始化劳动监察
	 * 
	 * @param param
	 * @param ldjc
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public List ldjcList(FormParam param, Ldjc ldjc) {
		StringBuffer sb = new StringBuffer(" from Ldjc where 1=1 ");
		List list = new ArrayList();
		if (StringUtils.isNotBlank(ldjc.getDwmc())) {
			sb.append(" and dwmc like ?");
			list.add("%" + ldjc.getDwmc());
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	/**
	 * 初始化劳动监察总数
	 * 
	 * @param ldjc
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public Long countldjc(Ldjc ldjc) {
		StringBuffer sb = new StringBuffer("select count(*) from Ldjc ");
		List list = new ArrayList();
		if (StringUtils.isNotBlank(ldjc.getDwmc())) {
			sb.append(" and dwmc like ?");
			list.add("%" + ldjc.getDwmc());
		}
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	/**
	 * 删除劳动监察
	 * 
	 * @param ids
	 * @return
	 */
	@Override
	public boolean delldjc(String[] ids) {
		for (String id : ids) {
			Ldjc ldjc = dao.get(Ldjc.class, id);
			dao.delete(ldjc);
		}
		return true;
	}

	/**
	 * 修改劳动监察
	 * 
	 * @param ldjc
	 * @return
	 */
	@Override
	public String updateldjc(Ldjc ldjc) {
		Ldjc ldjcs = dao.get(Ldjc.class, ldjc.getLdjcguid());
		if (ldjcs != null) {
			 try {
				BeanUtils.copyProperties(ldjcs, ldjc);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return MsgConfig.MSG_KEY_FAIL;
		}
	}

	/**
	 * 查找要修改的劳动监察
	 * 
	 * @param ldjcguid
	 * @return
	 */
	@Override
	public Object findLdjc(String ldjcguid) {
		Object ldjc = dao
				.findOne(
						"select new Map(lc as lc,rb.xm as xms) from Ldjc as lc,Rkjb as rb from lc.lxr=rb.rkjbguid and ldjcguid=?",
						ldjcguid);
		return ldjc;
	}

}
