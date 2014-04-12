<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--角色管理--更新角色
--%>

					
<div class="pageContent" >	
				
<form method="post" action="role/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="58">
			
			<dl style="margin-top: 10px;">
				<dt>角色名称：</dt>
				<dd>
					<input type="text" name="roleName" class="required" minlength="2" maxlength="20" size="25" value="<c:out value="${requestScope.r.roleName }" />"/>
					
				</dd>
			</dl>
			<dl>
				<dt>说明：</dt>
				<dd>
					<textarea  name="roleDesc" cols="70" rows="2" maxlength="255"><c:out value="${requestScope.r.roleDesc }" /></textarea>
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.r.id }"/>
			<input type="hidden" name="navTabId" value="${param.rel}"/>
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
					
		

	

