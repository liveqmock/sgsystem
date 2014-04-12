<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" session="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <title>登陆超时--正在跳转到系统登陆页面</title>
   	<link href="favicon.ico" rel="SHORTCUT ICON" />
    <meta http-equiv=content-type content="text/html; charset=utf-8">
	
	<meta http-equiv="refresh" content="2;url=<%=basePath%>sy_login.do">
  	<style type=text/css>
	  	body {
			margin: 0px; 
			font-size: 16px;
			font-family: 楷体,sans-serif;
			background-color: #cdd6dd; 
		}
		#message {
			border: #386792 1px dotted; 
			padding: 20px; 
			margin: 200px auto; 
			width: 400px;
			background-color: #fff; 
			text-align: center
		}
		span{
			font-weight: bold;
		}
	</style>
</head>	
<body>
	<div id=message>
		<span>登陆超时！正在跳转到系统登陆界面...</span>
	</div>
</body>
</html>
