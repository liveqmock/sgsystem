<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!-- 当高于IE9时按IE9解析 -->
	<meta http-equiv="X-UA-Compatible" content="IE=9" />

	<title>舜耕社区信息平台</title>
	<link href="favicon.ico" rel="SHORTCUT ICON" />
	<script type="text/javascript">
		<!--
			var webrootpath='<%= path %>';//项目跟目录名称
		 //-->
	</script>
	<%@ include file="/WEB-INF/jsp/commons/include.head.jsp"%>

</head>

<body scroll="no">
	<%--欢迎图片 --%><%--
    <div id="div_wecomeImg" style="width:100%;height:100%;position: absolute; z-index:9999;background-color: #D8EAF4;">
		<img src="resource/images/welcome.jpg" style="position:relative; ; top:50%;margin-top:-300px;width: 1280px;height: 600px"/>	
	</div>
	--%><div id="layout">
		<div id="header">
			<div class="headerNav">
			 <img src="resource/images/logo/logo.png"   style="margin-left: 5px;"/>
				<ul class="nav" style="color: black;">
					<li><a href="javascript:;"  >当前用户：${requestScope.user.userName } &nbsp;姓名：${requestScope.user.trueName } </a></li>
					<li><a href="javascript:;" class="increaseFont" >设置</a></li>
					
					<li><a href="javascript:;" class="changeFont" fz="12" >小</a></li>
					<li><a href="javascript:;" class="changeFont" fz="14">大</a></li>
				
					<li><a href="javascript:;" id="loginGoout">退出</a></li>
				</ul>
		
				<ul class="nav" style="margin-right: 10px;margin-top: 25px;">
					<li><a><span id="clock" ></span></a></li>
					<li><a target='_blank' title="在线咨询" href='http://wpa.qq.com/msgrd?v=3&uin=1163649072&site=qq&menu=yes'><img border='0' src='http://wpa.qq.com/pa?p=2:1163649072:51' alt='点击咨询' title='点击咨询'/></a></li>
					<my:validationAuthority url="instantMessage/load.do">
						<li>
						<a  href="instantMessage/load.do?rel=grbg_jsgt"  target="navTab" rel="grbg_jsxgt" title="即时沟通">
							<img src="resource/images/menu/reply.gif" alt="即时沟通" style="vertical-align:middle;"/>(<span style="color: red" id="ft_jhst">0</span>)</a>
						</li>
					</my:validationAuthority>
					<my:validationAuthority url="email/loadIn.do">
						<li>
						<a  href="email/loadIn.do?rel=grbg_nbyj_sjx&status=0" title="未读邮件"  target="navTab" rel="grbg_nbyj_sjx">
							<img src="resource/images/menu/mail_new.gif" alt="未读邮件" style="vertical-align:middle;"/>(<span style="color: red" id="ft_wdyj">0</span>)</a>
						</li>
					</my:validationAuthority>
					
					<my:validationAuthority url="msgwarn/load.do">
						<li>
						<a  href="msgwarn/load.do?rel=grbg_xxtx" title="消息提醒"  target="navTab" rel="grbg_xxtx">
							<img src="resource/images/menu/msg.gif" alt="消息提醒" style="vertical-align:middle;"/>(<span style="color: red" id="ft_xxtx">0</span>)</a>
						</li>
					</my:validationAuthority>
					
					
					<li ><div id="li_Theme" style="display: block;height: 20px;cursor:pointer;">
							<a>主题</a>
							<ul class="themeList" style="display:none ;width: 100px;padding-left: 5px;" id="themeList">
								<li theme="default"><div >蓝色</div></li>
								<li theme="green"><div>绿色</div></li>
								<li theme="purple"><div>紫色</div></li>
								<li theme="silver"><div>银色</div></li>
								<li theme="azure"><div class="selected">天蓝</div></li>
							</ul>
						</div>
					</li>
					
					
				</ul>
				
				
			</div>

			<!-- navMenu -->
			
		</div>

		<div id="leftside">
			<%--左侧菜单--%>
			<%@ include file="/WEB-INF/jsp/left.jsp"%>
		</div>
		<div id="container">
			<%--右侧--%>
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					
					<div class="page unitBox " layoutH="2">
						
							<%--引入主页内容--%>
							<%@ include file="/WEB-INF/jsp/home.jsp"%>
					
					</div>
					
				</div>
			</div>

		</div>

	</div>

	<div id="footer">
		<div style="float: left;margin-left: 20px;">
			在线<a href="javascript:;" style="color: red" id="onlineNum" title="查看在线人员">&nbsp;${requestScope.onlineNum }&nbsp;</a>人
			<img src="resource/images/menu/clock.png"  style="margin-left: 10px;vertical-align:middle;"/>
			登陆时间：<fmt:formatDate value="${sessionScope.minfo.loginTime }" pattern="HH:mm:ss" />
			
		</div>
		<div style="float: left;margin: 0 auto;width: 900px">
		Copyright &copy; 2013 <a href="#" target="_blank">技术支持：山东慧若电子商务有限公司</a> Tel：
		 舜耕社区 Tel：</div>
		
		
	</div>
	<%--在线人员 隐藏弹出窗口--%>
	<div id="div_online" style="display: none;"><ul id="online_tree" class="ztree"></ul></div>
	<script type="text/javascript">
		<!--
			//获取一些基本信息
			var showOnLine=<%=request.getAttribute("showOnLine") %>;
			var scheduleWarn=<%=request.getAttribute("scheduleWarn") %>;
			var msgWarn=<%=request.getAttribute("msgWarn") %>;
			var msgWarnTime=<%=request.getAttribute("msgWarnTime") %>;
		 //-->
	</script>
 </body>
</html>
