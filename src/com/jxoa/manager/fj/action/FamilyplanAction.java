/**
 * 人口计生
 */
package com.jxoa.manager.fj.action;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.fj.bean.Rkjs;
import com.jxoa.manager.fj.service.FamilyplanService;
import com.jxoa.manager.qxh.bean.Rkjb;
import com.jxoa.manager.zck.bean.Shyl;
import com.jxoa.manager.zck.service.PensionService;

/**
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("Familyplan")
public class FamilyplanAction extends BaseAction {
	@Autowired
	private FamilyplanService familyplanService; 
	@Autowired
	private PensionService service; 
	
	@RequestMapping("load")
	public String load(FormParam param,Rkjs rkjs,ModelMap map){
		 Member me=ServletUtil.getMember();
		 String depid=me.getDeptId();
		map.addAttribute("pensions",familyplanService.selectfp(param, rkjs,depid));
		param.setAllCount(familyplanService.selectFPCount(rkjs,depid));
		map.addAttribute("fromParam",param);
		return "fj/Familyplan/loadList";
	}
	@RequestMapping("queryjs")
	public String queryjs(String id,ModelMap map,String bz){
		Rkjs rkjs=familyplanService.get(Rkjs.class, id);
		List list = service.selectRkjb(rkjs.getRkjbguid());
		Rkjb rkjb = new Rkjb();
		if(list!=null && list.size()>0){
			 rkjb =(Rkjb)list.get(0);
		}
		System.out.println(":HHH:"+rkjb.getXm());
		rkjs.setXm(rkjb.getXm());
		if(rkjb==null){
			return NODATA;
		}
		map.addAttribute("r",rkjs);
		map.addAttribute("bz",bz);
		return "fj/Familyplan/check";
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		
		return "fj/Familyplan/loadadd";
	
	}
	/**
	 * 添加计生
	 * @param role
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid Rkjs role,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
	   	 Member me=ServletUtil.getMember();
		 String depid=me.getDeptId();
		String flag = familyplanService.addRkjs(role,depid);
		System.out.println("flag:"+flag);
		return ajaxDone(flag);
	}
	
	/**
	 * 跳转到计生修改页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		Rkjs rkjs=familyplanService.get(Rkjs.class, id);
		List list = service.selectRkjb(rkjs.getRkjbguid());
		Rkjb rkjb = new Rkjb();
		if(list!=null && list.size()>0){
			 rkjb =(Rkjb)list.get(0);
		}
		System.out.println(":HHH:"+rkjb.getXm());
		rkjs.setXm(rkjb.getXm());
		if(rkjb==null){
			return NODATA;
		}
		map.addAttribute("r",rkjs);
		return "fj/Familyplan/loadupdate";
	}
	/**
	 * 修改计生人员信息
	 * @param role
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid Rkjs role,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(familyplanService.updateRkjs(role));
	}
	/**
	 * 删除计生人员
	 * @param ids
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(familyplanService.deleteRkjs(ids));
	
	}
}