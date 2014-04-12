/**  
 * @Project: jxoa
 * @Title: NewsAction.java
 * @Package com.jxoa.manager.common_platform.action
 * @date 2013-5-19 上午10:25:25
 * @Copyright: 2013 
 */
package com.jxoa.manager.zck.action;


import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.util.DateUtil;
import com.jxoa.commons.util.ExcelUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.commons.util.StringUtil;
import com.jxoa.commons.util.sqlserverUtil;
import com.jxoa.manager.common_platform.bean.Messagemanager;
import com.jxoa.manager.common_platform.bean.Newscomment;
import com.jxoa.manager.common_platform.bean.Newsmanagement;
import com.jxoa.manager.common_platform.service.INewsService;
import com.jxoa.manager.common_platform.service.MessageService;
import com.jxoa.manager.qxh.bean.Rkjb;
import com.jxoa.manager.zck.bean.Jncypx;
import com.jxoa.manager.zck.bean.Syrygl;
import com.jxoa.manager.zck.service.JncypxService;
import com.jxoa.manager.zck.service.PensionService;
import com.jxoa.manager.zck.service.SyryglService;

/**
 * 
 * 类名：SyryglAction
 * 功能：创业培训管理
 * 详细：
 * 版本：1.0
 *
 */
@Controller
@RequestMapping("cypx")
public class JncypxAction extends BaseAction{
	@Autowired
	private JncypxService jncypxService;
	@Autowired
	private PensionService service; 
	/**
	 *技能从业培训
	 * @return
	 * 
	 */
	@RequestMapping("load")
	public String load(FormParam param,Jncypx ng, ModelMap map){
		Jncypx gl = new Jncypx();
		List syList = new ArrayList();
		List list = jncypxService.load(param,ng);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				gl = (Jncypx)list.get(i);
				if(gl.getRkjbguid()!=null && !"".equals(gl.getRkjbguid())){
					List jbList = service.selectRkjb(gl.getRkjbguid());
					if(jbList!=null && jbList.size()>0){
						Rkjb jb = (Rkjb)jbList.get(0);
						gl.setXm(jb.getXm()==null?"":jb.getXm().toString());
						gl.setXb(jb.getXb()==null?"":jb.getXb().toString());
						gl.setLxdh(jb.getLxdh()==null?"":jb.getLxdh().toString());
					}
					
				}
				syList.add(gl);
			}
		}
		map.addAttribute("cypx",ng);
		map.addAttribute("jncypx",syList);
		param.setAllCount(jncypxService.selectCount(ng));
		map.addAttribute("fromParam", param);
		return "zck/cypx/load";
	}
	/**
	 * 删除
	 * 
	 * @return
	 */
	@RequestMapping("del")
	public ModelAndView delete(String[] ids){
		return ajaxDone(jncypxService.deletejncy(ids));
	}
	
	/**
	 *新增修改页面
	 * @param id
	 * @param mn
	 * @param map
	 * @return
	 */
	@RequestMapping("updatePage")
	public String jumpupdate(String id,ModelMap map,String bz){
		
		Jncypx sygl = new Jncypx();
		if("0".equals(bz)){
			sygl.setBz(bz);
			map.addAttribute("r",sygl );
		}else{
			sygl=jncypxService.get(Jncypx.class, id);
			if(sygl==null){
				return NODATA;
			}
			List jbList = service.selectRkjb(sygl.getRkjbguid());
			if(jbList!=null && jbList.size()>0){
				Rkjb jb = (Rkjb)jbList.get(0);
				if(jb.getRkjbguid()!=null && jb.getXm()!=null){
					sygl.setXm2(jb.getXm());
					sygl.setRkjbguid2(jb.getRkjbguid());
				}
			}
			Member me=ServletUtil.getMember();
			if(sygl.getRkjbguid()==null){
				sygl.setRkjbguid(me.getId());
			}
			
			sygl.setBz(bz);
			map.addAttribute("r",sygl );
		}
		return "zck/cypx/update";
		
	}
	
	/**
	 * 失业修改
	 * @param mn
	 * @param errors
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(Jncypx syrygl,String bz){
		if(syrygl.getRkjbguid()==null || !"".equals(syrygl.getRkjbguid())){
			syrygl.setRkjbguid(syrygl.getRkjbguid2());
		}
		if("1".equals(bz)){
			return ajaxDone(jncypxService.update(syrygl));
		}else{
			syrygl.setJncypxguid(StringUtil.getUUID());
			return ajaxDone(jncypxService.add(syrygl));
		}
		
	}
	/**
	 *查询点击查看详细
	 * @param id
	 * @param mn
	 * @param map
	 * @return
	 */
	@RequestMapping("check")
	public String queryMessage(String id,ModelMap map){
		Jncypx ng=jncypxService.get(Jncypx.class, id);
		if(ng==null){
		return NODATA;
		}
		if(ng!=null && ng.getRkjbguid()!=null){
			List jbList = service.selectRkjb(ng.getRkjbguid());
			if(jbList!=null && jbList.size()>0){
				Rkjb jb = (Rkjb)jbList.get(0);
				ng.setLxdh(ng.getLxdh());
				ng.setXb(jb.getXb());
				ng.setXm(jb.getXm());
			}
			
		}
		map.addAttribute("r",ng );
		
		return "zck/cypx/check";
	}
	
	public String getNowdate(){
		String temp_str="";   
	    Date dt = new Date();   
	    //最后的aa表示“上午”或“下午”    HH表示24小时制    如果换成hh表示12小时制   
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
	    temp_str=sdf.format(dt);   
	    return temp_str;
	}
	
}
