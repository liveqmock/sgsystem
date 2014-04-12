<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<title>舜华社区信息平台</title>
	<meta http-equiv=Content-Type content="text/html; charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="resource/images/login/login.css">
	
	
</head>

<body class="loginPageBody">

	<div class="LoginWrapbg ">
		<div style="width: 100%; height: 50%; left: 0; top: 0; z-index: -1;"></div>
		<div style="width: 442px; height: 440px; margin: 0 auto; margin-top: -260px;">
			<img src="resource/images/login/images/logo.png" style="margin-left: 50px;"/>
			<div class="welcome">&nbsp; </div>
			<div class="loginBar">
				
				<div >
					<div style="margin-left: 20px;margin-top: 50px;">
						<h3 >当前登陆用户：${applicationScope.userId2Name[sessionScope.minfo.id]}</h3>
					</div>
					<div style="margin-top: 40px;margin-left: 100px;">
						<a href="main.do">直接进入</a><a href="sy_login/out.do" style="margin-left: 20px;">注销登陆</a>
					</div>
				</div>
					
			</div>
		</div>
		<div class="copyright">
			<div class="center">舜耕社区 Tel：
			<br/>Copyright &copy; 2013-2014  <a href="http://www.iaphone.com/" target="_blank">山东慧若电子商务有限公司</a>Tel：</div>
		</div>
	</div>
</body>
</html>
