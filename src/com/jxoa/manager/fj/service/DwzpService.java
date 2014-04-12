package com.jxoa.manager.fj.service;

import java.util.List;

import com.jxoa.commons.base.IBaseService;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.fj.bean.Dwzp;

public interface DwzpService extends IBaseService{
	@SuppressWarnings("rawtypes")
	public List selectdwmc(FormParam param,Dwzp a);
	
	public Long selectdwmcCount(Dwzp a);
	
	public String adddwmc(Dwzp a);
	
	public String updatedwmc(Dwzp a);
	public boolean deletedwmc(String[] ids);
	public List selectById(String id) ;
}