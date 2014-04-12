<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--用户管理 -- 新增用户
--%>

<div class="pageContent" >					
<form method="post" action="user/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap" style="padding-left:20px;"  layoutH="58">
			<dl>
				<dt>账号：</dt>
				<dd>
					<input type="text" name="userName"  minlength="3"  maxlength="15" class="required alphanumeric"  size="25"/>
					<span class="info">登录系统的账号,只能由数字、字母或者下划线组成，长度在3-15之间。</span>
				</dd>
			</dl>
			<dl>
				<dt>密码：</dt>
				<dd>
					<input type="password" encryptTo="userPassword" class="required" minlength="6" maxlength="20" size="25" value="123456"/>
					<span class="info">系统登录密码，默认为123456。长度在6-20之间。</span>
				</dd>
			</dl>
			<dl>
				<dt>姓名：</dt>
				<dd>
					<input type="text" name="trueName" class="required" minlength="2" maxlength="10" size="25"/>
					<span class="info">真实姓名只能由汉字、数字、字母或者下划线组成，长度在2-10之间。</span>
				</dd>
			</dl>
			<dl>
				<dt>性别：</dt>
				<dd>
					<select class="combox"  name="userSex" >
							<option value="1">男</option>
							<option value="0">女</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>学历：</dt>
				<dd>
				  <select class="combox required"   name="xltypeid">
	          		<option value="">--请选择学历类型--</option>
	          		<my:outOptions type="13"/>
	               </select>
				</dd>
			</dl>
			<dl>
				<dt>党员：</dt>
				<dd>
					<select class="combox required"   name="dytypeid">
	          		<option value="">--请选择党员类型--</option>
	          		<my:outOptions type="20"/>
	               </select>
				</dd>
			</dl>
			<dl>
				<dt>手机号：</dt>
				<dd>
					<input type="text" name="mobilePhoneNumber" class="digits"   minlength="11" maxlength="11" size="25"/>
				</dd>
			</dl>
			<dl>
				<dt>入职时间：</dt>
				<dd>
				 	<input type="text" class="required" readonly="readonly" onFocus="WdatePicker()" name="joindate"  /> 
 				</dd>
			</dl>
			<dl>
				<dt>职务：</dt>
				<dd>
					<select class="combox required"   name="zwtypeid">
	          		<option value="">--请选择职务类型--</option>
	          		<my:outOptions type="19"/>
	               </select>				</dd>
			</dl>
			<dl>
				<dt>部门：</dt>
				<dd>
					<a href="dept/lookUpPage.do" lookupGroup="dept" title="部门查询"><input type="text" readonly="readonly" size="25" toName="dept.name" value="<c:out value="${applicationScope.deptId2Name[param.deptId]}" />" class="required"/></a><a class="btnLook" href="dept/lookUpPage.do" lookupGroup="dept" >查找带回</a>
					<input type="hidden" name="deptId" size="25" toName="dept.id"  value="${param.deptId }"/>
				</dd>
			</dl>
			
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="userDesc" cols="70" rows="2" maxlength="50"></textarea>
				</dd>
			</dl>
			<dl>
				<dt>允许登录系统：</dt>
				<dd>
					<select class="combox"  name="userStatus" >
							<option value="1">允许</option>
							<option value="0">限制</option>
					</select>
				</dd>
			</dl>
			
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
										
						
					
		

	

