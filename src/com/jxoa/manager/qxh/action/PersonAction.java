/**
 * 
 */
package com.jxoa.manager.qxh.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Rkjb;
import com.jxoa.manager.qxh.service.IPersonService;

/**
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("person")
public class PersonAction extends BaseAction {
	@Autowired
	private IPersonService iPersonService;

	/**
	 * 人口管理列表页面
	 * 
	 * @param param
	 * @param rkjb
	 * @param Map
	 * @return
	 */
	@RequestMapping("RKJBList")
	public String RKJBList(FormParam param, Rkjb rkjb, ModelMap Map) {
		Map.addAttribute("rkjb", iPersonService.RKJBList(param, rkjb));
		param.setAllCount(iPersonService.countRKJB(rkjb));
		Map.addAttribute("fromParam", param);
		return "WebRoot/text";
	}

	/**
	 * 跳转到增加人员页面
	 * 
	 * @return
	 */
	@RequestMapping("jumpaddRKJB")
	public String jumpaddRKJB() {
		return "qxh/rkjb/addRKJB";
	}

	/**
	 * 增加人员管理
	 * 
	 * @param rkjb
	 * @return
	 */
	@RequestMapping("addRKJB")
	public ModelAndView addRKJB(Rkjb rkjb) {
		return ajaxDone(iPersonService.save(rkjb));
	}

	/**
	 * 跳转到要修改的人员管理
	 * 
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("jumpeditRKJB")
	public String jumpeditRKJB(String id, ModelMap map) {
		Rkjb rkjb = iPersonService.get(Rkjb.class, id);
		if (rkjb == null) {
			return NODATA;
		}
		map.addAttribute("rkjb", rkjb);
		return "qxh/rkjb/updateRKJB";
	}

	/**
	 * 修改人员管理
	 * 
	 * @param rkjb
	 * @return
	 */
	@RequestMapping("editRKJB")
	public ModelAndView editRKJB(Rkjb rkjb) {
		return ajaxDone(iPersonService.editRKJB(rkjb));
	}

	/**
	 * 删除人员管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping("delRKJB")
	public ModelAndView delRKJB(String[] ids) {
		return ajaxDone(iPersonService.delRKJB(ids));

	}
}
