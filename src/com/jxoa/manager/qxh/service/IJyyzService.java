/**
 * 
 */
package com.jxoa.manager.qxh.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Jyyz;

/**
 * @author Administrator
 *
 */
public interface IJyyzService  extends IBaseService{

	String updatejyyz(Jyyz jyyz);

	boolean deljyyz(String[] ids);

	Object findjyyz(String id);

	Long countjyyz(Jyyz jyyz);

	List jyyzList(FormParam param, Jyyz jyyz);

}
