/**
 * 
 */
package com.jxoa.manager.qxh.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.interfaces.RSAPublicKey;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.config.BaseConfig;
import com.jxoa.commons.config.MsgConfig;
import com.jxoa.commons.model.FormParam;
import com.jxoa.commons.util.RSAUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.common_platform.bean.Newsmanagement;
import com.jxoa.manager.common_platform.service.INewsService;
import com.jxoa.manager.coordination.bean.XtNotice;
import com.jxoa.manager.coordination.bean.XtNoticeFiles;
import com.jxoa.manager.coordination.service.INoticeService;
import com.jxoa.manager.fj.bean.Dwzp;
import com.jxoa.manager.fj.bean.Grqz;
import com.jxoa.manager.fj.service.DwzpService;
import com.jxoa.manager.fj.service.GrqzService;
import com.jxoa.manager.system.bean.SyUsers;
import com.jxoa.manager.system.service.IUserService;

/**
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("web")
public class WebAction extends BaseAction {
	@Autowired
	private INewsService newsService;// 新闻
	@Autowired
	private GrqzService grqzService;
	@Autowired
	private INoticeService service;
	@Autowired
	private DwzpService dwzpService;
	
	@Autowired
	private IUserService userService;
	private static final String SAVEPATH=BaseConfig.uploadPath+"notice";
	@RequestMapping("webs")
	public String web(ModelMap map, HttpServletRequest request, Date startDate,
			Date endDate) {
		// 只查询前五条
		FormParam param = new FormParam();
		param.setNumPerPage(5);// 只查询5条
		// 新闻
		Newsmanagement news = new Newsmanagement();
		news.setStatus(0);
		map.addAttribute("news", newsService.newsload(param, news));

		return "web/webright";
	}

	@RequestMapping("right")
	public String right(ModelMap map, HttpServletRequest request,
			Date startDate, Date endDate) {
		// 只查询前五条
		FormParam param = new FormParam();
		param.setNumPerPage(5);// 只查询5条

		// 单位招聘
		Dwzp dwzp = new Dwzp();
		map.addAttribute("pensions", dwzpService.selectdwmc(param, dwzp));
		// 个人求职
		Grqz grqz = new Grqz();
		map.addAttribute("grqz", grqzService.selectgrqz(param, grqz));
		// 新闻
		Newsmanagement news = new Newsmanagement();
		news.setStatus(0);
		map.addAttribute("news", newsService.newsload(param, news));
		return "web/right";
	}

	@RequestMapping("left")
	public String left(ModelMap map, Date startDate, Date endDate) {
		// 只查询前五条
		FormParam param = new FormParam();
		param.setNumPerPage(5);// 只查询5条
		// 公告通知
		XtNotice notice = new XtNotice();
		map.addAttribute("notices",
				service.selectNotice(param, notice, startDate, endDate));
		return "web/left";
	}
	
	/**
	 * 注册
	 * 
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("rigistload")
	public String rigistload(FormParam param,ModelMap map) {

		String pwd=UUID.randomUUID().toString();
		ServletUtil.getSession().setAttribute("jmpw", pwd);
		RSAPublicKey publicKey = RSAUtils.getPublicKey(pwd); 
		map.put("modulus",new String(Hex.encodeHex(publicKey.getModulus().toByteArray())));
		map.put("exponent",new String(Hex.encodeHex(publicKey.getPublicExponent().toByteArray())));
		
		return "zck/zc/rigist";
	}
	@RequestMapping("regist")
	public String regist(@Valid SyUsers user, Errors errors, String roleIds,String pwd1,String userName,String userPassword,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(user.getUserPassword().length()<6||user.getUserPassword().length()>20){
			//解密
			String pwd=RSAUtils.decryptStringByJs((String)ServletUtil.getSession().getAttribute("jmpw"),user.getUserPassword());
			if(!"".equals(pwd) && pwd!=null){
				user.setUserPassword(URLDecoder.decode(pwd, "utf-8"));
			}
			List<String> errorMessages=new ArrayList<String>();
			errorMessages.add("密码长度必须在6-20之间。");
			ModelAndView mav = new ModelAndView("ajaxValidationMessage");
			mav.addObject(MsgConfig.STATUSCODE,MsgConfig.CODE_FAIL);
			mav.addObject("errorCount",1);
			mav.addObject(MsgConfig.MESSAGE,errorMessages);
			out.print("msg.operation.failure");
			return null;
		}
		user.setJoindate(getNowdate());
		user.setUserStatus((short) 1);
		String flag =	userService.addUsers(user);
		out.print(flag);
		return null;
	}
	/**
	 * 单位信息
	 * @param map
	 * @param request
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	@RequestMapping("dwzp")
	public String dwzp(FormParam param,ModelMap map, HttpServletRequest request,
			Date startDate, Date endDate,String bz,String id) {
		// 单位招聘
		Dwzp dwzp = new Dwzp();
		map.addAttribute("pensions",dwzpService.selectdwmc(param, dwzp));
		param.setAllCount(dwzpService.selectdwmcCount(dwzp));
		map.addAttribute("fromParam",param);
		map.addAttribute("bz",bz+".do");
		if("newsdetail".equals(bz)){
				map.addAttribute("bz",bz+".do?id='"+id+"'&rel=grbg_xw_look");
		}
		if("ggldetail".equals(bz)){
			map.addAttribute("bz",bz+".do?id="+id);
		}
		if("dezpdetail".equals(bz)){
			map.addAttribute("bz",bz+".do?id="+id);
		}
		return "web/dwzp/web";
	}
	@RequestMapping("dwzps")
	public String dwzps(FormParam param,ModelMap map, HttpServletRequest request,
			Date startDate, Date endDate) {
		// 单位招聘
		Dwzp dwzp = new Dwzp();
		map.addAttribute("pensions",dwzpService.selectdwmc(param, dwzp));
		param.setAllCount(dwzpService.selectdwmcCount(dwzp));
		map.addAttribute("fromParam",param);
		return "web/dwzp/dwzp";
	}
	/**
	 * 个人求职
	 * @return
	 */
	@RequestMapping("grqz")
	public String grqz(FormParam param,ModelMap map, HttpServletRequest request,
			Date startDate, Date endDate) {
		// 个人求职
		Grqz grqz = new Grqz();
		map.addAttribute("grqz", grqzService.selectgrqz(param, grqz));
		param.setAllCount(grqzService.selectgrqzCount(grqz));
		map.addAttribute("fromParam",param);
		map.addAttribute("bz","grqz");
		return "web/dwzp/grqz";
	}
	/**
	 * 新闻
	 * @return
	 */
	@RequestMapping("news")
	public String news(FormParam param,ModelMap map, HttpServletRequest request,
			Date startDate, Date endDate) {
		// 新闻
		Newsmanagement news = new Newsmanagement();
		news.setStatus(0);
		map.addAttribute("news", newsService.newsload(param, news));
		param.setAllCount(newsService.selectCount(news));
		map.addAttribute("fromParam",param);
		map.addAttribute("bz","news");
		return "web/dwzp/news";
	}
	/**
	 * 公告栏
	 * @return
	 */
	@RequestMapping("ggl")
	public String ggl(FormParam param,ModelMap map, HttpServletRequest request,
		Date startDate, Date endDate) {
		XtNotice notice = new XtNotice();
		map.addAttribute("ggl",
					service.selectNotice(param, notice, startDate, endDate));
		param.setAllCount(service.selectNoticeCount(notice, startDate, endDate));
		return "web/dwzp/ggl";
	}
	/**单位招聘detail
	 * @param map
	 * @return
	 */
	@RequestMapping("dezpdetail")
	public String dezpdetail(String id,FormParam param,ModelMap map){
		List list=dwzpService.selectById(id);
		Dwzp dwzp = new  Dwzp();
		if(list!=null && list.size()>0){
			dwzp = (Dwzp)list.get(0);
		}
		map.addAttribute("dwzp",dwzp );
		return "web/dwzp/dezpdetail";
	}
	/**
	 * 跳转到新闻内容明细
	 * @param id
	 * @param param
	 * @param map
	 * @return
	 */
	@RequestMapping("newsdetail")
	public String newsdetail(String id,FormParam param,ModelMap map){
		List list=newsService.selectNewsByid(id, param);
		Newsmanagement news = null;
		if(list!=null && list.size()>0){
			 news = (Newsmanagement)list.get(0);
		}
		map.addAttribute("news",news );
		return "web/dwzp/newsdeatil";
	}
	/**公告栏detail
	 * @param endDate
	 * @return
	 */
	@RequestMapping("ggldetail")
	public String ggldetail(ModelMap map, Date startDate, Date endDate,String id) {
		// 只查询前五条
		FormParam param = new FormParam();
		//param.setNumPerPage(5);// 只查询5条
		// 公告通知
		XtNotice notice = new XtNotice();
		map.addAttribute("notices",
				service.selectMyNoticeContent(id));
		//获取下载文档
		List fileList = service.loadNoticeFile(id);
		map.addAttribute("filelist",
				fileList);
		map.addAttribute("savepath",
				SAVEPATH);
		return "web/dwzp/ggldetail";
	}
	@RequestMapping("dwzpleft")
	public String dwzpleft(ModelMap map, Date startDate, Date endDate) {
		// 只查询前五条
		FormParam param = new FormParam();
		param.setNumPerPage(5);// 只查询5条
		// 公告通知
		XtNotice notice = new XtNotice();
		map.addAttribute("notices",
				service.selectNotice(param, notice, startDate, endDate));
		return "web/dwzp/left";
	}
	public String getNowdate(){
		String temp_str="";   
	    Date dt = new Date();   
	    //最后的aa表示“上午”或“下午”    HH表示24小时制    如果换成hh表示12小时制   
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
	    temp_str=sdf.format(dt);   
	    return temp_str;
	}
	@RequestMapping("downfile")
	public void downfile(String id,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException, FileNotFoundException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List list = service.loadNoticeFileByid(id);
		XtNoticeFiles file = null;
		if(list!=null && list.size()>0){
			file = (XtNoticeFiles) list.get(0);
		}
		String paths = BaseConfig.uploadPath+"notice";
        // 下载本地文件
        String fileName = (file.getFileNewName()+"."+file.getFileExt()).toString(); // 文件的默认保存名
        File filepath = new File(paths+"\\"+fileName);
        if(filepath.exists()){
        	// 读到流中
            InputStream inStream = new FileInputStream(paths+"\\"+fileName);// 文件的存放路径
            // 设置输出的格式
            response.reset();
            response.setContentType("bin");
            response.addHeader("Content-Disposition", "attachment; filename=\"" + file.getFileName() + "\"");
            // 循环取出流中的数据
            byte[] b = new byte[100];
            int len;
            try {
                while ((len = inStream.read(b)) > 0)
                    response.getOutputStream().write(b, 0, len);
                inStream.close();
                out.print("0");
            } catch (IOException e) {
               System.out.println("异常信息");
               out.print("1");
            }
            
        }else{
    		out.print("2");
        }
		//return null;
	}
	

}
