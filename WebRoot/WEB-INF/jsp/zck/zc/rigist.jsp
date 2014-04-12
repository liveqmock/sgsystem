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
					账号：<input type="text" name="userName" id="userName" minlength="3"  maxlength="15" class="required alphanumeric"  size="25"/>
					<span class="info"><font color="red" >*</font>登录系统的账号,只能由数字、字母或者下划线组成，长度在3-15之间。</span>
				</dd>
			</dl>
			<dl>
				<dd>
					密码：<input type="password" name="userPassword" id="userPassword"  encryptTo="userPassword" class="required" minlength="6" maxlength="20" size="25" value="123456"/>
					<span class="info"><font color="red" >*</font>系统登录密码，默认为123456。长度在6-20之间。</span>
				</dd>
			</dl>
			<dl>
				<dd>
					姓名：<input type="text" name="trueName" id="trueName" class="required" minlength="2" maxlength="10" size="25"/>
					<span class="info"><font color="red" >*</font>真实姓名只能由汉字、数字、字母或者下划线组成，长度在2-10之间。</span>
				</dd>
			</dl>
			<dl>
				<dd>
					性别：<select class="combox"  name="userSex" id="userSex">
							<option value="1">男</option>
							<option value="0">女</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dd>
				 学历：<select class="combox required"   name="xltypeid" id="xltypeid">
	          		<option value="">--请选择学历类型--</option>
	          		<my:outOptions type="13"/>
	               </select>
				</dd>
			</dl>
			<dl>
				<dd>
					党员：<select class="combox required"   name="dytypeid" id="dytypeid">
	          		<option value="">--请选择党员类型--</option>
	          		<my:outOptions type="20"/>
	               </select>
				</dd>
			</dl>
			<dl>
				<dd>
					手机：<input type="text" name="mobilePhoneNumber" id="mobilePhoneNumber" class="digits"   minlength="11" maxlength="11" size="25"/>
				</dd>
			</dl>
			<!-- 
			<dl>
				<dt>入职时间：</dt>
				<dd>
				 	<input type="text" class="required" readonly="readonly" onFocus="WdatePicker()" name="joindate"  /> 
 				</dd>
			</dl>
			-->
			<dl>
				<dd>
					职务：<select class="combox required" id="zwtypeid"  name="zwtypeid">
	          		<option value="">--请选择职务类型--</option>
	          		<my:outOptions type="19"/>
	               </select>				</dd>
			</dl>
		 
			<dl>
				<dd>
					部门：
					<select class="combox required" id="deptId"  name="deptId" >
	          		<option value="">--请选择部门--</option>
	          		<my:outOptions type="21"/>
	               </select><font color="red" >*</font>	
				</dd>
			</dl>
		  
			<dl>
				<dd>
					备注：<textarea  name="userDesc" id="userDesc" cols="70" rows="3" maxlength="50"></textarea>
				</dd>
			</dl>
			<input type="hidden" name="rel" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			<input type="hidden" name="userStatus" value="1"/>
			<input type="hidden" id="modulus" value="${requestScope.modulus }"/>
			<input type="hidden" id="exponent" value="${requestScope.exponent }"/>
	</div>
	<div style="text-align:center;">
		<button type="button" onclick="check()" >保存</button>&nbsp;
		<button type="button" class="close" onclick="back()">重置</button>
		
	</div>
</form>
</body>
</html>
<script type="text/javascript">
	function check(){
		var name = document.getElementById("userName").value;
		var pass = document.getElementById("userPassword").value;
		var trueName = document.getElementById("trueName").value;
		var userSex = document.getElementById("userSex").value;
		var xltypeid = document.getElementById("xltypeid").value;
		var dytypeid = document.getElementById("dytypeid").value;
		var mobilePhoneNumber = document.getElementById("mobilePhoneNumber").value;
		var zwtypeid = document.getElementById("zwtypeid").value;
		var userDesc = document.getElementById("userDesc").value;
		var deptId = document.getElementById("deptId").value;
		
		if(mobilePhoneNumber!=""){
			if(mobilePhoneNumber.length!=11){
				alert("手机电话号码为11位");
				return false;
			}
		}
		var regex = /^[^_][A-Za-z]*[a-z0-9_]*$/ ;
		var ret = regex.test(name);
		if (ret == true) {} 
		else 
		{
			alert("用户名输入错误");
			return false;
		}
		
		if(isNaN(mobilePhoneNumber)){alert("手机号应输入数字！");return false;}
		if(deptId==""){alert("请选择部门！");return false;}
		if(name==""){alert("账号不能为空！");return false;}
		if(name.length>15  || name.length<3){
			alert("账号长度在3-15之间！");
			return false;
		}
		if(pass==""){
			alert("密码不能为空!");return  false;
		}
		if(pass.length>20 || pass.length<6){
			alert("密码长度在6-20之间");return false;
		}
		$.post("regist.do","userName="+name+"&userPassword="+pass+"&trueName="+trueName+"&userSex="+userSex+"&xltypeid="+xltypeid+"&dytypeid="+dytypeid+"&mobilePhoneNumber="+mobilePhoneNumber+"&zwtypeid="+zwtypeid+"&userDesc="+userDesc+"&deptId="+deptId,backFunc);
		//document.loginForm.submit();
	}
	function backFunc(date){
	  if(date=="msg.operation.success"){
	  	alert("注册成功！");
	  	$("#loginForm")[0].reset();
	  	return false;
	  }else{
	  	alert("注册失败！");
	  	return false;
	  }
	 }
function back(){
		$("#loginForm")[0].reset();
}
window.parent.document.getElementById("gzdt").innerHTML="用户注册";
	window.parent.document.getElementById("gd").innerHTML="<span onclick='first()'>首页</span>>用户注册";
</script>
