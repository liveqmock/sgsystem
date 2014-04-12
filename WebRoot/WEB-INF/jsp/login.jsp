<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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
	<title>舜耕社区信息平台</title>
	<meta http-equiv=Content-Type content="text/html; charset=utf-8">
	<link href="favicon.ico" rel="SHORTCUT ICON" />
	<script src="http://libs.baidu.com/jquery/1.8.3/jquery.min.js"></script>
	
	<script type="text/javascript">
		<!--
			window.jQuery || document.write('<script src="resource/js/jquery-1.8.3.min.js" type="text/javascript"></script>');
		 //-->
 	</script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link type="text/css" rel="stylesheet" href="resource/images/login/login.css">
	<script src="resource/js/artDialog/jquery.artDialog.js?skin=default"></script>
	<script src="resource/js/security/security.js"></script>
	<script src="resource/js/login.js"></script>
</head>

<body class="loginPageBody" >
	<!--拉开屏幕  -->
	<%--<div id="divlm_left" style="float:left;width:50%;height:100%;left: 0px; position: absolute; top: 0px; background-color: #0066ff;z-index:9999;"></div>
	<div id="divlm_right" style="float:right;width:50%;height:100%;right: 0px; position: absolute; top: 0px; background-color: #0066ff;z-index:9999;"></div>
	<script type="text/javascript"> 
		$("#divlm_left").animate({width:'-50%'}, 4000,function(){$(this).remove();});
		$("#divlm_right").animate({width:'-50%'}, 4000,function(){$(this).remove();});
	</script>
	
	--%><!-- 结束 -->
	<div class="LoginWrapbg ">
		<div style="width: 100%; height: 50%; left: 0; top: 0; z-index: -1;"></div>
		<div style="width: 442px; height: 440px; margin: 0 auto; margin-top: -260px;">
			<img src="resource/images/login/images/logo.png" style="margin-left: 50px;"/>
			<div class="welcome">&nbsp; </div>
			<div class="loginBar">
				<div id="divcenter_login" >
					<div class="fieldWrap" >
						<div class="lable" >用户名：</div>
						<div class="inputWrap">
							<input type="text"  id="username" class="inputText" value="admin"  >
						</div>
					</div>
					<div class="fieldWrap" >
						<div class="lable">密码：</div>
						<div class="inputWrap">
							<input type="password"  id="pwd" class="inputText" value="123456" >
						</div>
					</div>
					
					<%--
						<div id="verifyCodeWrap" class="fieldWrap verifyCodeWrap">
						 <div class="lable">验证码：</div>
						 <div class="inputWrap" style="width: 100px;">
							<input type="text"  id="vercode" class="inputText" name="vercode" style="width: 100px;" />
						 </div>
						 <div class="verifyCode" >
							<img src="sy_login/imgNum.do" id="img_vercode" onclick="this.src='sy_login/imgNum.do?_t='+new Date()"  width="100px;"/>
						</div>
					</div>--%>
					
					
					<div id="loginBtnWrap" class="fieldWrap">
						<a id="loginBtn" class="inline-block" href="javascript:void(0);"  >登录</a>
					</div>
				</div>
				<div id="divcenter_loginin" style="display: none;">
					<div style="margin-left: 80px;margin-top: 40px;">
						<img src="resource/images/onload.gif" alt="正在登陆中..." style="margin-left: 40px;"/>
						<div style="margin-top: 20px;margin-left:10px;font-size: 20px;font-family: 楷体">正在登陆，请稍等...</div>
					</div>
				</div>
				
			</div>
			<input type="hidden" id="modulus" value="${requestScope.modulus }"/>
			<input type="hidden" id="exponent" value="${requestScope.exponent }"/>
		</div>
		<div class="copyright">
			<div class="center">舜耕社区 Tel：
			<br/>Copyright  &copy; 2013-2014  <a href="http://www.iaphone.com/" target="_blank" >山东慧若电子商务有限公司</a>Tel： </div>
		</div>
	</div>

</body>
</html>
