/**
 * 
 */
package com.jxoa.manager.qxh.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Txry;

/**
 * @author Administrator
 *
 */
public interface ITxryService extends IBaseService {

	String updatetxry(Txry txry);

	boolean deltxry(String[] ids);

	Long counttxry(Txry txry);

	List txryList(Txry txry, FormParam param);

	Object findtxry(String txryid);


}
