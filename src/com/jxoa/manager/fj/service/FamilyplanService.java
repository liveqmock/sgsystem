package com.jxoa.manager.fj.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.fj.bean.Rkjs;
import com.jxoa.manager.personalOffice.bean.Assess;

public interface FamilyplanService extends IBaseService{
	@SuppressWarnings("rawtypes")
	public List selectfp(FormParam param,Rkjs a,String depid);
	
	public Long selectFPCount(Rkjs a,String depid);
	
	public String addRkjs(Rkjs a,String depid);
	
	public String updateRkjs(Rkjs a);
	public boolean deleteRkjs(String[] ids);
	
	public List selectShow(FormParam param,Rkjs a);
}