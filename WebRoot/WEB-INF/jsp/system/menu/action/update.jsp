<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--菜单管理--action管理	更新action
--%>

					
<div class="pageContent" >					
<form method="post" action="menu/action/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap" style="padding-left:50px;"  layoutH="58">
			
			<dl>
				<dt>操作序号：</dt>
				<dd>
					<input type="text" name="actionSort" maxlength="3" class="required digits" min="1" max="999" size="25" value="${requestScope.act.actionSort}"/>
					<span class="info">用一菜单下排序展示，值越小越靠前(数值范围：1-999 整数)</span>
				</dd>
			</dl>	
			<dl>
				<dt>操作名称：</dt>
				<dd>
					<input type="text" name="actionName" value="<c:out value="${requestScope.act.actionName }" />"  class="required" maxlength="50" size="25"/>
				</dd>
			</dl>
			<dl>
				<dt>url：</dt>
				<dd>
					
					<textarea  name="actionUrl" cols="80" rows="3" maxlength="500" class="required" ><c:out value="${requestScope.act.actionUrl }" /></textarea>
					<span class="info">操作请求，如果此操作里面还需要发送其他请求，以,隔开</span>
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.act.id }"/>
			<input type="hidden" name="menuId" value="${requestScope.act.menuId }"/>
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
					
		

	

