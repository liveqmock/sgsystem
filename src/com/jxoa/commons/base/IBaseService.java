package com.jxoa.commons.base;

import java.io.Serializable;
import java.util.Collection;

/**
 * @author LiuJincheng
 * 
 * @desc	基本服务层接口
 *
 */

public interface IBaseService {
	/**
	 * 添加	保存对象
	 * @param 	obj		需要添加的对象
	 * @return boolean	返回保存是否成功
	 */
	public boolean save(Object obj);
	/**
	 * @param 	obj		需要添加的对象
	 * @return 	int 	返回保存的对象生成的id
	 */
	public Serializable saveReturnId(Object o);
	
	/**
	 * 添加或更新
	 * 
	 * @param	obj		需要添加或更新的对象
	 * @return	boolean 添加成功或失败
	 */
	
	public boolean saveOrUpdate(Object o);
	/**
	 * 批量添加或更新
	 * 
	 * @param	obj		需要添加或更新的对象集合
	 * @return	boolean 添加成功或失败
	 */
	public boolean saveOrUpdateAll(Collection<?> c);
	/**
	 * 更新对象 根据对象id 
	 * 
	 * @param obj	对象
	 * @return boolean 	更新成功或失败
	 */
	public boolean update(Object o);
	/**
	 * 删除一个对象
	 * @param obj	对象
	 * @return	boolean	删除成功或失败
	 */
	public boolean delete(Object o);
	/**
	 * 删除一个集合里面的全部对象
	 * 
	 * @param c 对象集合
	 * @return boolean 删除成功或失败
	 */
	public boolean deleteAll(Collection<?> c);
	/**
	 * 单个 查询	根据类型 id	 get方法
	 * @param <T>
	 * 
	 * @param 	c 	对象Class
	 * @param 	id 	对象ID
	 * @return	Object	返回数据对象
	 */
	public <T> T get(Class<T> c, Serializable id);

	
}
