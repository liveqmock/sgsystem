/**  
 * @Project: jxoa
 * @Title: RoleAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-4-28 下午2:56:28
 * @Copyright: 2013 
 */
package com.jxoa.manager.zck.action;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Rkjb;
import com.jxoa.manager.system.bean.SyRole;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.system.service.IRoleService;
import com.jxoa.manager.zck.bean.Shyl;
import com.jxoa.manager.zck.service.PensionService;
import com.jxoa.manager.zck.service.RyglService;

/**
 * 
 * 类名：RoleAction
 * 功能：社会管理
 * 详细：
 * 版本：1.0
 *
 */
@Controller
@RequestMapping("/rygl")
public class RyglAction extends BaseAction{
	
	@Autowired
	private RyglService service; 
	
	/**
	 * 社会管理显示
	 * @param param
	 * @param pension
	 * @param map
	 * @return
	 */
	
	@RequestMapping("load")
	public String load(FormParam param,Rkjb pension,ModelMap map,String bz){
		map.addAttribute("pensions",service.selectRygl(param, pension));
		param.setAllCount(service.selectRyglCount(pension));
		map.addAttribute("fromParam",param);
		map.addAttribute("rkjb",pension);
		map.addAttribute("bz",bz);
		return "zck/rygl/load";
	
	}
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		
		return "zck/add";
	
	}
	/**
	 * 添加社会养老
	 * @param role
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid Shyl role,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.addShyl(role));
		
	}
	@RequestMapping("loadxm")
	public String loadxm(FormParam param,Rkjb pension,ModelMap map){
		map.addAttribute("pensions",service.selectRygl(param, pension));
		param.setAllCount(service.selectRyglCount(pension));
		map.addAttribute("fromParam",param);
		return "zck/rygl/load";
	
	}
	/**
	 * 跳转到养老修改页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		List list = service.selectRkjb(id);
		Shyl role=(Shyl)list.get(0);//service.get(Shyl.class, id);
		if(role==null){
			return NODATA;
		}
		map.addAttribute("r",role);
		
		return "zck/update";
	}
	/**
	 * 修改养老
	 * @param role
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid Shyl role,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.updateShyl(role));
		
	}
	/**
	 * 删除养老
	 * @param ids
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(service.deleteShyl(ids));


	
	}
	
	@RequestMapping("loadadd")
	public String loadadd(FormParam param,Rkjb pension,ModelMap map){
		map.addAttribute("pensions",service.selectRygl(param, pension));
		param.setAllCount(service.selectRyglCount(pension));
		map.addAttribute("fromParam",param);
		map.addAttribute("rkjb",pension);
		return "zck/rygl/loadadd";
	
	}
	@RequestMapping("loadupdate")
	public String loadupdate(FormParam param,Rkjb pension,ModelMap map){
		map.addAttribute("pensions",service.selectRygl(param, pension));
		param.setAllCount(service.selectRyglCount(pension));
		map.addAttribute("fromParam",param);
		map.addAttribute("rkjb",pension);
		return "zck/rygl/loadupdate";
	
	}
	
}
