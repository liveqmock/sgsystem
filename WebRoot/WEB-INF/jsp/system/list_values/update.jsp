<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--字典值管理 --字典值更新
--%>

					
<div class="pageContent" >					
<form method="post" action="list/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="58">
			<dl style="margin-top: 10px;">
				<dt>类型：</dt>
				<dd>
					<select class="combox"  name="listType" sValue="${requestScope.lv.listType }">
							 <%@ include file="/WEB-INF/jsp/system/list_values/list.jsp" %>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>字典值：</dt>
				<dd>
					<input type="text" name="listValue" class="required" maxlength="50" size="25" value="<c:out value="${requestScope.lv.listValue }" />"/>
					
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="listDesc" cols="70" rows="2" maxlength="50"><c:out value="${requestScope.lv.listDesc }" /></textarea>
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.lv.id }"/>
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
					
		

	

