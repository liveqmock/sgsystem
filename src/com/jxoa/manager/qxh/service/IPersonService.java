package com.jxoa.manager.qxh.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Rkjb;

public interface IPersonService  extends IBaseService{

	List RKJBList(FormParam param, Rkjb rkjb);

	Long countRKJB(Rkjb rkjb);

	String editRKJB(Rkjb rkjb);

	boolean delRKJB(String[] ids);
	 boolean delRKJBAll() ;
}
