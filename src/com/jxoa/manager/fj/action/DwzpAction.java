/**
 * 人口计生
 */
package com.jxoa.manager.fj.action;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.StringUtil;
import com.jxoa.manager.fj.bean.Dwzp;
import com.jxoa.manager.fj.service.DwzpService;

/**
 * 初始化页面
 * 
 */
@Controller
@RequestMapping("dwzp")
public class DwzpAction extends BaseAction {
	@Autowired
	private DwzpService dwzpService; 
	/**
	 * 初始化页面
	 * 
	 */
	@RequestMapping("load")
	public String load(FormParam param,Dwzp dwzp,ModelMap map){
		map.addAttribute("pensions",dwzpService.selectdwmc(param, dwzp));
		param.setAllCount(dwzpService.selectdwmcCount(dwzp));
		map.addAttribute("fromParam",param);
		return "fj/dwzp/loadList";
	}
	/**
	 * 详情
	 * 
	 */
	@RequestMapping("queryjs")
	public String queryjs(String id,ModelMap map,String bz){
		Dwzp dwzp=dwzpService.get(Dwzp.class, id);
		if(dwzp==null){
			return NODATA;
		}
		map.addAttribute("r",dwzp);
		map.addAttribute("bz",bz);
		return "fj/dwzp/check";
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		return "fj/dwzp/loadadd";
	}
	/**
	 * 添加
	 * @param role
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid Dwzp role,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		role.setDwzpguid(StringUtil.getUUID());
		String flag = dwzpService.adddwmc(role);
		System.out.println("flag:"+flag);
		return ajaxDone(flag);
	}
	
	/**
	 * 跳转到修改页面
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(String id,ModelMap map){
		Dwzp dwzp=dwzpService.get(Dwzp.class, id);
		if(dwzp==null){
			return NODATA;
		}
		map.addAttribute("r",dwzp);
		return "fj/dwzp/loadupdate";
	}
	/**
	 * 修改信息
	 * @param role
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid Dwzp role,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(dwzpService.updatedwmc(role));
	}
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(dwzpService.deletedwmc(ids));
	
	}
}