/**
 * 
 */
package com.jxoa.manager.personnel.action;

import java.util.Date;

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
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.personalOffice.bean.PersonalAddressBook;
import com.jxoa.manager.personnel.bean.Staff;
import com.jxoa.manager.personnel.service.IStaffService;

/**
 * 
 * 类名：StaffAction
 * 功能：人事管理--人员管理
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013年6月7日 10:06:46
 *
 */
@Controller
@RequestMapping("/staff")
public class StaffAction  extends BaseAction{
	
	@Autowired
	private IStaffService service;
	
	
	/**
	 * 加载
	 * @return
	 */
	@RequestMapping("load")
	public String load(FormParam param, Staff s ,Date staDate,Date endDate , ModelMap map) {
		map.addAttribute("values",service.selectStaff(param,s,staDate,endDate));
		param.setAllCount(service.selectStaffCount(s,staDate,endDate));
		map.addAttribute("fromParam", param);
		return "personnel/staff/load";
	}
	/**
	 * 加载在职员工
	 * @return
	 */
	@RequestMapping("work")
	public String work(FormParam param, Staff s,Date staDate,Date endDate, ModelMap map) {
		map.addAttribute("values",service.selectStaff(param,s,staDate,endDate));
		param.setAllCount(service.selectStaffCount(s,staDate,endDate));
		map.addAttribute("fromParam", param);
		return "personnel/staff/work";
	}
	/**
	 * 加载离职员工
	 * @return
	 */
	@RequestMapping("res")
	public String res(FormParam param, Staff s,Date staDate,Date endDate, ModelMap map) {
		map.addAttribute("valuesRes",service.selectRes(param,s,staDate,endDate));
		param.setAllCount(service.selectResCount(s,staDate,endDate));
		map.addAttribute("fromParam", param);
		return "personnel/staff/res";
	}
	/**
	 * 加载离职退休员工
	 * @return
	 */
	@RequestMapping("ret")
	public String ret(FormParam param, Staff s,Date staDate,Date endDate,ModelMap map) {
		map.addAttribute("valuesRet",service.selectRet(param,s,staDate,endDate));
		param.setAllCount(service.selectRetCount(s,staDate,endDate));
		map.addAttribute("fromParam", param);
		return "personnel/staff/ret";
	}
	
	/**
	 * 跳转到高级检索
	 * @return
	 */
	@RequestMapping("searchTag")
	public String searchTag(String search,ModelMap map) {
		map.put("search", search);
		return "personnel/staff/search";

	}
	/**
	 * 跳转到员工添加页面
	 * @return
	 */
	@RequestMapping("staffAdd")
	public String staffAdd() {
		return "personnel/staff/add";

	}
	/**
	 * 添加员工信息
	 * @param p
	 * @param errors
	 * @return
	 */
	@RequestMapping("add")
	public ModelAndView add(@Valid Staff p, Errors errors) {
	
		if (errors.hasErrors()) {

			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		String status=p.getPsStatus();
		if(status.equals("在职")){
			p.setPsResReason("");
			p.setPsResDate(null);
			p.setPsResRemark("");
			p.setPsRetReason("");
			p.setPsRetDate(null);
			p.setPsRetRemark("");
		}else if(status.equals("离职")){
			p.setPsRetReason("");
			p.setPsRetDate(null);
			p.setPsRetRemark("");
		}else if(status.equals("退休")){
			p.setPsResReason("");
			p.setPsResDate(null);
			p.setPsResRemark("");
		}
		Member me = ServletUtil.getMember();
		p.setPsUid(me.getId());
		p.setPsInDate(DateUtil.currentTimestamp());
		return ajaxDone(service.addStaff(p));

	}
	/**
	 * 跳转到查看页面
	 * @param param
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("find")
	public String find(FormParam param, String id, ModelMap map) {

		map.addAllAttributes(service.updatePage(id));
		if(map.get("ps")==null){
			return NODATA;
		}
		return "personnel/staff/find";
	}
	/**
	 * 跳转到修改页面
	 * @param param
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String updatePage(FormParam param, String id, ModelMap map) {

		map.addAllAttributes(service.updatePage(id));
		if(map.get("ps")==null){
			return NODATA;
		}
		return "personnel/staff/update";
	}
	/**
	 * 修改人员
	 * @param s
	 * @param errors
	 * @return
	 */
	
	@RequestMapping("update")
	public ModelAndView update(@Valid Staff p, Errors errors) {
		if (errors.hasErrors()) {
			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		String status=p.getPsStatus();
		if(status.equals("在职")){
			p.setPsResReason("");
			p.setPsResDate(null);
			p.setPsResRemark("");
			p.setPsRetReason("");
			p.setPsRetDate(null);
			p.setPsRetRemark("");
		}else if(status.equals("离职")){
			p.setPsRetReason("");
			p.setPsRetDate(null);
			p.setPsRetRemark("");
		}else if(status.equals("退休")){
			p.setPsResReason("");
			p.setPsResDate(null);
			p.setPsResRemark("");
		}
		return ajaxDone(service.update(p));
	}
	
	/**
	 * 删除会议
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
	
		return ajaxDone(service.deleteStaff(ids));
	
	}
	
	/**
	 * 跳转到员工状态更新页面
	 * @return
	 */
	@RequestMapping("updateStatusPage")
	public String updateStatusPage() {
		
		return "personnel/staff/updateStatus";

	}
	/**
	 * 修改人员状态
	 * @param s
	 * @param errors
	 * @return
	 */
	
	@RequestMapping("updateStatus")
	public ModelAndView updateStatus(@Valid Staff p, Errors errors) {
		if (errors.hasErrors()) {
			ModelAndView mav = getValidationMessage(errors);
			if (mav != null)
				return mav;
		}
		String status=p.getPsStatus();
		if(status.equals("在职")){
			p.setPsResReason("");
			p.setPsResDate(null);
			p.setPsResRemark("");
			p.setPsRetReason("");
			p.setPsRetDate(null);
			p.setPsRetRemark("");
		}else if(status.equals("离职")){
			p.setPsRetReason("");
			p.setPsRetDate(null);
			p.setPsRetRemark("");
		}else if(status.equals("退休")){
			p.setPsResReason("");
			p.setPsResDate(null);
			p.setPsResRemark("");
		}
		return ajaxDone(service.updateStatus(p));
	}
	
}
