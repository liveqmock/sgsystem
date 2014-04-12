/**  
 * @Project: jxoa
 * @Title: IMeetingService.java
 * @Package com.jxoa.manager.common_platform.service
 * @date 2013-5-9 上午10:25:16
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.common_platform.bean.Room;


/**
 * 
 * 类名：IMeetingService
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013-5-9 上午10:25:16
 *
 */
public interface IRoomService extends IBaseService{
	/**
	 * 会议值条件查询
	 * @param param
	 * @param lv
	 * @return
	 */
	public List selectRoom(FormParam param,Room lv);
	/**
	 * 字段值条件查询 计算总数
	 * @param lv
	 * @return
	 */
	public Long selectRoomCount(Room lv);
	/**
	 * 添加会议值
	 * @param lv
	 * @return
	 */
	public String addRoom(Room lv);
	/**
	 * 修改会议值
	 * @param lv
	 * @return
	 */
	public String updateRoom(Room lv);
	/**
	 * 批量删除会议值
	 * @param ids
	 * @return
	 */
	public boolean deleteRoom(String[] ids);
	/**
	 * 根据会议值类型查询会议值,用户表单的select列表取值
	 * @param type
	 * @return
	 */
	public List selectListByType(Short type);
	
}
