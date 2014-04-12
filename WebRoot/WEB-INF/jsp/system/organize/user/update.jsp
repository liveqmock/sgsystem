<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--用户管理  用户更新
--%>

					
<div class="pageContent" >					
<form method="post" action="user/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap" style="padding-left:50px;"  layoutH="58">
			<dl>
				<dt>账号：</dt>
				<dd>
					<input type="text" name="userName"  value="<c:out value="${requestScope.u.userName }" />"/>
					<span class="info">登录系统的账号</span>
				</dd>
			</dl>
			<dl>
				<dt>姓名：</dt>
				<dd>
					<input type="text" name="trueName" class="required" minlength="2" maxlength="10" size="25" value="<c:out value="${requestScope.u.trueName }" />" />
				</dd>
			</dl>
			<dl>
				<dt>性别：</dt>
				<dd>
					<select class="combox required"  name="userSex" sValue="${requestScope.u.userSex }">
							<option value="1">男</option>
							<option value="0">女</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>学历：</dt>
				<dd>
				  <select class="combox required"   name="xltypeid"  sValue="${requestScope.u.xltypeid}">
	          		<option value="">--请选择学历类型--</option>
	          		<my:outOptions type="13"/>
	               </select>
				</dd>
			</dl>
			<dl>
				<dt>党员：</dt>
				<dd>
					<select class="combox required"   name="dytypeid" sValue="${requestScope.u.dytypeid}">
	          		<option value="">--请选择党员类型--</option>
	          		<my:outOptions type="20"/>
	               </select>
				</dd>
			</dl>
			<dl>
				<dt>手机号：</dt>
				<dd>
					<input type="text" name="mobilePhoneNumber"  class="digits"   minlength="11" maxlength="11" size="25" value="${requestScope.u.mobilePhoneNumber }"/>
				</dd>
			</dl>
			<dl>
				<dt>入职时间：</dt>
				<dd>
				 	<input type="text" class="required" readonly="readonly" onFocus="WdatePicker()" name="joindate" value="${requestScope.u.joindate }" /> 
 				</dd>
			</dl>
			<dl>
				<dt>职务：</dt>
				<dd>
					<select class="combox required"   name="zwtypeid" sValue="${requestScope.u.zwtypeid}">
	          		<option value="">--请选择职务类型--</option>
	          		<my:outOptions type="19"/>
	               </select>				</dd>
			</dl>
			<dl>
				<dt>部门：</dt>
				<dd>
					<a href="dept/lookUpPage.do" lookupGroup="dept" title="上级部门查询"><input type="text" readonly="readonly" size="25" toName="dept.name"  class="required" value="<my:outDeptName id="${requestScope.u.deptId }"/>" /></a><a class="btnLook" href="dept/lookUpPage.do" lookupGroup="dept" >查找带回</a>
					<input type="hidden" name="deptId" size="25" toName="dept.id" value="${requestScope.u.deptId }"/>
				</dd>
			</dl>
			
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="userDesc" cols="70" rows="2" maxlength="50"><c:out value="${requestScope.u.userDesc }" /></textarea>
				</dd>
			</dl>
			<dl>
				<dt>允许登录系统：</dt>
				<dd>
					<select class="combox required"  name="userStatus" sValue="${requestScope.u.userStatus }">
							<option value="1">允许</option>
							<option value="0">限制</option>
					</select>
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.u.id }"/>
			<input type="hidden" name="rel" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
	
</form>
</div>	
					
		

	

