<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%> 
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%request.setCharacterEncoding("UTF-8");%> 



<head>
<title>张掖市劳动监察网</title>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/style.css" />
		<script src="http://libs.baidu.com/jquery/1.8.3/jquery.min.js"></script>
	
	<script type="text/javascript">
		<!--
			window.jQuery || document.write('<script src="resource/js/jquery-1.8.3.min.js" type="text/javascript"></script>');
		 //-->
 	</script>
</head>

<body>
 <form name="loginForm"  id="loginForm" method="post" action="regist.do" >
						
	<div class="pageFormContent nowrap" style="padding-left:20px;"  layoutH="58">
			<dl>
				<dd>
					单位名称：<input type="text" readonly name="userName" id="userName" value="${requestScope.dwzp.dwmc}" minlength="3"  maxlength="15" class="required alphanumeric"  size="25"/>
				</dd>
			</dl>
			<dl>
				<dd>
					需求岗位：<input type="text" readonly name="userPassword" id="userPassword" value="${requestScope.dwzp.xqgw }"  encryptTo="userPassword" class="required" minlength="6" maxlength="20" size="25" value="123456"/>
				</dd>
			</dl>
			<dl>
				<dd>
					需求人数：<input type="text" readonly value="${requestScope.dwzp.xqrs }" name="trueName" id="trueName" class="required" minlength="2" maxlength="10" size="25"/>
				</dd>
			</dl>
			<dl>
				<dd>
					薪资待遇：<input type="text" readonly name="mobilePhoneNumber" id="mobilePhoneNumber" value="${requestScope.dwzp.xzdy }" class="digits"   minlength="11" maxlength="11" size="25"/>
				</dd>
			</dl>
			<dl>
				<dd>
					性别要求：<input type="text" readonly name="mobilePhoneNumber" id="mobilePhoneNumber" value="${requestScope.dwzp.xbyq }" class="digits"   minlength="11" maxlength="11" size="25"/>			</dd>
			</dl>
		 
			<dl>
				<dd>
					招聘代表：<input type="text" readonly name="mobilePhoneNumber" id="mobilePhoneNumber" value="${requestScope.dwzp.lxr }" class="digits"   minlength="11" maxlength="11" size="25"/>
				</dd>
			</dl>
		  
			<dl>
				<dd>
					联系电话：<input type="text" readonly name="mobilePhoneNumber" id="mobilePhoneNumber" value="${requestScope.dwzp.lxrdh }" class="digits"   minlength="11" maxlength="11" size="25"/>
				</dd>
			</dl>
			<dl>
				<dd>
					单位地址：<textarea style="font-size:13px;" readonly  name="userDesc" id="userDesc" cols="70" rows="3" maxlength="50">${requestScope.dwzp.dwdz}</textarea>
				</dd>
			</dl>
			
	</div>
	
</form>
</body>
</html>
<script type="text/javascript">
window.parent.document.getElementById("gzdt").innerHTML="单位招聘";
	window.parent.document.getElementById("gd").innerHTML="<span onclick='first()' style='cursor:hand;'>首页</span><span onclick='sec(3)' style='cursor:hand;'>>>单位招聘</span>>><font style='cursor:Default;'>详情</font>";
</script>
