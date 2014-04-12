/**
 * 
 */
package com.jxoa.manager.qxh.action;

import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.qxh.bean.Xedkffqk;
import com.jxoa.manager.qxh.service.IXedkffqkService;

/**
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("xedkffqk")
public class XedkffqkAction extends BaseAction {
	@Autowired
	private IXedkffqkService iXedkffqkService;

	/**
	 * 初始化小额贷款发放情况
	 * 
	 * @param param
	 * @param xedkffqk
	 * @param map
	 * @return
	 */
	@RequestMapping("xedkffqkList")
	public String xedkffqkList(FormParam param, Xedkffqk xedkffqk, ModelMap map) {
		map.addAttribute("xe", iXedkffqkService.xedkffqkList(param, xedkffqk));
		param.setAllCount(iXedkffqkService.countxedkffqk(xedkffqk));
		map.addAttribute("fromParam", param);
		return "qxh/xedkffqk/loadxedkffqk";
	}

	/**
	 * 跳 转小额贷款发放情况增加
	 * 
	 * @param param
	 * @param xedkffqk
	 * @param map
	 * @return
	 */
	@RequestMapping("jumpaddxedkffqk")
	public String jumpaddxedkffqk() {
		return "qxh/xedkffqk/addxedkffqk";
	}

	/**
	 * 增加小额贷款发放情况
	 * 
	 * @param param
	 * @param xedkffqk
	 * @param map
	 * @return
	 */
	@RequestMapping("addxedkffqk")
	public ModelAndView addxedkffqk(Xedkffqk xedkffqk) {
		xedkffqk.setXedkffqkguid(com.jxoa.commons.util.StringUtil.getUUID());
		return ajaxDone(iXedkffqkService.save(xedkffqk));
	}

	/**
	 * 跳转修改小额贷款发放情况
	 * 
	 * @param param
	 * @param xedkffqk
	 * @param map
	 * @return
	 */
	@RequestMapping("findxedkffqk")
	public String findxedkffqk(String id, ModelMap map) {
		Object xe = iXedkffqkService.findxedkffqk(id);
		if (xe == null) {
			return NODATA;
		}
		map.addAttribute("xe", xe);
		return "qxh/xedkffqk/updatexedkffqk";
	}

	/**
	 * 修改小额贷款发放情况
	 * 
	 * @param param
	 * @param xedkffqk
	 * @param map
	 * @return
	 */
	@RequestMapping("editxedkffqk")
	public ModelAndView editxedkffqk(Xedkffqk xedkffqk) {
		return ajaxDone(iXedkffqkService.updatexedkffqk(xedkffqk));
	}

	/**
	 * 删除小额贷款发放情况
	 * 
	 * @param param
	 * @param xedkffqk
	 * @param map
	 * @return
	 */
	@RequestMapping("delxedkffqk")
	public ModelAndView delxedkffqk(String[] ids) {
		return ajaxDone(iXedkffqkService.delxedkffqk(ids));
	}
}
