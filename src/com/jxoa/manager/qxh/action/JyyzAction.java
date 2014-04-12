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
import com.jxoa.commons.util.StringUtil;
import com.jxoa.manager.qxh.bean.Jyyz;
import com.jxoa.manager.qxh.service.IJyyzService;

/**
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("jyyz")
public class JyyzAction extends BaseAction {
	@Autowired
	private IJyyzService iJyyzService;

	/**
	 * 初始化就业援助列表
	 * 
	 * @param param
	 * @param jyyz
	 * @param map
	 * @return
	 */
	@RequestMapping("jyyzList")
	public String jyyzList(FormParam param,Jyyz jyyz,ModelMap map) {
		map.addAttribute("jyyz", iJyyzService.jyyzList(param, jyyz));
		param.setAllCount(iJyyzService.countjyyz(jyyz));
		map.addAttribute("fromParam", param);
		return "qxh/jyyz/loadjyyz";
	}

	/**
	 * 跳转到就业援助增加页面
	 * 
	 * @return
	 */
	@RequestMapping("jumpaddjyyz")
	public String jumpaddjyyz() {
		return "qxh/jyyz/addjyyz";
	}

	/**
	 * 增加就业援助
	 * 
	 * @param jyyz
	 * @return
	 */
	@RequestMapping("addjyyz")
	public ModelAndView addjyyz(Jyyz jyyz) {
		jyyz.setJyyzguid(StringUtil.getUUID());
		return ajaxDone(iJyyzService.save(jyyz));
	}

	/**
	 * 跳转到就业救援修改页面
	 * 
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("jumpeditjyyz")
	public String jumpeditjyyz(String id, ModelMap map) {
		Jyyz jyyz = iJyyzService.get(Jyyz.class, id);
		if (jyyz == null) {
			return NODATA;
		} else {
			Object object = iJyyzService.findjyyz(id);
			map.addAttribute("jyyz", object);
			return "qxh/jyyz/updatejyyz";
		}
	}

	/**
	 * 修改就业援助
	 * 
	 * @param jyyz
	 * @return
	 */
	@RequestMapping("editjyyz")
	public ModelAndView editjyyz(Jyyz jyyz) {
		return ajaxDone(iJyyzService.updatejyyz(jyyz));
	}

	/**
	 * 删除就业援助
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping("deljyyz")
	public ModelAndView deljyyz(String[] ids) {
		return ajaxDone(iJyyzService.deljyyz(ids));
	}

}
