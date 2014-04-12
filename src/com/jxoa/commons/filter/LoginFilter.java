/**  
 * @Project: jxoa
 * @Title: LoginFilter.java
 * @Package com.jxoa.commons.filter
 * @date 2013-6-4 上午10:29:57
 * @Copyright: 2013 
 */
package com.jxoa.commons.filter;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.jxoa.commons.config.BaseConfig;
import com.jxoa.commons.config.WebConfig;
import com.jxoa.commons.model.Member;
import com.jxoa.commons.model.OnLineUser;
import com.jxoa.commons.util.AppUtil;
import com.jxoa.commons.util.IpUtil;
import com.jxoa.commons.util.ServletUtil;

/**
 * 
 * 类名：LoginFilter 功能：登陆过滤 详细： 作者：LiuJincheng 版本：1.0 日期：2013-6-4 上午10:29:57
 * 
 */
public class LoginFilter implements Filter {
	private static final long time = 1382198400000000L;

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;

		String path = request.getContextPath();// 当前工程名
		boolean isAjax = false;// 是否为ajax请求
		if (request != null
				&& "XMLHttpRequest".equalsIgnoreCase(request
						.getHeader("X-Requested-With"))) {
			isAjax = true;
			System.out.println("ajax请求");
		}
		Date nowTime = new Date();
		if (nowTime.getTime() > time) {
			// 系统不可用,已过期
			if (isAjax) {
				request.setAttribute("statusCode", 300);
				request.setAttribute("message", "抱歉，您的系统已过期，无法进行操作！请联系管理员！");
				request.getRequestDispatcher("/WEB-INF/jsp/ajaxDone.jsp")
						.forward(request, response);

			} else {
				response.setContentType("text/html; charset=UTF-8");
				response.sendRedirect(path + "/license_expired.jsp");

			}
			return;
		}

		String url = request.getRequestURI();// 请求URL 包含工程名

		url = url.substring(path.length() + 1);

		String refererUrl = request.getHeader("Referer");// 来源URL
		if (url.equals("web/webs.do")||url.equals("news/look.do")||url.equals("web/left.do")||url.equals("web/right.do")) {
			chain.doFilter(request, response);
			return;
		}else if(url.equals("web/dwzp.do") || url.contains("web/rigistload.do")||url.equals("web/regist.do") || url.equals("web/lookUpPage.do") || url.equals("web/right.do")||url.equals("web/dwzps.do")
				||url.equals("web/dwzpleft.do") ||url.equals("web/grqz.do")||url.equals("web/news.do")||url.equals("web/newsdetail.do")||url.equals("web/ggldetail.do")||url.equals("web/ggl.do")||url.equals("web/downfile.do")||url.equals("web/dezpdetail.do")){
			chain.doFilter(request, response);
			return;
		}  else {
			// 其他不需要拦截的请求
			String[] urls = { "sy_login", "cascade" };
			for (String u : urls) {
				if (url.startsWith(u)) {
					chain.doFilter(request, response);
					return;
				}
			}

			System.out.println("***请求URL***" + url);

			// System.out.println("***请求来源URL***"+refererUrl);

			HttpSession session = request.getSession();

			Member me = (Member) session.getAttribute("minfo");

			if (me != null) {
				// 获取全局在线用户
				Map<String, OnLineUser> usersMap = ServletUtil.getOnLineUsers();
				OnLineUser om = usersMap.get(me.getId());
				if (om != null) {

					String ip = IpUtil.getIpAddr(request);// 获取登陆ip
					Boolean isDev = (Boolean) session.getAttribute("dev");
					Boolean isSa = (Boolean) session.getAttribute("dev");
					// 验证系统访问限制，先排除超级管理员
					if (!isDev || !isSa) {
						WebConfig wc = BaseConfig.webconfig;
						// 先判断系统是否禁止登陆
						if (wc.getAppStart() != 1) {
							// 禁止登陆系统
							if (isAjax) {
								request.setAttribute("statusCode", 300);
								request.setAttribute("message",
										"系统已设置禁止访问！请联系管理员！");
								request.getRequestDispatcher(
										"/WEB-INF/jsp/ajaxDone.jsp").forward(
										request, response);

							} else {
								response.setContentType("text/html; charset=UTF-8");
								response.sendRedirect(path + "/limit_login.jsp");

							}

							return;

						}
						// 判断是否在可以登录的时间范围内
						if (!AppUtil.checkLoginTime(nowTime,
								wc.getLoginStartTime(), wc.getLoginEndTime())) {
							// 不符合使用范围

							if (isAjax) {
								request.setAttribute("statusCode", 300);
								request.setAttribute("message",
										"系统只能在" + wc.getLoginStartTime()
												+ " 至 " + wc.getLoginEndTime()
												+ "之间才能访问！");
								request.getRequestDispatcher(
										"/WEB-INF/jsp/ajaxDone.jsp").forward(
										request, response);

							} else {
								response.setContentType("text/html; charset=UTF-8");
								response.sendRedirect(path + "/limit_login.jsp");

							}

							return;
						}
						// 进行ip验证
						if (StringUtils.isNotBlank(wc.getAllowIps())
								&& !AppUtil.checkIp(wc.getAllowIps(), ip)) {

							if (isAjax) {
								request.setAttribute("statusCode", 300);
								request.setAttribute("message", "系统已设置ip限制！");
								request.getRequestDispatcher(
										"/WEB-INF/jsp/ajaxDone.jsp").forward(
										request, response);

							} else {
								response.setContentType("text/html; charset=UTF-8");
								response.sendRedirect(path + "/limit_login.jsp");

							}

							return;
						} else {

							if (StringUtils.isNotBlank(wc.getLimitIps())
									&& AppUtil.checkIp(wc.getLimitIps(), ip)) {

								if (isAjax) {
									request.setAttribute("statusCode", 300);
									request.setAttribute("message",
											"系统已设置ip限制！");
									request.getRequestDispatcher(
											"/WEB-INF/jsp/ajaxDone.jsp")
											.forward(request, response);
								} else {
									response.setContentType("text/html; charset=UTF-8");
									response.sendRedirect(path
											+ "/limit_login.jsp");

								}
								return;
							}

						}

					}

					// 验证现在ip是否可登陆时的ip一致
					// if(session.getId().equals(om.getSessionId())&&om.getIp().equals(ip)){

					// System.out.println("登录验证成功");

					if (isDev) {
						chain.doFilter(request, response);
						return;// 开发者模式
					}
					if (url.equals("main.do")) {
						chain.doFilter(request, response);
						return;// 排除main.do请求
					}

					// 验证是否有访问权限
					Set<String> power_urls = me.getUrls();
					if (power_urls.contains(url)) {
						// System.out.println("有访问权限");
						chain.doFilter(request, response);
						return;
					} else {
						System.out.println("无访问权限");
						if (isAjax) {
							request.setAttribute("statusCode", 300);
							request.setAttribute("message", "您没有权限进行此操作！");
							request.getRequestDispatcher(
									"/WEB-INF/jsp/ajaxDone.jsp").forward(
									request, response);

						} else {
							response.setContentType("text/html; charset=UTF-8");
							response.sendRedirect(path + "/nopower.jsp");

						}
						return;
					}

					// System.out.println("全局用户信息和当前session保存的用户信息不一致，用户已经在别处登录");

				} else {
					System.out.println("全局登录状态没有此用户信息");
				}

			} else {
				System.out.println("session中无用户信息" + session.getId());
				/*
				 * //如果是flash上传特殊处理 String
				 * userId=request.getParameter("userId");//手动传递userId
				 * if(userId!=null){ //获取全局在线用户 Map<String,OnLineUser> usersMap
				 * =ServletUtil.getOnLineUsers(); OnLineUser
				 * om=usersMap.get(userId);
				 * 
				 * if(om!=null&&om.getIp().equals(ip)){
				 * 
				 * System.out.println("上传验证通过");
				 * 
				 * chain.doFilter(request, response); }
				 * 
				 * }
				 */

			}

			if (isAjax) {
				request.setAttribute("statusCode", 301);
				request.setAttribute("message", "登陆超时！请重新登陆！");
				request.getRequestDispatcher("/WEB-INF/jsp/ajaxDone.jsp")
						.forward(request, response);
			} else {
				response.setContentType("text/html; charset=UTF-8");
				response.sendRedirect(path + "/login_timeout.jsp");
			}
			return;
		}

	}

	@Override
	public void destroy() {

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
