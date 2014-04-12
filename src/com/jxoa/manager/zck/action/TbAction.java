/**  
 * @Project: jxoa
 * @Title: NewsAction.java
 * @Package com.jxoa.manager.common_platform.action
 * @date 2013-5-19 上午10:25:25
 * @Copyright: 2013 
 */
package com.jxoa.manager.zck.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.sqlserverUtil;
import com.jxoa.manager.fj.bean.Dwzp;
import com.jxoa.manager.fj.bean.Grqz;
import com.jxoa.manager.fj.bean.Rkjs;
import com.jxoa.manager.fj.service.DwzpService;
import com.jxoa.manager.fj.service.FamilyplanService;
import com.jxoa.manager.fj.service.GrqzService;
import com.jxoa.manager.qxh.bean.Jyyz;
import com.jxoa.manager.qxh.bean.Ldjc;
import com.jxoa.manager.qxh.bean.Rkjb;
import com.jxoa.manager.qxh.bean.Txry;
import com.jxoa.manager.qxh.bean.Xedkffqk;
import com.jxoa.manager.qxh.service.IJyyzService;
import com.jxoa.manager.qxh.service.ILdjcService;
import com.jxoa.manager.qxh.service.IPersonService;
import com.jxoa.manager.qxh.service.ITxryService;
import com.jxoa.manager.qxh.service.IXedkffqkService;
import com.jxoa.manager.zck.bean.Jncypx;
import com.jxoa.manager.zck.bean.Shyl;
import com.jxoa.manager.zck.bean.Syrygl;
import com.jxoa.manager.zck.service.JncypxService;
import com.jxoa.manager.zck.service.PensionService;
import com.jxoa.manager.zck.service.SyryglService;

/**
 * 
 * 类名：SyryglAction
 * 功能：同步人员管理
 * 详细：
 * 版本：1.0
 *
 */
@Controller
@RequestMapping("tb")
public class TbAction extends BaseAction{
	@Autowired
	private SyryglService syryglService;
	@Autowired
	private PensionService service; 
	@Autowired
	private JncypxService jncypxService;
	@Autowired
	private IXedkffqkService iXedkffqkService;
	@Autowired
	private IJyyzService iJyyzService;
	@Autowired
	private GrqzService grqzService; 
	@Autowired
	private DwzpService dwzpService; 
	@Autowired
	private ILdjcService iLdjcService;
	@Autowired
	private ITxryService iTxryService;
	@Autowired
	private FamilyplanService familyplanService; 
	@Autowired
	private IPersonService iPersonService;
	
	
	/**
	 * 同步人员管理
	 * @param param
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("tbrygl")
	public ModelAndView tbrygl(FormParam param,Rkjs rkjs, ModelMap Map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Map ma = new HashMap();
		boolean stau = false;
		List list  = sqlserverUtil.excuteQuery(" select * from rkjb ","");
		if(list!=null && list.size()>0){
			//先将数据库表清空
			boolean statu = iPersonService.delRKJBAll();
			if(statu){
				for(int i=0;i<list.size();i++){
					ma = (HashMap)list.get(i);
					Rkjb jb = getRkjb(ma);
					try {
						iPersonService.save(jb);
						stau = true;
					} catch (Exception e) {
						e.printStackTrace();
						flag=2;
						stau=false;
					}
				}
			}else{
				flag = 1;
			}
		}
		return ajaxDone(stau);
	}
	/**
	 * 同步计生管理
	 * @param param
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("tbjsgl")
	public String tbjsgl(FormParam param,Rkjs rkjs, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Rkjs gl = new Rkjs();
		List list = familyplanService.selectShow(param, new Rkjs());
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				gl = (Rkjs)list.get(i);
				List sylist  = sqlserverUtil.excuteQuery(" select * from rkjs where RKJBGUID ='"+(gl.getRkjbguid())+"'","");
				if(sylist!=null && sylist.size()>0){
					StringBuffer sql = new StringBuffer("update rkjs set RKJBGUID='"+(gl.getRkjbguid()==null?"":(gl.getRkjbguid()))+"',FNBH='"+(gl.getFnbh()==null?"":(gl.getFnbh()))+"',SFZGYLFN='"+(gl.getSfzgylfn()==null?"":(gl.getSfzgylfn().toString()))+"',SFXHHY='"+(gl.getSfxhhy()==null?"":(gl.getSfxhhy().toString()))+"' ,SFXHZYZ='"+(gl.getSfxhzyz()==null?"":(gl.getSfxhzyz().toString()))+"', ");
					sql.append(" LRLC='"+gl.getLrlc()+"',HCLR='"+gl.getHclr()+"',HSLR='"+gl.getHslr()+"',HCLC='"+gl.getHclc()+"',HSLC='"+gl.getHslc()+"',QRQC='"+gl.getQrqc()+"',HCQR='"+gl.getHcqr()+"',HSQR='"+gl.getHsqr()+"',HCQC='"+gl.getHcqc()+"',HSQC='"+gl.getHsqc()+"' ");
					sql.append(" where RKJBGUID = '"+(gl.getRkjbguid())+"' ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}else{
					StringBuffer sql = new StringBuffer("insert into rkjs(RKJSGUID,RKJBGUID,FNBH,SFZGYLFN,SFXHHY,SFXHZYZ,LRLC,HCLR,HSLR,HCLC,HSLC,QRQC,HCQR,HSQR,HCQC,HSQC)values( ");
					sql.append(" '"+gl.getRkjsguid()+"','"+gl.getRkjbguid()+"','"+gl.getFnbh()+"','"+gl.getSfzgylfn()+"','"+gl.getSfxhhy()+"','"+gl.getSfxhzyz()+"','"+gl.getLrlc()+"','"+gl.getHclr()+"','"+gl.getHslr()+"','"+gl.getHclc()+"', ");
					sql.append(" '"+gl.getHslc()+"','"+gl.getQrqc()+"','"+gl.getHcqr()+"','"+gl.getHsqr()+"','"+gl.getHcqc()+"','"+gl.getHsqc()+"') ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);
		return null;
	}
	
	/**
	 * 同步养老保险
	 * @param param
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("tbylgl")
	public String tbylgl(FormParam param,Shyl txry, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Shyl gl = new Shyl();
		List list = service.selectPension(param, new Shyl());
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				gl = (Shyl)list.get(i);
				List sylist  = sqlserverUtil.excuteQuery(" select * from shyl where RKJBGUID ='"+(gl.getRkjbguid()==null?"":gl.getRkjbguid())+"'","");
				if(sylist!=null && sylist.size()>0){
					StringBuffer sql = new StringBuffer("update shyl set RKJBGUID='"+(gl.getRkjbguid()==null?"":(gl.getRkjbguid().toString()))+"',STZK='"+(gl.getStzk()==null?"":gl.getStzk().toString())+"',HLLX='"+(gl.getHllx()==null?"":gl.getHllx().toString())+"',SFDB='"+(gl.getSfdb()==null?"":gl.getSfdb().toString())+"' ,SFPK='"+(gl.getSfpk()==null?"":gl.getSfpk().toString())+"', ");
					sql.append(" SFKC='"+(gl.getSfkc()==null?"":gl.getSfkc().toString())+"',JGYL='"+(gl.getJgyl()==null?"":gl.getJgyl().toString())+"',RTYL='"+gl.getRtyl()+"',SMFW='"+gl.getSmfw()+"',LNFZ='"+gl.getSmfw()+"',YJT='"+gl.getYjt()+"',SHYLBZ='"+gl.getShylbz()+"' ");
					sql.append(" where RKJBGUID = '"+(gl.getRkjbguid())+"' ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}else{
					StringBuffer sql = new StringBuffer("insert into shyl(SHYLGUID,RKJBGUID,STZK,HLLX,SFDB,SFPK,SFKC,JGYL,RTYL,SMFW,LNFZ,YJT,SHYLBZ)values( ");
					sql.append(" '"+gl.getShylguid()+"','"+gl.getRkjbguid()+"','"+gl.getStzk()+"','"+gl.getHllx()+"','"+gl.getSfdb()+"','"+gl.getSfpk()+"','"+gl.getSfkc()+"','"+gl.getJgyl()+"', ");
					sql.append(" '"+gl.getRtyl()+"','"+gl.getSmfw()+"','"+gl.getLnfz()+"','"+gl.getYjt()+"','"+gl.getShylbz()+"') ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);
		return null;
	}
	
	/**
	 * 同步退休人员
	 * @param param
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("tbtxry")
	public String tbtxry(FormParam param,Txry txry, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Map ma = new HashMap();
		List list = iTxryService.txryList(new Txry(), param);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				ma = (HashMap)list.get(i);
				List sylist  = sqlserverUtil.excuteQuery(" select * from txry where RKJBGUID ='"+(((Txry)ma.get("ty")).getRkjbguid()==null?"":((Txry)ma.get("ty")).getRkjbguid())+"'","");
				if(sylist!=null && sylist.size()>0){
					StringBuffer sql = new StringBuffer("update txry set RKJBGUID='"+(((Txry)ma.get("ty")).getRkjbguid()==null?"":((Txry)ma.get("ty")).getRkjbguid().toString())+"',TXSJ='"+(((Txry)ma.get("ty")).getTxsj()==null?"":((Txry)ma.get("ty")).getTxsj().toString())+"',TXQDW='"+(((Txry)ma.get("ty")).getTxqdw()==null?"":((Txry)ma.get("ty")).getTxqdw().toString())+"',DWDH='"+(((Txry)ma.get("ty")).getDwdh()==null?"":((Txry)ma.get("ty")).getDwdh().toString())+"' ,JTDH='"+(((Txry)ma.get("ty")).getJtdh()==null?"":((Txry)ma.get("ty")).getJtdh().toString())+"', ");
					sql.append(" qsr='"+(((Txry)ma.get("ty")).getQsr()==null?"":((Txry)ma.get("ty")).getQsr().toString())+"',txrybz='"+(((Txry)ma.get("ty")).getTxrybz()==null?"":((Txry)ma.get("ty")).getTxrybz().toString())+"' ");
					sql.append(" where RKJBGUID = '"+((Txry)ma.get("ty")).getRkjbguid()+"' ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}else{
					StringBuffer sql = new StringBuffer("insert into txry(TXRYGUID,RKJBGUID,TXSJ,TXQDW,DWDH,JTDH,QSR,TXRYBZ)values( ");
					sql.append(" '"+((Txry)ma.get("ty")).getTxryguid()+"','"+((Txry)ma.get("ty")).getRkjbguid()+"','"+((Txry)ma.get("ty")).getTxsj()+"','"+((Txry)ma.get("ty")).getTxqdw()+"','"+((Txry)ma.get("ty")).getDwdh()+"','"+((Txry)ma.get("ty")).getJtdh()+"','"+((Txry)ma.get("ty")).getQsr()+"','"+((Txry)ma.get("ty")).getTxrybz()+"') ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);
		return null;
	}
	
	/**
	 * 同步劳动监察
	 * @param param
	 * @param ng
	 * @param map
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("tbldjc")
	public String tbldjc(FormParam param,Ldjc ldjc, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Ldjc gl = new Ldjc();
		List list = iLdjcService.ldjcList(param, ldjc);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				gl = (Ldjc)list.get(i);
				List sylist  = sqlserverUtil.excuteQuery(" select * from ldjc where LDJCGUID ='"+(gl.getLdjcguid()==null?"":gl.getLdjcguid().toString())+"'","");
				if(sylist!=null && sylist.size()>0){
					StringBuffer sql = new StringBuffer(" update ldjc set DWMC='"+gl.getDwmc()+"',DWDZ='"+gl.getDwdz()+"',LXR='"+gl.getLxr()+"',LXRDH='"+gl.getLxrdh()+"',JCR='"+gl.getJcr()+"',SSSQ='"+gl.getSssq()+"',SFHG='"+gl.getSfhg()+"',LDJCBZ='"+gl.getLdjcbz()+"' ");
					sql.append(" where  LDJCGUID='"+gl.getLdjcguid()+"' ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}else{
					StringBuffer sql = new StringBuffer("insert into ldjc(LDJCGUID,DWMC,DWDZ,LXR,LXRDH,JCR,SSSQ,SFHG,LDJCBZ)values( ");
					sql.append(" '"+gl.getLdjcguid()+"','"+gl.getDwmc()+"','"+gl.getDwdz()+"','"+gl.getLxr()+"','"+gl.getLxrdh()+"','"+gl.getJcr()+"','"+gl.getSssq()+"','"+gl.getSfhg()+"','"+gl.getLdjcbz()+"') ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);
		return null;
	}
	
	/**
	 * 同步单位招聘
	 * @param param
	 * @param ng
	 * @param map
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("tbdwzp")
	public String tbdwzp(FormParam param,Dwzp grqz, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Dwzp gl = new Dwzp();
		List list = dwzpService.selectdwmc(param, new Dwzp());
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				gl = (Dwzp)list.get(i);
				List sylist  = sqlserverUtil.excuteQuery(" select * from dwzp where DWZPGUID ='"+(gl.getDwzpguid()==null?"":gl.getDwzpguid().toString())+"'","");
				if(sylist!=null && sylist.size()>0){
					StringBuffer sql = new StringBuffer(" update dwzp set DWMC='"+gl.getDwmc()+"',DWDZ='"+gl.getDwdz()+"',XQGW='"+gl.getXqgw()+"',XQRS='"+gl.getXqrs()+"',XZDY='"+gl.getXzdy()+"',XBYQ='"+gl.getXbyq()+"',LXR='"+gl.getLxr()+"',LXRDH='"+gl.getLxrdh()+"' ");
					sql.append(" where  DWZPGUID='"+gl.getDwzpguid()+"' ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}else{
					StringBuffer sql = new StringBuffer("insert into dwzp(DWZPGUID,DWMC,DWDZ,XQGW,XQRS,XZDY,XBYQ,LXR,LXRDH)values( ");
					sql.append(" '"+gl.getDwzpguid()+"','"+gl.getDwmc()+"','"+gl.getDwdz()+"','"+gl.getXqgw()+"','"+gl.getXqrs()+"','"+gl.getXzdy()+"','"+gl.getXbyq()+"','"+gl.getLxr()+"','"+gl.getLxrdh()+"') ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);
		return null;
	}
	/**
	 * 同步工人求职
	 * @param param
	 * @param ng
	 * @param map
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("tbjgrqz")
	public String tbjgrqz(FormParam param,Grqz grqz, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Map ma = new HashMap();
		List list = grqzService.selectgrqz(param, new Grqz());
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				ma = (HashMap)list.get(i);
				System.out.println(((Rkjb)ma.get("rk")).getRkjbguid());
				List sylist  = sqlserverUtil.excuteQuery(" select * from Grqz where RKJBGUID ='"+(((Rkjb)ma.get("rk")).getRkjbguid()==null?"":((Rkjb)ma.get("rk")).getRkjbguid())+"'","");
				if(sylist!=null && sylist.size()>0){
					StringBuffer sql = new StringBuffer("update Grqz set RKJBGUID='"+(((Rkjb)ma.get("rk")).getRkjbguid()==null?"":((Rkjb)ma.get("rk")).getRkjbguid().toString())+"',DJSJ='"+(ma.get("djsjs")==null?"":ma.get("djsjs").toString())+"',QZCS='"+(ma.get("qzcss")==null?"":ma.get("qzcss").toString())+"',QZGW='"+(ma.get("qzgws")==null?"":ma.get("qzgws").toString())+"' ,XJDY='"+(ma.get("xjdys")==null?"":ma.get("xjdys").toString())+"' ");
					sql.append(" where RKJBGUID = '"+((Rkjb)ma.get("rk")).getRkjbguid().toString()+"' ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}else{
					StringBuffer sql = new StringBuffer("insert into Grqz(GRQZGUID,RKJBGUID,DJSJ,QZCS,QZGW,XJDY)values( ");
					sql.append(" '"+ma.get("grqzguids")+"','"+((Rkjb)ma.get("rk")).getRkjbguid()+"','"+ma.get("djsjs")+"','"+ma.get("qzcss")+"','"+ma.get("qzgws")+"','"+ma.get("xjdys")+"') ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);
		return null;
	}
	
	/**
	 * 同步就业援助
	 * @param param
	 * @param ng
	 * @param map
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("tbjyyz")
	public String tbjyyz(FormParam param,Jyyz jyyz, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Map ma = new HashMap();
		List list = iJyyzService.jyyzList(param, new Jyyz());
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				ma = (HashMap)list.get(i);
				System.out.println(((Jyyz)ma.get("jz")).getRkjbguid());
				List sylist  = sqlserverUtil.excuteQuery(" select * from jyyz where RKJBGUID ='"+(((Jyyz)ma.get("jz")).getRkjbguid()==null?"":((Jyyz)ma.get("jz")).getRkjbguid())+"'","");
				if(sylist!=null && sylist.size()>0){
					StringBuffer sql = new StringBuffer("update jyyz set RKJBGUID='"+((Jyyz)ma.get("jz")).getRkjbguid()+"',SBBT='"+((Jyyz)ma.get("jz")).getSbbt()+"',JYYZBZ='"+((Jyyz)ma.get("jz")).getJyyzbz()+"' ");
					sql.append(" where RKJBGUID = '"+((Jyyz)ma.get("jz")).getRkjbguid()+"' ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}else{
					StringBuffer sql = new StringBuffer("insert into jyyz(JYYZGUID,RKJBGUID,SBBT,JYYZBZ)values( ");
					sql.append(" '"+((Jyyz)ma.get("jz")).getJyyzguid()+"','"+((Jyyz)ma.get("jz")).getRkjbguid()+"','"+((Jyyz)ma.get("jz")).getSbbt()+"','"+((Jyyz)ma.get("jz")).getJyyzbz()+"') ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);
		return null;
	}
	/**
	 * 同步小额贷款发放情况
	 * @param param
	 * @param ng
	 * @param map
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("tbxedk")
	public String tbxedk(FormParam param,Xedkffqk xedkffqk, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Map ma = new HashMap();
		List list = iXedkffqkService.xedkffqkList(param, new Xedkffqk());
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				ma = (HashMap)list.get(i);
				System.out.println(((Xedkffqk)ma.get("xk")).getRkjbguid());
				List sylist  = sqlserverUtil.excuteQuery(" select * from xedkffqk where RKJBGUID ='"+(((Xedkffqk)ma.get("xk")).getRkjbguid()==null?"":((Xedkffqk)ma.get("xk")).getRkjbguid())+"'","");
				if(sylist!=null && sylist.size()>0){
					StringBuffer sql = new StringBuffer("update xedkffqk set RKJBGUID='"+((Xedkffqk)ma.get("xk")).getRkjbguid()+"',FFSJ='"+((Xedkffqk)ma.get("xk")).getFfsj()+"',DKJE='"+((Xedkffqk)ma.get("xk")).getDkje()+"',HKSJ='"+((Xedkffqk)ma.get("xk")).getHksj()+"',XYD='"+((Xedkffqk)ma.get("xk")).getXyd()+"',JYXM='"+((Xedkffqk)ma.get("xk")).getJyxm()+"' ");
					sql.append(" where RKJBGUID = '"+((Xedkffqk)ma.get("xk")).getRkjbguid()+"' ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}else{
					StringBuffer sql = new StringBuffer("insert into xedkffqk(XEDKFFQKGUID,RKJBGUID,FFSJ,DKJE,HKSJ,XYD,JYXM)values( ");
					sql.append(" '"+((Xedkffqk)ma.get("xk")).getXedkffqkguid()+"','"+((Xedkffqk)ma.get("xk")).getRkjbguid()+"','"+((Xedkffqk)ma.get("xk")).getFfsj()+"','"+((Xedkffqk)ma.get("xk")).getDkje()+"','"+((Xedkffqk)ma.get("xk")).getHksj()+"','"+((Xedkffqk)ma.get("xk")).getXyd()+"','"+((Xedkffqk)ma.get("xk")).getJyxm()+"') ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);
		return null;
	}
	/**
	 * 同步创业
	 * @param param
	 * @param ng
	 * @param map
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("tbcy")
	public String tbcy(FormParam param,Jncypx ng, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Jncypx gl = new Jncypx();
		List list = jncypxService.load(param,ng);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				gl = (Jncypx)list.get(i);
				List sylist  = sqlserverUtil.excuteQuery(" select * from jncypx where RKJBGUID ='"+(gl.getRkjbguid()==null?"":gl.getRkjbguid().toString())+"'","");
				if(sylist!=null && sylist.size()>0){
					StringBuffer sql = new StringBuffer("update jncypx set RKJBGUID='"+gl.getRkjbguid()+"',PXCS='"+gl.getPxcs()+"',PXSJ='"+gl.getPxsj()+"',PXLX='"+gl.getPxlx()+"',XMNR='"+gl.getXmnr()+"' ");
					sql.append(" where RKJBGUID = '"+gl.getRkjbguid()+"' ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}else{
					StringBuffer sql = new StringBuffer("insert into jncypx(JNCYPXGUID,RKJBGUID,PXCS,PXSJ,PXLX,XMNR)values( ");
					sql.append(" '"+gl.getJncypxguid()+"','"+gl.getRkjbguid()+"','"+gl.getPxcs()+"','"+gl.getPxsj()+"','"+gl.getPxlx()+"','"+gl.getXmnr()+"') ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);
		return null;
	}
	/**
	 *同步失业人员
	 * @return
	 * @throws UnsupportedEncodingException 
	 * 
	 */
	@RequestMapping("insertsy")
	public String load(FormParam param,Syrygl ng, ModelMap map,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		int flag=0;
		Syrygl gl = new Syrygl();
		List list = syryglService.load(param,new Syrygl());
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				gl = (Syrygl)list.get(i);
				//判断人员是否存在
				List sylist  = sqlserverUtil.excuteQuery(" select * from syrygl where RKJBGUID ='"+(gl.getRkjbguid()==null?"":gl.getRkjbguid().toString())+"'","");
				if(sylist!=null && sylist.size()>0){
					StringBuffer sql = new StringBuffer(" update syrygl set RKJBGUID='"+gl.getRkjbguid()+"',SYSJ='"+gl.getSysj()+"',SYQDW='"+gl.getSyqdw()+"',SYRYBZ='"+gl.getSyrybz()+"' ");
					sql.append(" where  RKJBGUID='"+gl.getRkjbguid()+"' ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}else{
					StringBuffer sql = new StringBuffer("insert into syrygl(SYRYGLGUID,RKJBGUID,SYSJ,SYQDW,SYRYBZ)values( ");
					sql.append(" '"+gl.getSyryglguid()+"','"+gl.getRkjbguid()+"','"+gl.getSysj()+"','"+gl.getSyqdw()+"','"+gl.getSyrybz()+"') ");
					flag = sqlserverUtil.zhixsql("", sql.toString());
				}
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print(flag);
		return null;
	}
	

	
	public  Rkjb getRkjb(Map ma){
		Rkjb jb = new Rkjb();
		jb.setCsrq(ma.get("CSRQ")==null?"":ma.get("CSRQ").toString());
		jb.setDyguid(ma.get("DYGUID")==null?"":ma.get("DYGUID").toString());
		jb.setFwguid(ma.get("FWGUID")==null?"":ma.get("FWGUID").toString());
		jb.setGzdw(ma.get("GZDW")==null?"":ma.get("GZDW").toString());
		jb.setHzguid(ma.get("HZGUID")==null?"":ma.get("HZGUID").toString());
		jb.setJg(ma.get("JG")==null?"":ma.get("JG").toString());
		jb.setJtzz(ma.get("JTZZ")==null?"":ma.get("JTZZ").toString());
		jb.setJzwguid(ma.get("JZWGUID")==null?"":ma.get("JZWGUID").toString());
		jb.setLxdh(ma.get("LXDH")==null?"":ma.get("LXDH").toString());
		jb.setMz(ma.get("MZ")==null?"":ma.get("MZ").toString());
		jb.setRkjbguid(ma.get("RKJBGUID")==null?"":ma.get("RKJBGUID").toString());
		jb.setSfzh(ma.get("SFZH")==null?"":ma.get("SFZH").toString());
		jb.setXb(ma.get("XB")==null?"":ma.get("XB").toString());
		jb.setXczfrq(ma.get("XCZFRG")==null?"":ma.get("XCZFRG").toString());
		jb.setXl(ma.get("XL")==null?"":ma.get("XL").toString());
		jb.setXm(ma.get("XM")==null?"":ma.get("XM").toString());
		jb.setXmpy(ma.get("XMPY")==null?"":ma.get("XMPY").toString());
		jb.setXzdwguid(ma.get("XZDWGUID")==null?"":ma.get("XZDWGUID").toString());
		jb.setYhzgx(ma.get("YHZGX")==null?"":ma.get("YHZGX").toString());
		jb.setZhzfrq(ma.get("ZHZFRQ")==null?"":ma.get("ZHZFRQ").toString());
		jb.setZp(ma.get("ZP")==null?"":ma.get("ZP").toString());
		jb.setZrpqguid(ma.get("ZRPQGUID")==null?"":ma.get("ZRPQGUID").toString());
		return jb;
	}
	
}
