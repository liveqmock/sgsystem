/**  
 * @Project: jxoa
 * @Title: RoleAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-4-28 下午2:56:28
 * @Copyright: 2013 
 */
package com.jxoa.manager.zck.action;

import java.util.ArrayList;
import java.util.List;

import javax.management.relation.Role;
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
import com.jxoa.manager.zck.bean.Ylgl;
import com.jxoa.manager.zck.service.PensionService;

/**
 * 
 * 类名：RoleAction
 * 功能：社会管理
 * 详细：
 * 版本：1.0
 *
 */
@Controller
@RequestMapping("/pension")
public class PensionAction extends BaseAction{
	
	@Autowired
	private PensionService service; 
	
	/**
	 * 社会管理显示
	 * @param param
	 * @param pension
	 * @param map
	 * @return
	 */
	
	@RequestMapping("load")
	public String load(FormParam param,Shyl pension,ModelMap map){
		List list = service.selectPension(param, pension);
		List alist = new ArrayList();
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				Shyl yl = (Shyl)list.get(i);
				System.out.println(yl.getRkjbguid());
				List l = service.selectRkjb(yl.getRkjbguid());
				if(l!=null && l.size()>0){
					Rkjb jb = (Rkjb)l.get(0);
					yl.setXm(jb.getXm());
					alist.add(yl);
				}else{
					alist.add(yl);
				}
			}
		}
		map.addAttribute("pensions",alist);
		param.setAllCount(service.selectPensionCount(pension));
		map.addAttribute("fromParam",param);
		map.addAttribute("name",param);
		map.addAttribute("pension",pension);
		return "zck/load";
	
	}
	@RequestMapping("querybypk")
	public String querybypk(String id,ModelMap map,String bz){
		Shyl shyl=service.get(Shyl.class, id);
		List list = service.selectRkjb(shyl.getRkjbguid());
		Rkjb rkjb = new Rkjb();
		if(list!=null && list.size()>0){
			 rkjb =(Rkjb)list.get(0);
		}
		System.out.println(":HHH:"+shyl.getXm());
		shyl.setXm(rkjb.getXm());
		if(shyl==null){
			return NODATA;
		}
		map.addAttribute("r",shyl);
		map.addAttribute("bz",bz);
		return "zck/check";
	
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
		String flag = service.addShyl(role);
		System.out.println("flag:"+flag);
		return ajaxDone(flag);
		
	}
	/**
	 * 跳转到养老修改页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		Shyl role=service.get(Shyl.class, id);
		
		List list = service.selectRkjb(role.getRkjbguid());
		Rkjb rkjb = new Rkjb();
		if(list!=null && list.size()>0){
			 rkjb =(Rkjb)list.get(0);
		}
		role.setXm(rkjb.getXm());
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
	public ModelAndView update(@Valid Ylgl ylgl,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(service.updateShyl(ylgl));
		
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
	
	
	
	
}
