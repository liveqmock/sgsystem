/**  
 * @Project: jxoa
 * @Title: MeetingServiceImpl.java
 * @Package com.jxoa.manager.common_platform.service.impl
 * @date 2013-5-9 上午10:29:47
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.service.impl;

import java.util.ArrayList;
import java.util.List;


import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.common_platform.bean.Room;
import com.jxoa.manager.common_platform.service.IRoomService;


/**
 * 
 * 类名：MeetingServiceImpl
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-9 上午10:29:47
 *
 */
@Service(value="roomServiceImpl")
public class RoomServiceImpl extends BaseServiceImpl implements IRoomService {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectRoom(FormParam param, Room lv) {
		
		StringBuffer sb=new StringBuffer("from Room lv where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(lv.getMrName())){
			sb.append(" and lv.mrName like ? ");
			list.add("%"+lv.getMrName()+"%");
		}
	
		
		return dao.findPage(sb.toString(),param.getPageNum(),param.getNumPerPage(),list);
		
	}

	@Override
	public Long selectRoomCount(Room lv) {
		StringBuffer sb=new StringBuffer("select count(*) from Room lv where 1=1 ");
		List list=new ArrayList();
		//查询条件
		if(StringUtils.isNotBlank(lv.getMrName())){
			sb.append(" and lv.mrName like ? ");
			list.add("%"+lv.getMrName()+"%");
		}
		
		
		return (Long)dao.findOne(sb.toString(),list);
	}

	@Override
	public String addRoom(Room lv) {
		Object obj=dao.findOne("from Room where  mrName=?  ",lv.getMrName());
		if(obj==null){
			
			if(dao.save(lv)){
//				saveLog("添加会议室", "名称:"+lv.getMrName()+",容纳人数:"+lv.getMrNum());
				return MsgConfig.MSG_KEY_SUCCESS;
			}else{
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.room.unique";//已有该会议室
		}
	}

	@Override
	public String updateRoom(Room r) {
		if (dao.update(r)) {
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return MsgConfig.MSG_KEY_FAIL;
		}
	}

	@Override
	public boolean deleteRoom(String[] ids) {
		boolean boo = false;
		for (String id : ids) {
		
			Room r = dao.get(Room.class, id);
			dao.delete(r);
			boo = true;
		}
		return boo;
	}

	@Override
	public List selectListByType(Short type) {
		// TODO Auto-generated method stub
		return null;
	}


}
