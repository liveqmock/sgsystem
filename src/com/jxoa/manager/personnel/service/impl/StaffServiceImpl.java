/**
 * 
 */
package com.jxoa.manager.personnel.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.jxoa.commons.base.BaseServiceImpl;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.manager.personnel.bean.Staff;
import com.jxoa.manager.personnel.service.IStaffService;

/**
 * 
 * 类名：StaffServiceImpl
 * 功能：
 * 详细：
 * 作者：曹中德(caozhongde)
 * 版本：1.0
 * 日期：2013年6月8日 15:23:23
 *
 */
@Service
public class StaffServiceImpl extends BaseServiceImpl implements IStaffService{

	@Override
	public List selectStaff(FormParam param, Staff s,Date staDate,Date endDate) {
		StringBuffer sb = new StringBuffer("from Staff  where psStatus='在职' ");
		List list = new ArrayList();
		//条件查询的 还没写
		if(s.getPsName()!=null&&!"".equals(s.getPsName())){
			sb.append(" and psName like ? ");
			list.add("%" + s.getPsName() + "%");
		}
		if(s.getPsHomeTown()!=null&&!"".equals(s.getPsHomeTown())){
			sb.append(" and psHomeTown like ? ");
			list.add("%" + s.getPsHomeTown() + "%");
		}
		if(s.getPsSex()!=null&&!"".equals(s.getPsSex())){
			
			sb.append(" and psSex = ? ");
			list.add( s.getPsSex());
		}
		if(staDate!=null&&!"".equals(staDate)){
			sb.append(" and psEntryDate >= ? ");
			list.add( staDate);
		}
		if(endDate!=null&&!"".equals(endDate)){
			sb.append(" and psEntryDate <= ? ");
			list.add( endDate);
		}
		
		if(s.getPsAge()!=null&&s.getPsAge()!=0){
			sb.append(" and psAge = ? ");
			list.add( s.getPsAge());
		}
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		if(s.getPsPhone()!=null&&!"".equals(s.getPsPhone())){
			sb.append(" and psPhone like ? ");
			list.add("%" + s.getPsPhone() + "%");
		}
		
		if(s.getPsOther()!=null&&!"".equals(s.getPsOther())){
			sb.append(" and psOther like ? ");
			list.add("%" + s.getPsOther() + "%");
		}
		if(s.getPsAccountAddress()!=null&&!"".equals(s.getPsAccountAddress())){
			sb.append(" and psAccountAddress like ? ");
			list.add("%" + s.getPsAccountAddress() + "%");
		}
		
		if(s.getPsEthnic()!=null&&!"".equals(s.getPsEthnic())){
			sb.append(" and psEthnic like ? ");
			list.add("%" + s.getPsEthnic() + "%");
		}
		
		if(s.getPsCard()!=null&&!"".equals(s.getPsCard())){
			sb.append(" and psCard like ? ");
			list.add("%" + s.getPsCard() + "%");
		}
		if(s.getPsUserId()!=null&&!"".equals(s.getPsUserId())){
			sb.append(" and psUserId = ? ");
			list.add( s.getPsUserId());
		}
		if(s.getPsWage()!=null&&!"".equals(s.getPsWage())){
			sb.append(" and psWage like ? ");
			list.add("%" + s.getPsWage() + "%");
		}
		
		if(s.getPsSocial()!=null&&!"".equals(s.getPsSocial())){
			sb.append(" and psSocial like ? ");
			list.add("%" + s.getPsSocial() + "%");
		}
		
		if(s.getPsEdu()!=null&&!"".equals(s.getPsEdu())){
			sb.append(" and psEdu like ? ");
			list.add("%" + s.getPsEdu() + "%");
		}
		if(s.getPsSpecialty()!=null&&!"".equals(s.getPsSpecialty())){
			sb.append(" and psSpecialty like ? ");
			list.add("%" + s.getPsSpecialty() + "%");
		}
		
		if(s.getPsSchool()!=null&&!"".equals(s.getPsSchool())){
			sb.append(" and psSchool like ? ");
			list.add("%" + s.getPsSchool() + "%");
		}
		
		
		
		if(s.getPsType()!=null&&!"".equals(s.getPsType())){
			sb.append(" and psType like ? ");
			list.add("%" + s.getPsType() + "%");
		}
		if(s.getPsPost()!=null&&!"".equals(s.getPsPost())){
			sb.append(" and psPost like ? ");
			list.add("%" + s.getPsPost() + "%");
		}
		
		
		
		if (StringUtils.isNotBlank(param.getOrderField())) {

			sb.append(" order by " + param.getOrderField() + " "
					+ param.getOrderDirection());

		}else{
		param.setOrderDirection("desc");
		sb.append(" order by psEntryDate desc");
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}
	@Override
	public List selectRes(FormParam param, Staff s,Date staDate,Date endDate) {
		StringBuffer sb = new StringBuffer("from Staff  where psStatus='离职' ");
		List list = new ArrayList();
		//条件查询的 还没写
		if(s.getPsName()!=null&&!"".equals(s.getPsName())){
			sb.append(" and psName like ? ");
			list.add("%" + s.getPsName() + "%");
		}
		if(s.getPsHomeTown()!=null&&!"".equals(s.getPsHomeTown())){
			sb.append(" and psHomeTown like ? ");
			list.add("%" + s.getPsHomeTown() + "%");
		}
		if(s.getPsSex()!=null&&!"".equals(s.getPsSex())){
			sb.append(" and psSex = ? ");
			list.add( s.getPsSex());
		}
		if(staDate!=null&&!"".equals(staDate)){
			sb.append(" and psResDate >= ? ");
			list.add( staDate);
		}
		if(endDate!=null&&!"".equals(endDate)){
			sb.append(" and psResDate <= ? ");
			list.add( endDate);
		}
		
		if(s.getPsAge()!=null&&s.getPsAge()!=0){
			sb.append(" and psAge = ? ");
			list.add( s.getPsAge());
		}
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		if(s.getPsPhone()!=null&&!"".equals(s.getPsPhone())){
			sb.append(" and psPhone like ? ");
			list.add("%" + s.getPsPhone() + "%");
		}
		
		if(s.getPsOther()!=null&&!"".equals(s.getPsOther())){
			sb.append(" and psOther like ? ");
			list.add("%" + s.getPsOther() + "%");
		}
		if(s.getPsAccountAddress()!=null&&!"".equals(s.getPsAccountAddress())){
			sb.append(" and psAccountAddress like ? ");
			list.add("%" + s.getPsAccountAddress() + "%");
		}
		
		if(s.getPsEthnic()!=null&&!"".equals(s.getPsEthnic())){
			sb.append(" and psEthnic like ? ");
			list.add("%" + s.getPsEthnic() + "%");
		}
		
		if(s.getPsCard()!=null&&!"".equals(s.getPsCard())){
			sb.append(" and psCard like ? ");
			list.add("%" + s.getPsCard() + "%");
		}
		if(s.getPsUserId()!=null&&!"".equals(s.getPsUserId())){
			sb.append(" and psUserId = ? ");
			list.add( s.getPsUserId());
		}
		if(s.getPsWage()!=null&&!"".equals(s.getPsWage())){
			sb.append(" and psWage like ? ");
			list.add("%" + s.getPsWage() + "%");
		}
		
		if(s.getPsSocial()!=null&&!"".equals(s.getPsSocial())){
			sb.append(" and psSocial like ? ");
			list.add("%" + s.getPsSocial() + "%");
		}
		
		if(s.getPsEdu()!=null&&!"".equals(s.getPsEdu())){
			sb.append(" and psEdu like ? ");
			list.add("%" + s.getPsEdu() + "%");
		}
		if(s.getPsSpecialty()!=null&&!"".equals(s.getPsSpecialty())){
			sb.append(" and psSpecialty like ? ");
			list.add("%" + s.getPsSpecialty() + "%");
		}
		
		if(s.getPsSchool()!=null&&!"".equals(s.getPsSchool())){
			sb.append(" and psSchool like ? ");
			list.add("%" + s.getPsSchool() + "%");
		}
		
	
		if(s.getPsType()!=null&&!"".equals(s.getPsType())){
			sb.append(" and psType like ? ");
			list.add("%" + s.getPsType() + "%");
		}
		if(s.getPsPost()!=null&&!"".equals(s.getPsPost())){
			sb.append(" and psPost like ? ");
			list.add("%" + s.getPsPost() + "%");
		}
		
		
		
		if (StringUtils.isNotBlank(param.getOrderField())) {

			sb.append(" order by " + param.getOrderField() + " "
					+ param.getOrderDirection());

		} else {
			param.setOrderDirection("desc");
			sb.append(" order by  psRetDate desc");
		}
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}
	@Override
	public List selectRet(FormParam param, Staff s,Date staDate,Date endDate) {
		StringBuffer sb = new StringBuffer("from Staff  where psStatus='退休' ");
		List list = new ArrayList();
		//条件查询的 还没写
		if(s.getPsName()!=null&&!"".equals(s.getPsName())){
			sb.append(" and psName like ? ");
			list.add("%" + s.getPsName() + "%");
		}
		if(s.getPsHomeTown()!=null&&!"".equals(s.getPsHomeTown())){
			sb.append(" and psHomeTown like ? ");
			list.add("%" + s.getPsHomeTown() + "%");
		}
		if(s.getPsSex()!=null&&!"".equals(s.getPsSex())){
			sb.append(" and psSex = ? ");
			list.add( s.getPsSex());
		}
		if(staDate!=null&&!"".equals(staDate)){
			sb.append(" and psRetDate >= ? ");
			list.add( staDate);
		}
		if(endDate!=null&&!"".equals(endDate)){
			sb.append(" and psRetDate <= ? ");
			list.add( endDate);
		}
		
		if(s.getPsAge()!=null&&s.getPsAge()!=0){
			sb.append(" and psAge = ? ");
			list.add( s.getPsAge());
		}
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		if(s.getPsPhone()!=null&&!"".equals(s.getPsPhone())){
			sb.append(" and psPhone like ? ");
			list.add("%" + s.getPsPhone() + "%");
		}
		
		if(s.getPsOther()!=null&&!"".equals(s.getPsOther())){
			sb.append(" and psOther like ? ");
			list.add("%" + s.getPsOther() + "%");
		}
		if(s.getPsAccountAddress()!=null&&!"".equals(s.getPsAccountAddress())){
			sb.append(" and psAccountAddress like ? ");
			list.add("%" + s.getPsAccountAddress() + "%");
		}
		
		if(s.getPsEthnic()!=null&&!"".equals(s.getPsEthnic())){
			sb.append(" and psEthnic like ? ");
			list.add("%" + s.getPsEthnic() + "%");
		}
		
		if(s.getPsCard()!=null&&!"".equals(s.getPsCard())){
			sb.append(" and psCard like ? ");
			list.add("%" + s.getPsCard() + "%");
		}
		if(s.getPsUserId()!=null&&!"".equals(s.getPsUserId())){
			sb.append(" and psUserId = ? ");
			list.add( s.getPsUserId());
		}
		if(s.getPsWage()!=null&&!"".equals(s.getPsWage())){
			sb.append(" and psWage like ? ");
			list.add("%" + s.getPsWage() + "%");
		}
		
		if(s.getPsSocial()!=null&&!"".equals(s.getPsSocial())){
			sb.append(" and psSocial like ? ");
			list.add("%" + s.getPsSocial() + "%");
		}
		
		if(s.getPsEdu()!=null&&!"".equals(s.getPsEdu())){
			sb.append(" and psEdu like ? ");
			list.add("%" + s.getPsEdu() + "%");
		}
		if(s.getPsSpecialty()!=null&&!"".equals(s.getPsSpecialty())){
			sb.append(" and psSpecialty like ? ");
			list.add("%" + s.getPsSpecialty() + "%");
		}
		
		if(s.getPsSchool()!=null&&!"".equals(s.getPsSchool())){
			sb.append(" and psSchool like ? ");
			list.add("%" + s.getPsSchool() + "%");
		}
		
	
		
		if(s.getPsType()!=null&&!"".equals(s.getPsType())){
			sb.append(" and psType like ? ");
			list.add("%" + s.getPsType() + "%");
		}
		if(s.getPsPost()!=null&&!"".equals(s.getPsPost())){
			sb.append(" and psPost like ? ");
			list.add("%" + s.getPsPost() + "%");
		}
		
		
		
		if (StringUtils.isNotBlank(param.getOrderField())) {

			sb.append(" order by " + param.getOrderField() + " "
					+ param.getOrderDirection());

		} else {
			param.setOrderDirection("desc");
			sb.append(" order by  psRetDate desc");
		}
	
		
		return dao.findPage(sb.toString(), param.getPageNum(),
				param.getNumPerPage(), list);
	}

	@Override
	public Long selectStaffCount(Staff s,Date staDate,Date endDate) {
		StringBuffer sb = new StringBuffer(" select count(*) from Staff  where psStatus='在职' ");
		List list = new ArrayList();
		//条件查询的 还没写
		if(s.getPsName()!=null&&!"".equals(s.getPsName())){
			sb.append(" and psName like ? ");
			list.add("%" + s.getPsName() + "%");
		}
		if(s.getPsHomeTown()!=null&&!"".equals(s.getPsHomeTown())){
			sb.append(" and psHomeTown like ? ");
			list.add("%" + s.getPsHomeTown() + "%");
		}
		if(s.getPsSex()!=null&&!"".equals(s.getPsSex())){
			sb.append(" and psSex = ? ");
			list.add( s.getPsSex());
		}
		if(staDate!=null&&!"".equals(staDate)){
			sb.append(" and psEntryDate >= ? ");
			list.add( staDate);
		}
		if(endDate!=null&&!"".equals(endDate)){
			sb.append(" and psEntryDate <= ? ");
			list.add( endDate);
		}
		
		if(s.getPsAge()!=null&&s.getPsAge()!=0){
			sb.append(" and psAge = ? ");
			list.add( s.getPsAge());
		}
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		if(s.getPsPhone()!=null&&!"".equals(s.getPsPhone())){
			sb.append(" and psPhone like ? ");
			list.add("%" + s.getPsPhone() + "%");
		}
		
		if(s.getPsOther()!=null&&!"".equals(s.getPsOther())){
			sb.append(" and psOther like ? ");
			list.add("%" + s.getPsOther() + "%");
		}
		if(s.getPsAccountAddress()!=null&&!"".equals(s.getPsAccountAddress())){
			sb.append(" and psAccountAddress like ? ");
			list.add("%" + s.getPsAccountAddress() + "%");
		}
		
		if(s.getPsEthnic()!=null&&!"".equals(s.getPsEthnic())){
			sb.append(" and psEthnic like ? ");
			list.add("%" + s.getPsEthnic() + "%");
		}
		
		if(s.getPsCard()!=null&&!"".equals(s.getPsCard())){
			sb.append(" and psCard like ? ");
			list.add("%" + s.getPsCard() + "%");
		}
		if(s.getPsUserId()!=null&&!"".equals(s.getPsUserId())){
			sb.append(" and psUserId = ? ");
			list.add( s.getPsUserId());
		}
		if(s.getPsWage()!=null&&!"".equals(s.getPsWage())){
			sb.append(" and psWage like ? ");
			list.add("%" + s.getPsWage() + "%");
		}
		
		if(s.getPsSocial()!=null&&!"".equals(s.getPsSocial())){
			sb.append(" and psSocial like ? ");
			list.add("%" + s.getPsSocial() + "%");
		}
		
		if(s.getPsEdu()!=null&&!"".equals(s.getPsEdu())){
			sb.append(" and psEdu like ? ");
			list.add("%" + s.getPsEdu() + "%");
		}
		if(s.getPsSpecialty()!=null&&!"".equals(s.getPsSpecialty())){
			sb.append(" and psSpecialty like ? ");
			list.add("%" + s.getPsSpecialty() + "%");
		}
		
		if(s.getPsSchool()!=null&&!"".equals(s.getPsSchool())){
			sb.append(" and psSchool like ? ");
			list.add("%" + s.getPsSchool() + "%");
		}
		
		if(s.getPsStatus()!=null&&!"".equals(s.getPsStatus())){
			sb.append(" and psStatus = ? ");
			list.add(s.getPsStatus() );
		}
		
		if(s.getPsType()!=null&&!"".equals(s.getPsType())){
			sb.append(" and psType like ? ");
			list.add("%" + s.getPsType() + "%");
		}
		if(s.getPsPost()!=null&&!"".equals(s.getPsPost())){
			sb.append(" and psPost like ? ");
			list.add("%" + s.getPsPost() + "%");
		}
		
		
		
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}
	@Override
	public Long selectResCount( Staff s,Date staDate,Date endDate) {
		StringBuffer sb = new StringBuffer("select count(*) from Staff  where psStatus='离职' ");
		List list = new ArrayList();
		//条件查询的 还没写
		if(s.getPsName()!=null&&!"".equals(s.getPsName())){
			sb.append(" and psName like ? ");
			list.add("%" + s.getPsName() + "%");
		}
		if(s.getPsHomeTown()!=null&&!"".equals(s.getPsHomeTown())){
			sb.append(" and psHomeTown like ? ");
			list.add("%" + s.getPsHomeTown() + "%");
		}
		if(s.getPsSex()!=null&&!"".equals(s.getPsSex())){
			sb.append(" and psSex = ? ");
			list.add( s.getPsSex());
		}
		if(staDate!=null&&!"".equals(staDate)){
			sb.append(" and psResDate >= ? ");
			list.add( s.getStaDate());
		}
		if(endDate!=null&&!"".equals(endDate)){
			sb.append(" and psResDate <= ? ");
			list.add( endDate);
		}
		
		if(s.getPsAge()!=null&&s.getPsAge()!=0){
			sb.append(" and psAge = ? ");
			list.add( s.getPsAge());
		}
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		if(s.getPsPhone()!=null&&!"".equals(s.getPsPhone())){
			sb.append(" and psPhone like ? ");
			list.add("%" + s.getPsPhone() + "%");
		}
		
		if(s.getPsOther()!=null&&!"".equals(s.getPsOther())){
			sb.append(" and psOther like ? ");
			list.add("%" + s.getPsOther() + "%");
		}
		if(s.getPsAccountAddress()!=null&&!"".equals(s.getPsAccountAddress())){
			sb.append(" and psAccountAddress like ? ");
			list.add("%" + s.getPsAccountAddress() + "%");
		}
		
		if(s.getPsEthnic()!=null&&!"".equals(s.getPsEthnic())){
			sb.append(" and psEthnic like ? ");
			list.add("%" + s.getPsEthnic() + "%");
		}
		
		if(s.getPsCard()!=null&&!"".equals(s.getPsCard())){
			sb.append(" and psCard like ? ");
			list.add("%" + s.getPsCard() + "%");
		}
		if(s.getPsUserId()!=null&&!"".equals(s.getPsUserId())){
			sb.append(" and psUserId = ? ");
			list.add( s.getPsUserId());
		}
		if(s.getPsWage()!=null&&!"".equals(s.getPsWage())){
			sb.append(" and psWage like ? ");
			list.add("%" + s.getPsWage() + "%");
		}
		
		if(s.getPsSocial()!=null&&!"".equals(s.getPsSocial())){
			sb.append(" and psSocial like ? ");
			list.add("%" + s.getPsSocial() + "%");
		}
		
		if(s.getPsEdu()!=null&&!"".equals(s.getPsEdu())){
			sb.append(" and psEdu like ? ");
			list.add("%" + s.getPsEdu() + "%");
		}
		if(s.getPsSpecialty()!=null&&!"".equals(s.getPsSpecialty())){
			sb.append(" and psSpecialty like ? ");
			list.add("%" + s.getPsSpecialty() + "%");
		}
		
		if(s.getPsSchool()!=null&&!"".equals(s.getPsSchool())){
			sb.append(" and psSchool like ? ");
			list.add("%" + s.getPsSchool() + "%");
		}
		
		if(s.getPsStatus()!=null&&!"".equals(s.getPsStatus())){
			sb.append(" and psStatus = ? ");
			list.add( s.getPsStatus() );
		}
		
		if(s.getPsType()!=null&&!"".equals(s.getPsType())){
			sb.append(" and psType like ? ");
			list.add("%" + s.getPsType() + "%");
		}
		if(s.getPsPost()!=null&&!"".equals(s.getPsPost())){
			sb.append(" and psPost like ? ");
			list.add("%" + s.getPsPost() + "%");
		}
		
		
		
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}
	@Override
	public Long selectRetCount(Staff s,Date staDate,Date endDate) {
		StringBuffer sb = new StringBuffer("select count(*) from Staff  where psStatus='退休' ");
		List list = new ArrayList();
		//条件查询的 还没写
		if(s.getPsName()!=null&&!"".equals(s.getPsName())){
			sb.append(" and psName like ? ");
			list.add("%" + s.getPsName() + "%");
		}
		if(s.getPsHomeTown()!=null&&!"".equals(s.getPsHomeTown())){
			sb.append(" and psHomeTown like ? ");
			list.add("%" + s.getPsHomeTown() + "%");
		}
		if(s.getPsSex()!=null&&!"".equals(s.getPsSex())){
			sb.append(" and psSex = ? ");
			list.add( s.getPsSex());
		}
		if(staDate!=null&&!"".equals(staDate)){
			sb.append(" and psRetDate >= ? ");
			list.add( staDate);
		}
		if(endDate!=null&&!"".equals(endDate)){
			sb.append(" and psRetDate <= ? ");
			list.add( endDate);
		}
		
		if(s.getPsAge()!=null&&s.getPsAge()!=0){
			sb.append(" and psAge = ? ");
			list.add( s.getPsAge());
		}
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		
		if(s.getPsPresentAddress()!=null&&!"".equals(s.getPsPresentAddress())){
			sb.append(" and psPresentAddress like ? ");
			list.add("%" + s.getPsPresentAddress() + "%");
		}
		
		if(s.getPsHomePhone()!=null&&!"".equals(s.getPsHomePhone())){
			sb.append(" and psHomePhone like ? ");
			list.add("%" + s.getPsHomePhone() + "%");
		}
		if(s.getPsPhone()!=null&&!"".equals(s.getPsPhone())){
			sb.append(" and psPhone like ? ");
			list.add("%" + s.getPsPhone() + "%");
		}
		
		if(s.getPsOther()!=null&&!"".equals(s.getPsOther())){
			sb.append(" and psOther like ? ");
			list.add("%" + s.getPsOther() + "%");
		}
		if(s.getPsAccountAddress()!=null&&!"".equals(s.getPsAccountAddress())){
			sb.append(" and psAccountAddress like ? ");
			list.add("%" + s.getPsAccountAddress() + "%");
		}
		
		if(s.getPsEthnic()!=null&&!"".equals(s.getPsEthnic())){
			sb.append(" and psEthnic like ? ");
			list.add("%" + s.getPsEthnic() + "%");
		}
		
		if(s.getPsCard()!=null&&!"".equals(s.getPsCard())){
			sb.append(" and psCard like ? ");
			list.add("%" + s.getPsCard() + "%");
		}
		if(s.getPsUserId()!=null&&!"".equals(s.getPsUserId())){
			sb.append(" and psUserId = ? ");
			list.add( s.getPsUserId());
		}
		if(s.getPsWage()!=null&&!"".equals(s.getPsWage())){
			sb.append(" and psWage like ? ");
			list.add("%" + s.getPsWage() + "%");
		}
		
		if(s.getPsSocial()!=null&&!"".equals(s.getPsSocial())){
			sb.append(" and psSocial like ? ");
			list.add("%" + s.getPsSocial() + "%");
		}
		
		if(s.getPsEdu()!=null&&!"".equals(s.getPsEdu())){
			sb.append(" and psEdu like ? ");
			list.add("%" + s.getPsEdu() + "%");
		}
		if(s.getPsSpecialty()!=null&&!"".equals(s.getPsSpecialty())){
			sb.append(" and psSpecialty like ? ");
			list.add("%" + s.getPsSpecialty() + "%");
		}
		
		if(s.getPsSchool()!=null&&!"".equals(s.getPsSchool())){
			sb.append(" and psSchool like ? ");
			list.add("%" + s.getPsSchool() + "%");
		}
		
		if(s.getPsStatus()!=null&&!"".equals(s.getPsStatus())){
			sb.append(" and psStatus = ? ");
			list.add( s.getPsStatus() );
		}
		
		if(s.getPsType()!=null&&!"".equals(s.getPsType())){
			sb.append(" and psType like ? ");
			list.add("%" + s.getPsType() + "%");
		}
		if(s.getPsPost()!=null&&!"".equals(s.getPsPost())){
			sb.append(" and psPost like ? ");
			list.add("%" + s.getPsPost() + "%");
		}
		
		
		
		return (Long) dao.findUniqueOne(sb.toString(), list);
	}
	
	
	@Override
	public String addStaff(Staff s) {
		Object obj=dao.findOne("from Staff  where psName=? and psCard=?",s.getPsName(),s.getPsCard());
		if(obj==null){
			if (dao.save(s)) {
				return MsgConfig.MSG_KEY_SUCCESS;
			} else {
				return MsgConfig.MSG_KEY_FAIL;
			}
		}else{
			return "msg.personnel.value";//数据库已有值
		}
	}

	@Override
	public Map updatePage(String id) {
		Staff staff=(Staff) dao.findOne("from Staff where id=?",id);
		String roleid=staff.getPsUserId();
//		SyUsers role=null;
//			role=(SyUsers) dao.findOne("from SyUsers where id=?",roleid);
		
		Map map=new HashMap();
		map.put("ps",staff);
//		map.put("userName", role.getUserName());
		return map;
	}

	@Override
	public String update(Staff s) {
		if (dao.update(s)) {
			return MsgConfig.MSG_KEY_SUCCESS;
		} else {
			return MsgConfig.MSG_KEY_FAIL;
		}
	}
	
	@Override
	public boolean deleteStaff(String[] ids) {
		for (String id : ids) {
			Staff s = dao.get(Staff.class, id);
			dao.delete(s);
		}
		
		return true;
	}
	@Override
	public String updateStatus(Staff s) {
		
		Staff sta=dao.get(Staff.class, s.getId());
		
		if(sta!=null){
			sta.setPsStatus(s.getPsStatus());
			sta.setPsResReason(s.getPsResReason());
			sta.setPsResDate(s.getPsResDate());
			sta.setPsResRemark(s.getPsResRemark());
			sta.setPsRetReason(s.getPsRetReason());
			sta.setPsRetDate(s.getPsRetDate());
			sta.setPsRetRemark(s.getPsRetRemark());
			
			
			return MsgConfig.MSG_KEY_SUCCESS;
			
		}else{
			return MsgConfig.MSG_KEY_NODATA;
		}
	}
}
