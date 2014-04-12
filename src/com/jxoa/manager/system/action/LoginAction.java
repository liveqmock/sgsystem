/**  
 * @Project: jxoa
 * @Title: LoginAction.java
 * @Package com.jxoa.manager.system.action
 * @date 2013-4-1 下午3:16:19
 * @Copyright: 2013 
 */
package com.jxoa.manager.system.action;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.interfaces.RSAPublicKey;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Hex;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.jxoa.commons.base.BaseAction;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.model.OnLineUser;
import com.jxoa.commons.util.RSAUtils;
import com.jxoa.commons.util.ServletUtil;
import com.jxoa.manager.system.service.ILoginService;

/**
 * 
 * 类名：LoginAction
 * 功能：登录模块
 * 详细：用户登录
 * 作者：LiuJincheng
 * 版本：1.0
 * 日期：2013-4-1 下午3:16:19
 *
 */
@Controller
@RequestMapping("/sy_login")
public class LoginAction extends BaseAction{
	
	@Autowired
	private ILoginService service; 
	
	/**
	 * 跳转到登录页面
	 * @param map
	 * @return
	 */
	@RequestMapping("")
	public String tologin(String passwd,HttpSession session,ModelMap map,HttpServletRequest request){
		
		Member me=ServletUtil.getMember();
//     	HttpSession ss=(HttpSession) request.getSession().getAttribute(passwd);
		//判断当前用户是否已经登陆
		if(me!=null){
			Map<String,OnLineUser> usersMap =ServletUtil.getOnLineUsers();
			OnLineUser om=usersMap.get(me.getId());
			if(om!=null){
				if(ServletUtil.getSession().getId().equals(om.getSessionId())){
					//用户已经登陆
					return "has_login";
				}
			}
		}
		//生成加密密钥
		String pwd=UUID.randomUUID().toString();
		session.setAttribute("jmpw", pwd);
		RSAPublicKey publicKey = RSAUtils.getPublicKey(pwd); 
		map.put("modulus",new String(Hex.encodeHex(publicKey.getModulus().toByteArray())));
		map.put("exponent",new String(Hex.encodeHex(publicKey.getPublicExponent().toByteArray())));
		return "login";
	}
	
	/**
	 * 用户登录
	 * @param name
	 * @param password
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("go")
	public ModelAndView login(String vercode,String name,String password,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		
		//解密
		String pwd=RSAUtils.decryptStringByJs((String)request.getSession().getAttribute("jmpw"),password);
		
		return service.updateLogin(vercode,name,URLDecoder.decode(pwd, "utf-8"),request,response);
		
	}
	

	/**
	 * 注销登陆
	 * @return
	 */
	@RequestMapping("out")
	public String out(HttpSession session){
		
		System.out.println("********注销登陆******");
		session.setAttribute("isOut",true);
		session.invalidate();
		return "redirect:/index.jsp";
	}
	/**
	 * 获取验证码
	 * @param session
	 * @param response
	 */
	@RequestMapping("imgNum")
	public void getImg(HttpSession session,HttpServletResponse response){
		 ServletOutputStream out=null;
		try{ 
			 DefaultKaptcha captchaProducer=(DefaultKaptcha)ServletUtil.getApplicationContext().getBean("captchaProducer");
			
			 response.setDateHeader("Expires", 0);     
	         response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");    
	         response.addHeader("Cache-Control", "post-check=0, pre-check=0");    
	         response.setHeader("Pragma", "no-cache");    
	         response.setContentType("image/jpeg");    
	         String capText = captchaProducer.createText();    
	         session.setAttribute("imgCode", capText);    
	         BufferedImage bi = captchaProducer.createImage(capText);
	         out = response.getOutputStream();
	         ImageIO.write(bi, "jpg", out);
            
             out.flush(); 
             
         }catch (Exception e) {
			
		 }
		 finally{    
             if(out!=null){
            	 try {
					out.close();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
             }
        
         }    
		
		
		
		
	}
	
	
	
	
	
	
}
