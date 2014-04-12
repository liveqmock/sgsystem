package com.jxoa.manager.wwb.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.wwb.bean.TbForum;

@Service
public interface IForumService extends IBaseService {
	

	/**
	 * 1.条件分页查询   居民论坛
	 * @param param
	 * @param tbForum
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<TbForum> selectTbForum(FormParam param,TbForum tbForum,Date startDate,Date endDate);
	
	/**
	 * 2.条件分页查询  计算总数
	 * @param tbForum
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public Long selectTbForumCount(TbForum tbForum,Date startDate,Date endDate);
	
	
	/**
	 * 3.保存当前发表的新帖子的方法：
	 * 
	 * @return 保存成功返回true，否则false
	 */
	public boolean addForum(TbForum tbform);
	
	/**
	 * 4.批量删除帖子的方法：
	 * 
	 * @param id
	 * @return
	 */
	public boolean delete(String[] ids);
}
