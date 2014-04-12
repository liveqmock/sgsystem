<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--地区管理--更新
--%>

					
<div class="pageContent" >					
<form method="post" action="district/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap"  layoutH="58">
			<dl style="margin-top: 10px;">
				<dt>序号：</dt>
				<dd>
					<input type="text" name="disSort" maxlength="4" class="required digits" min="1" max="9999" size="25" value="${requestScope.d.disSort }"/>
					<span class="info">用于同级下排序，值越小越靠前(数值范围：1-9999 整数)</span>
				</dd>
			</dl>
			<dl>
				<dt>名称：</dt>
				<dd>
					<input type="text" name="disName" class="required" maxlength="50" size="25" value="<c:out value="${requestScope.d.disName }" />"/>
					
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="disDesc" cols="70" rows="2" maxlength="50"><c:out value="${requestScope.d.disDesc }" /></textarea>
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.d.id }"/>
			<input type="hidden" name="superId" value="${requestScope.d.superId }"/>
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
					
		

	

