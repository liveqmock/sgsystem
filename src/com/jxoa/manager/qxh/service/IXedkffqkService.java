/**
 * 
 */
package com.jxoa.manager.qxh.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Xedkffqk;

/**
 * @author Administrator
 * 
 */
public interface IXedkffqkService extends IBaseService {

	List xedkffqkList(FormParam param, Xedkffqk xedkffqk);

	Long countxedkffqk(Xedkffqk xedkffqk);

	boolean delxedkffqk(String[] ids);

	String updatexedkffqk(Xedkffqk xedkffqk);

	Object findxedkffqk(String id);

}
