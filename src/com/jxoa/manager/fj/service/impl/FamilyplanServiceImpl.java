package com.jxoa.manager.fj.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.cache.MyCache;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.StringUtil;
import com.jxoa.manager.fj.bean.Rkjs;
import com.jxoa.manager.fj.service.FamilyplanService;
import org.apache.commons.beanutils.BeanUtils;
@Service
public class FamilyplanServiceImpl extends BaseServiceImpl implements FamilyplanService{


	public List selectfp(FormParam param, Rkjs a,String depid) {
		StringBuffer sb = new StringBuffer("select new Map(js.rkjsguid as rkjsguids,rk as rk) from Rkjs as js,Rkjb as rk  where js.rkjbguid=rk.rkjbguid" );
		if("D663C662-38E9-4078-B44C-0D081F469177".equals(depid)){
		}else {
			sb.append(" and rk.xzdwguid= '"+depid+"'");
		}
	List list = new ArrayList();
		if (StringUtils.isNotBlank(a.getXm())) {
			sb.append(" and rk.xm like '%"+ a.getXm()+"%'");
		} 
		if (StringUtils.isNotBlank(param.getOrderField())) {
			sb.append(" order by " + param.getOrderField() + " "
					+ param.getOrderDirection());
		} else {
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}
	
	public Long selectFPCount(Rkjs a,String depid) {
		StringBuffer sb = new StringBuffer("select count(*) from Rkjs as js,Rkjb as rk  where js.rkjbguid=rk.rkjbguid ");
		if("D663C662-38E9-4078-B44C-0D081F469177".equals(depid)){
		}else {
			sb.append(" and rk.xzdwguid= '"+depid+"'");
		}
		List list = new ArrayList();
		if (StringUtils.isNotBlank(a.getXm())) {
			sb.append(" and rk.xm like '%"+ a.getXm()+"%'");
		} 
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}

	public String addRkjs(Rkjs a,String depid) {
		a.setRkjbguid(a.getRkjbguid1());
		Object obj=dao.findOne("from Rkjs where rkjbguid=? and xzdwguid=?",a.getRkjbguid(),depid);
		a.setRkjsguid(StringUtil.getUUID());
		if(obj==null){
			String id=(String)dao.saveReturnId(a);
			if(StringUtils.isNotBlank(id)){
				saveLog("添加计生人员", "编码:"+a.getFnbh());
				
				//更新角色id-->name  缓存
				MyCache.getInstance().updateCacheMap(MyCache.ROLE2NAME, id,a.getRkjbguid());
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.role.unique";//此人员已存在
		}
	}

	public String updateRkjs(Rkjs a) {
		String guid = a.getRkjbguid2()==null?"":a.getRkjbguid2().toString();
		if(!"".equals(guid)){
			a.setRkjbguid(guid);
		}
		Object obj=dao.findOne(" from Rkjs where rkjbguid =? and rkjsguid <> ?",a.getRkjbguid(),a.getRkjsguid());
		if(obj==null){
			Rkjs rkjss=dao.get(Rkjs.class, a.getRkjsguid());
			if(rkjss!= null){
				try {
					BeanUtils.copyProperties(rkjss, a);
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				return "msg.data.hasdelete";//数据已经被删除
			}
		
		 }else{
			return "msg.role.unique";//此角色名称已存在
		  }
		return MsgConfig.MSG_KEY_SUCCESS;
	}

	public boolean deleteRkjs(String[] ids) {
		//等待删除的对象集合
		List<Object> c=new ArrayList<Object>();
		for(String id:ids){
			Rkjs r=dao.get(Rkjs.class, id);
			if(r!=null){
				saveLog("删除计生人员", "删除妇女编号:"+r.getFnbh());
				c.add(r);
				MyCache.getInstance().removeCacheMap(MyCache.ROLE2NAME, id);
			}
		}
		return dao.deleteAll(c);
	}
	public List selectShow(FormParam param, Rkjs a) {
		StringBuffer sb = new StringBuffer("  from Rkjs where 1=1 ");
	List list = new ArrayList();
		if (StringUtils.isNotBlank(a.getXm())) {
			sb.append("and rk.xm like '%"+ a.getXm()+"%'");
		} 
		if (StringUtils.isNotBlank(param.getOrderField())) {
			sb.append(" order by " + param.getOrderField() + " "
					+ param.getOrderDirection());
		} else {
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}
	
}