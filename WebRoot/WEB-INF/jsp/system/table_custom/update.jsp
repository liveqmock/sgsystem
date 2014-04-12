<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--导出打印自定义管理--更新
--%>

					
<div class="pageContent" >					
<form method="post" action="tableCustom/update.do" class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap" style="padding-left:50px;"  layoutH="58">
			<dl>
				<dt>名称：</dt>
				<dd>
					<c:out value="${requestScope.tc.fieldTitle }" />
				</dd>
			</dl>
			<dl>
				<dt>顺序号：</dt>
				<dd>
					<input type="text" name="fieldSort" maxlength="3" class="required digits" min="1" max="999" size="25" value="${requestScope.tc.fieldSort }"/>
					<span class="info">用于打印，导出的排序，值越小越靠前(数值范围：1-999 整数)</span>
				</dd>
			</dl>
			<dl>
				<dt>别名：</dt>
				<dd>
					<input type="text" name="fieldAnotherTitle"   maxlength="20" size="25" value="<c:out value="${requestScope.tc.fieldAnotherTitle }" />"/>
					<span class="info">自定义的别名，如果不设置则显示默认名称</span>
				</dd>
			</dl>
			<dl>
				<dt>是否导出：</dt>
				<dd>
					<select class="combox"  name="isExport" sValue="${requestScope.tc.isExport }">
							<option value="1">是</option>
							<option value="0">否</option>
					</select>
				</dd>
			</dl>
			<dl>
				<dt>是否打印：</dt>
				<dd>
					<select class="combox"  name="isPrint" sValue="${requestScope.tc.isPrint }">
							<option value="1">是</option>
							<option value="0">否</option>
					</select>
				</dd>
			</dl>
			<%--<dl>
				<dt>是否显示：</dt>
				<dd>
					<select class="combox"  name="isShow" sValue="${requestScope.tc.isShow }">
							<option value="1">是</option>
							<option value="0">否</option>
					</select>
				</dd>
			</dl>
			--%>
			<input type="hidden" name="id" value="${requestScope.tc.id }"/>
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
					
		

	

