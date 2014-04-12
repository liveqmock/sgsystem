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
import com.jxoa.manager.qxh.bean.Txry;
import com.jxoa.manager.qxh.service.ITxryService;

/**
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("txry")
public class TxryAction extends BaseAction {
	@Autowired
	private ITxryService iTxryService;

	/**
	 * 初始化退休人员
	 * 
	 * @param txry
	 * @param param
	 * @param map
	 * @return
	 */
	@RequestMapping("txryList")
	public String txryList(Txry txry, FormParam param, ModelMap map) {
		map.addAttribute("txry", iTxryService.txryList(txry, param));
		param.setAllCount(iTxryService.counttxry(txry));
		map.addAttribute("fromParam", param);
		return "qxh/txry/loadtxry";
	}

	/**
	 * 跳转到退休人员增加页面
	 * 
	 * @return
	 */
	@RequestMapping("jumpaddtxry")
	public String jumpaddtxry() {
		return "qxh/txry/addtxry";
	}

	/**
	 * 退休人员增加
	 * 
	 * @param txry
	 * @return
	 */
	@RequestMapping("addtxry")
	public ModelAndView addtxry(Txry txry) {
		txry.setTxryguid(StringUtil.getUUID());
		return ajaxDone(iTxryService.save(txry));
	}

	/**
	 * 跳转到退休人员修改页面
	 * 
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("jumpedittxry")
	public String jumpedittxry(String id, ModelMap map) {
		Object txry = iTxryService.findtxry(id);
		if (txry == null) {
			return NODATA;
		}
		map.addAttribute("ty", txry);
		return "qxh/txry/updatetxry";
	}

	/**
	 * 修改退休人员
	 * 
	 * @param txry
	 * @return
	 */
	@RequestMapping("edittxry")
	public ModelAndView edittxry(Txry txry) {
		System.out.println(txry.getTxryguid());
		return ajaxDone(iTxryService.updatetxry(txry));
	}

	/**
	 * 删除退休人员
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping("deltxry")
	public ModelAndView deltxry(String[] ids) {
		return ajaxDone(iTxryService.deltxry(ids));
	}
}
