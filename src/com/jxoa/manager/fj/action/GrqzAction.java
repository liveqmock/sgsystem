/**
 * 求职
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
import com.jxoa.commons.util.StringUtil;
import com.jxoa.manager.fj.bean.Grqz;
import com.jxoa.manager.fj.service.GrqzService;
import com.jxoa.manager.qxh.bean.Rkjb;
import com.jxoa.manager.zck.service.PensionService;

/**
 * 初始化页面
 * 
 */
@Controller
@RequestMapping("grqz")
public class GrqzAction extends BaseAction {
	@Autowired
	private GrqzService grqzService; 
	@Autowired
	private PensionService service; 
	/**
	 * 初始化页面
	 * 
	 */
	@RequestMapping("load")
	public String load(FormParam param,Grqz grqz,ModelMap map){
		map.addAttribute("pensions",grqzService.selectgrqz(param, grqz));
		param.setAllCount(grqzService.selectgrqzCount(grqz));
		map.addAttribute("fromParam",param);
		return "fj/grqz/loadList";
	}
	/**
	 * 详情
	 * 
	 */
	@RequestMapping("queryjs")
	public String queryjs(String id,ModelMap map,String bz){
		Grqz grqz=grqzService.get(Grqz.class, id);
		List list = service.selectRkjb(grqz.getRkjbguid());
		Rkjb rkjb = new Rkjb();
		if(list!=null && list.size()>0){
			 rkjb =(Rkjb)list.get(0);
		}
		System.out.println(":HHH:"+rkjb.getXm());
		grqz.setXm(rkjb.getXm());
		if(rkjb==null){
			return NODATA;
		}
		map.addAttribute("r",grqz);
		map.addAttribute("bz",bz);
		return "fj/grqz/check";
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping("addPage")
	public String addPage(){
		return "fj/grqz/loadadd";
	}
	/**
	 * 添加
	 * @param role
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid Grqz role,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		role.setGrqzguid(StringUtil.getUUID());
		String flag = grqzService.addGrqz(role);
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
		Grqz grqz=grqzService.get(Grqz.class, id);
		List list = service.selectRkjb(grqz.getRkjbguid());
		Rkjb rkjb = new Rkjb();
		if(list!=null && list.size()>0){
			 rkjb =(Rkjb)list.get(0);
		}
		System.out.println(":HHH:"+rkjb.getXm());
		grqz.setXm(rkjb.getXm());
		if(rkjb==null){
			return NODATA;
		}
		map.addAttribute("r",grqz);
		return "fj/grqz/loadupdate";
	}
	/**
	 * 修改信息
	 * @param role
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(@Valid Grqz role,Errors errors){
		if(errors.hasErrors()) {  
			ModelAndView mav=getValidationMessage(errors);
			if(mav!=null)return mav;
        }
		return ajaxDone(grqzService.updateGrqz(role));
	}
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		
		return ajaxDone(grqzService.deleteGrqz(ids));
	
	}
}