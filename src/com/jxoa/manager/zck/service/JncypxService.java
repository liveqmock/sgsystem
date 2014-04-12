/**  
 * @Project: jxoa
 * @Title: INewsService.java
 * @Package com.jxoa.manager.common_platform.service
 * @date 2013-5-19 上午11:14:11
 * @Copyright: 2013 
 */
package com.jxoa.manager.zck.service;



import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.common_platform.bean.Messagemanager;
import com.jxoa.manager.common_platform.bean.Newscomment;
import com.jxoa.manager.common_platform.bean.Newsmanagement;
import com.jxoa.manager.zck.bean.Jncypx;
import com.jxoa.manager.zck.bean.Syrygl;

/**
 * 
 * 类名：INewsService
 * 功能：新闻管理
 * 详细：
 * 作者：QinXiaohua
 * 版本：1.0
 * 日期：2013-5-19 上午11:14:11
 *
 */
public interface JncypxService extends IBaseService
{
	@SuppressWarnings("rawtypes")
	/**
	 * 查询新闻管理里的新闻 
	 * @param param
	 * @param ng
	 * @return
	 */
	public List load(FormParam param,Jncypx ng);
	/**
	 * 查询新闻管量里的新闻总数 
	 * @param ng
	 * @return
	 */
	public Long selectCount(Jncypx ng);
	/**
	 * 删除留言
	 * @param ids
	 * @return
	 */
	public boolean deletejncy(String[] ids);
	@SuppressWarnings("rawtypes")
	
	/**
	 * 修改失业人员
	 * @param ng
	 * @return
	 */
	public String update(Jncypx  syrygl);
	/**
	 * 新增失业人员
	 * @param syry
	 * @return
	 */
	public String add(Jncypx syry);

}