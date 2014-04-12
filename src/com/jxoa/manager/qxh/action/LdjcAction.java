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
import com.jxoa.manager.qxh.bean.Ldjc;
import com.jxoa.manager.qxh.service.ILdjcService;

/**
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("ldjc")
public class LdjcAction extends BaseAction {
	@Autowired
	private ILdjcService iLdjcService;

	/**
	 * 初始化劳动监察列表
	 * 
	 * @param param
	 * @param ldjc
	 * @param map
	 * @return
	 */
	@RequestMapping("ldjcList")
	public String ldjcList(FormParam param, Ldjc ldjc, ModelMap map) {
		map.addAttribute("ldjc", iLdjcService.ldjcList(param, ldjc));
		param.setAllCount(iLdjcService.countldjc(ldjc));
		map.addAttribute("fromParam", param);
		return "qxh/ldjc/loadldjc";
	}

	/**
	 * 跳转到劳动监察增加页面
	 * 
	 * @return
	 */
	@RequestMapping("jumpaddldjc")
	public String jumpaddldjc() {
		return "qxh/ldjc/addldjc";
	}

	/**
	 * 增加劳动监察
	 * 
	 * @param ldjc
	 * @return
	 */
	@RequestMapping("addldjc")
	public ModelAndView addldjc(Ldjc ldjc) {
		ldjc.setLdjcguid(StringUtil.getUUID());
		return ajaxDone(iLdjcService.save(ldjc));
	}

	/**
	 * 跳转到劳动监察修改页面
	 * 
	 * @param ldjcguid
	 * @return
	 */
	@RequestMapping("jumpeditldjc")
	public String jumpeditldjc(String id, ModelMap map) {
		Ldjc ldjc = iLdjcService.get(Ldjc.class, id);
		if (ldjc == null) {
			return NODATA;
		}
		map.addAttribute("ldjc", ldjc);
		return "qxh/ldjc/updateldjc";
	}

	/**
	 * 修改劳动监察
	 * 
	 * @param ldjc
	 * @return
	 */
	@RequestMapping("editldjc")
	public ModelAndView editldjc(Ldjc ldjc) {
		return ajaxDone(iLdjcService.updateldjc(ldjc));
	}

	/**
	 * 删除劳动监察
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping("delldjc")
	public ModelAndView delldjc(String[] ids) {
		return ajaxDone(iLdjcService.delldjc(ids));
	}
}
