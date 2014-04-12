/**  
 * @Project: jxoa
 * @Title: INewsService.java
 * @Package com.jxoa.manager.common_platform.service
 * @date 2013-5-19 上午11:14:11
 * @Copyright: 2013 
 */
package com.jxoa.manager.common_platform.service;



import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.common_platform.bean.Newscomment;
import com.jxoa.manager.common_platform.bean.Newsmanagement;

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
public interface INewsService extends IBaseService
{
	@SuppressWarnings("rawtypes")
	/**
	 * 查询新闻管理里的新闻 
	 * @param param
	 * @param ng
	 * @return
	 */
	public List newsload(FormParam param,Newsmanagement ng);
	/**
	 * 查询新闻管量里的新闻总数 
	 * @param ng
	 * @return
	 */
	public Long selectCount(Newsmanagement ng);
	/**
	 * 删除新闻
	 * @param ids
	 * @return
	 */
	public boolean deletenews(String[] ids);
	@SuppressWarnings("rawtypes")
	/**
	 * 查看评论论内容
	 * @param id
	 * @param param
	 * @return
	 */
	public List selectNewscomment(String id,FormParam param);
	/**
	 *  查看评论总数
	 * @param id
	 * @return
	 */
	public Long selectNewscommentCount(String id);
	/**
	 * 删除评论
	 * @param id
	 * @param newsid
	 * @return
	 */
	public String deletecontent(String id,String newsid);
	/**
	 * 评论总数
	 * @param id
	 * @return
	 */
	public Long contentCount(String id);
	/**
	 * 修改新闻状态成终止
	 * @param ids
	 * @return
	 */
	public boolean updatestop(String[] ids);
	/**
	 * 修改成生成
	 * @param ids
	 * @return
	 */
	public boolean updategenerate(String[] ids);
	/**
	 * 修改点击数
	 * @param id
	 * @return
	 */
	public Newsmanagement updateSelectOne(String id);
	/**
	 * 保存评论和修改评论数
	 * @param nc
	 * @return
	 */
	public String updatecontent(Newscomment nc);
	/**
	 * 修改新闻
	 * @param ng
	 * @return
	 */
	public String updatenews(Newsmanagement ng);
	/**
	 * 批量导入
	 * @param nc
	 * @return
	 */
    public String addallnews(List<Newsmanagement> list);	
    public List selectNewsByid(String id, FormParam param);
}