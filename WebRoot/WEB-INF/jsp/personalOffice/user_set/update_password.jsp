<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--个人设置 -- 修改密码
--%>

<div class="pageContent" >
					
	<form method="post" action="user/updateMyPw.do" class="pageForm required-validate" onsubmit="return validateCallback(this,navTabAjaxDone)">
							
		<div class="pageFormContent nowrap" style="padding-left:50px;"  >
				
				<dl style="margin-top: 10px;">
					<dt>旧密码：</dt>
					<dd>
						<input  type="password" encryptTo="oldPassword" class="required" minlength="6" maxlength="20" size="25" />
						<span class="info">输入旧密码，长度在6-20之间。</span>
					</dd>
				</dl>
				<dl >
					<dt>新密码：</dt>
					<dd>
						<input id="w_validation_pwd" type="password" encryptTo="userPassword" class="required" minlength="6" maxlength="20" size="25" />
						<span class="info">输入新密码，长度在6-20之间。</span>
					</dd>
				</dl>
				<dl>
					<dt>重复密码：</dt>
					<dd>
						<input type="password" encryptTo="pwd" class="required" equalto="#w_validation_pwd" minlength="6" maxlength="20" size="25" />
					</dd>
				</dl>
				<input type="hidden" id="modulus" value="${requestScope.modulus }"/>
				<input type="hidden" id="exponent" value="${requestScope.exponent }"/>
				<input type="hidden" name="navTabId" value="${param.rel}"/>
				<div class="buttonActive" style="margin-left: 150px;margin-top: 20px"><div class="buttonContent"><button type="submit" onclick="encryptePassword(this)">修改</button></div></div>
				<div class="button" style="margin-left: 10px;margin-top: 20px"><div class="buttonContent"><button type="reset">清空</button></div></div>
				
				
		</div>
		
		
	</form>
</div>
										
						
					
		

	

