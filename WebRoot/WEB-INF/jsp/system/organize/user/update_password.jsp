<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--用户管理 -- 重置密码
--%>

<div class="pageContent" >					
<form method="post" action="user/updatePw.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap" style="padding-left:20px;"  layoutH="58">
			
			<dl style="margin-top: 20px;">
				<dt>新密码：</dt>
				<dd>
					<input id="w_validation_pwd" type="password" encryptTo="userPassword" class="required" minlength="6" maxlength="20" size="25" />
					<span class="info">重置用户登录密码，长度在6-20之间。</span>
				</dd>
			</dl>
			<dl>
				<dt>重复密码：</dt>
				<dd>
					<input type="password" encryptTo="pwd" class="required" equalto="#w_validation_pwd" minlength="6" maxlength="20" size="25" />
				</dd>
			</dl>
			<input type="hidden" name="id" value="${param.id }"/>
			<input type="hidden" name="rel" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			<input type="hidden" id="modulus" value="${requestScope.modulus }"/>
			<input type="hidden" id="exponent" value="${requestScope.exponent }"/>
			
	</div>
	<div class="formBar">
		<ul style="float: left;margin-left: 30%;">
			<li><div class="buttonActive"><div class="buttonContent"><button type="submit" onclick="encryptePassword(this)">保存</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
	
</form>
</div>
										
						
					
		

	

