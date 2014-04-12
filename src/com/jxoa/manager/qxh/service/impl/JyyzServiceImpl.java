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
import com.jxoa.manager.qxh.bean.Jyyz;
import com.jxoa.manager.qxh.service.IJyyzService;
import org.apache.commons.beanutils.BeanUtils;

/**
 * @author Administrator
 * 
 */
@Service
public class JyyzServiceImpl extends BaseServiceImpl implements IJyyzService {
	/**
	 * 初始就业援助列表
	 * 
	 * @param param
	 * @param jyyz
	 * @return
	 */
	@Override
	public List jyyzList(FormParam param, Jyyz jyyz) {
		StringBuffer sb = new StringBuffer(
				"select new Map(jz as jz,rb.xm as xms) from Jyyz as jz,Rkjb as rb where jz.rkjbguid=rb.rkjbguid");
		List list = new ArrayList();
		if (StringUtils.isNotBlank(jyyz.getRkjbguid())) {
			sb.append(" and jz.rkjbguid like ?");
			list.add("%" + jyyz.getRkjbguid() + "%");
			System.out.println(jyyz.getRkjbguid());
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	/**
	 * 初始化救援助总数
	 * 
	 * @param jyyz
	 * @return
	 */
	@Override
	public Long countjyyz(Jyyz jyyz) {
		StringBuffer sb = new StringBuffer(
				"select count(*) from Jyyz as jz,Rkjb as rb where jz.rkjbguid=rb.rkjbguid");
		List list = new ArrayList();
		if (StringUtils.isNotBlank(jyyz.getRkjbguid())) {
			sb.append(" and jz.rkjbguid like ?");
			list.add("%" + jyyz.getRkjbguid() + "%");
		}
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	/**
	 * 查找要修改的救援
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public Object findjyyz(String id) {
		System.out.println(id);
		Object object = dao
				.findOne(
						"select new Map(jz as jz,rb.xm as xms) from Jyyz as jz,Rkjb as rb where jz.rkjbguid=rb.rkjbguid and jyyzguid=?",
						id);
		return object;
	}

	/**
	 * 删除就业援助
	 * 
	 * @return
	 */
	@Override
	public boolean deljyyz(String[] ids) {
		for (String id : ids) {

			Jyyz jyyz = dao.get(Jyyz.class, id);
			dao.delete(jyyz);
		}
		return true;
	}

	/**
	 * 修改就业援助
	 * 
	 * @param jyyz
	 * @return
	 */
	@Override
	public String updatejyyz(Jyyz jyyz) {
		Jyyz jyyzs = dao.get(Jyyz.class, jyyz.getJyyzguid());
		if (jyyzs != null) {
			try {
				BeanUtils.copyProperties(jyyzs, jyyz);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			return MsgConfig.MSG_KEY_SUCCESS;
		}
		return MsgConfig.MSG_KEY_FAIL;

	}

}
