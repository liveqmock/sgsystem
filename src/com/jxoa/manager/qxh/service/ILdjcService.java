/**
 * 
 */
package com.jxoa.manager.qxh.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Ldjc;

/**
 * @author Administrator
 *
 */
public interface ILdjcService extends IBaseService{

	Object findLdjc(String ldjcguid);

	String updateldjc(Ldjc ldjc);

	boolean delldjc(String[] ids);

	Long countldjc(Ldjc ldjc);

	List ldjcList(FormParam param, Ldjc ldjc);

}
