/**  
 * @Project: jxoa
 * @Title: ListValuesServiceImpl.java
 * @Package com.jxoa.manager.system.service.impl
 * @date 2013-4-15 下午2:36:49
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.cache.MyCache;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.system.bean.ListValues;
import com.jxoa.manager.system.service.IListValuesService;

/**
 * 
 * 类名：ListValuesServiceImpl
 * 功能：字典值管理 业务层实现
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-15 下午2:36:49
 *
 */
@Service
public class ListValuesServiceImpl extends BaseServiceImpl implements IListValuesService{
		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectListValues(FormParam param,ListValues lv){
		
		StringBuffer sb=new StringBuffer("from ListValues lv where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(lv.getListValue())){
			sb.append(" and lv.listValue like ? ");
			list.add("%"+lv.getListValue()+"%");
		}
		if(lv.getListType()!=null&&lv.getListType()!=0){
			sb.append(" and lv.listType = ? ");
			list.add(lv.getListType());	
		}
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Long selectListValuesCount(ListValues lv){
		
		StringBuffer sb=new StringBuffer("select count(*)from ListValues lv where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(lv.getListValue())){
			sb.append(" and lv.listValue like ? ");
			list.add("%"+lv.getListValue()+"%");
		}
		if(lv.getListType()!=null&&lv.getListType()!=0){
			sb.append(" and lv.listType = ? ");
			list.add(lv.getListType());	
		}
		
		return (Long)dao.findUniqueOne(sb.toString(),list);
		
	}
	
	public String addListValues(ListValues lv){
		
		Object obj=dao.findOne("from ListValues where listType=? and  listValue=? ",lv.getListType(),lv.getListValue());
		if(obj==null){
			String id=(String)dao.saveReturnId(lv);
			if(StringUtils.isNotBlank(id)){
				
				saveLog("添加字典值", "类型:"+lv.getListType()+",字典值:"+lv.getListValue());
				
				//更新字典值id-->name  缓存
				MyCache.getInstance().updateCacheMap(MyCache.LISTID2NAME, id, lv.getListValue());
				
				Map<String,List<Map<String,String>>>type2ListValues=(Map<String,List<Map<String,String>>>)ServletUtil.getServletContextAttribute(MyCache.TYPE2LISTVALUES);
				
				List<Map<String,String>> list=type2ListValues.get("type_"+lv.getListType());
				
				Map<String,String> m=new HashMap<String,String>();
				m.put("value",id);
				m.put("name", lv.getListValue());
				
				if(list==null){
					list=new ArrayList<Map<String,String>>();
					list.add(m);
					type2ListValues.put("type_"+lv.getListType(), list);
				}else{
					list.add(m);
				}
				
				
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.listvalue.unique";//此字典值已有
		}
	}

	public String updateListValues(ListValues lv){
		Object obj=dao.findOne("from ListValues where id!=? and listType=? and  listValue=? ",lv.getId(),lv.getListType(),lv.getListValue());
		if(obj==null){
			if(dao.update(lv)){
				saveLog("修改字典值", "类型:"+lv.getListType()+",字典值:"+lv.getListValue());
				
				//更新字典值id-->name  缓存
				MyCache.getInstance().updateCacheMap(MyCache.LISTID2NAME, lv.getId(), lv.getListValue());
				Map<String,List<Map<String,String>>>type2ListValues=(Map<String,List<Map<String,String>>>)ServletUtil.getServletContextAttribute(MyCache.TYPE2LISTVALUES);
				List<Map<String,String>> list=type2ListValues.get("type_"+lv.getListType());
				Map<String,String> m=new HashMap<String,String>();
				m.put("value",lv.getId());
				m.put("name", lv.getListValue());
				if(list==null){
					list=new ArrayList<Map<String,String>>();
					list.add(m);
					type2ListValues.put("type_"+lv.getListType(), list);
				}else{
					for(Map<String,String> map:list){
						String id=(String)map.get("value");
						if(lv.getId().equals(id)){
							map.put("name", lv.getListValue());
							break;
						}
					}
				}
				
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.listvalue.unique";//此字典值已有
		}
	}
	
	
	public boolean deleteListValues(String[] ids){
		//等待删除的对象集合
		List<Object> c=new ArrayList<Object>();
		for(String id:ids){
			ListValues lv=dao.get(ListValues.class, id);
			if(lv!=null){
				saveLog("删除字典值", "字典值:"+lv.getListValue());
				c.add(lv);
				
				//更新字典值id-->name  缓存
				MyCache.getInstance().removeCacheMap(MyCache.LISTID2NAME, lv.getId());
				Map<String,List<Map<String,String>>>type2ListValues=(Map<String,List<Map<String,String>>>)ServletUtil.getServletContextAttribute(MyCache.TYPE2LISTVALUES);
				
				List<Map<String,String>> list=type2ListValues.get("type_"+lv.getListType());
				
				Map<String,String> m=new HashMap<String,String>();
				m.put("value",lv.getId());
				m.put("name", lv.getListValue());
				if(list!=null){
					list.remove(m);
				}
			}
			
		}
	
		return dao.deleteAll(c);
	}
	
	public List<ListValues> selectAllListValues(){
		
		return dao.find("from ListValues ");
		
	}
	

	public List selectListByType(Short type){
		
		return dao.find("from ListValues lv where listType=? ",type);
		
	}
}
