/**  
 * @Project: jxoa
 * @Title: TableCustomServiceImpl.java
 * @Package com.jxoa.manager.system.service.impl
 * @date 2013-6-17 上午11:57:51
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.manager.system.bean.SyTableCustom;
import com.jxoa.manager.system.service.ITableCustomService;

/**
 * 
 * 类名：TableCustomServiceImpl
 * 功能：
 * 详细：
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-6-17 上午11:57:51
 *
 */
@Service
public class TableCustomServiceImpl extends BaseServiceImpl implements ITableCustomService{

	@SuppressWarnings("unchecked")
	public List<SyTableCustom> selectTableCustom(short type){
		return dao.find("from SyTableCustom t where t.tbType=? order by t.fieldSort asc",type);
	}
	
	@SuppressWarnings("unchecked")
	public List<SyTableCustom> selectTableCustomExport(short type){
		
		return dao.find("from SyTableCustom t where t.tbType=? and t.isExport=1 order by t.fieldSort asc",type);

	}
	@SuppressWarnings("unchecked")
	public List<SyTableCustom> selectTableCustomPrint(short type){
		
		return dao.find("from SyTableCustom t where t.tbType=? and t.isPrint=1 order by t.fieldSort asc",type);

	}
	@SuppressWarnings("unchecked")
	public List<SyTableCustom> selectTableCustomShow(short type){
		
		return dao.find("from SyTableCustom t where t.tbType=? and t.isShow=1 order by t.fieldSort asc",type);

	}
	
	
	public String addTableCustom(SyTableCustom tc){
		
		Object obj=dao.findOne("from SyTableCustom t where t.tbType=? and  t.fieldName=? ",tc.getTbType(),tc.getFieldName());
		if(obj==null){
			return dao.save(tc)?MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
		}else{
			return "msg.SyTableCustom.unique";//已有此字段
		}
	}
	public String updateDevTableCustom(SyTableCustom tc){
		Object obj=dao.findOne("from SyTableCustom t where t.tbType=? and  t.fieldName=? and t.id!=?",tc.getTbType(),tc.getFieldName(),tc.getId());
		if(obj==null){
			return dao.update(tc)?MsgConfig.MSG_KEY_SUCCESS:MsgConfig.MSG_KEY_FAIL;
		}else{
			return "msg.SyTableCustom.unique";//已有此字段
		}
	}
	public String updateTableCustom(SyTableCustom tc){
		SyTableCustom oldtc=dao.get(SyTableCustom.class,tc.getId());
		if(oldtc==null){
			return MsgConfig.MSG_KEY_NODATA;
		}
		oldtc.setFieldSort(tc.getFieldSort());
		oldtc.setFieldAnotherTitle(tc.getFieldAnotherTitle());
		oldtc.setIsExport(tc.getIsExport());
		oldtc.setIsPrint(tc.getIsPrint());
		//oldtc.setIsShow(tc.getIsShow());
		
		return MsgConfig.MSG_KEY_SUCCESS;
	}
	public boolean deleteTableCustom(String[] ids){
	
		for(String id:ids){
			dao.delete("delete SyTableCustom where id=?",id);
		}
	
		return true;
	}
	
}
