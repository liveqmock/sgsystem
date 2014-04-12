package com.jxoa.manager.fj.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.fj.bean.Grqz;
import com.jxoa.manager.fj.bean.Rkjs;

public interface GrqzService extends IBaseService{
	@SuppressWarnings("rawtypes")
	public List selectgrqz(FormParam param,Grqz a);
	
	public Long selectgrqzCount(Grqz a);
	
	public String addGrqz(Grqz a);
	
	public String updateGrqz(Grqz a);
	public boolean deleteGrqz(String[] ids);
}