<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人文档管理：修改文件
--%>

<div class="pageContent" >					
<form method="post" action="personalFiles/update.do" enctype="multipart/form-data"   class="pageForm required-validate" onsubmit="return iframeCallback(this,dialogAjaxDone)">
						
	<div class="pageFormContent nowrap" style="padding-left:50px;"  layoutH="58">
			<dl style="margin-top: 20px;">
				<dt>文件名：</dt>
				<dd>
					<input type="text" name="wdName"  maxlength="50" class="required"  size="25" value="<c:out value="${requestScope.f.wdName}" />"/>
					
				</dd>
			</dl>
			<dl>
				<dt>文件：</dt>
				<dd >
					<div align="left"><input type="file" fileupload="no" name="file"  /></div>
					<span class="info">不选择文件则不修改附件，如果选择，将会覆盖原文件！</span>
				</dd>
			</dl>
			<dl>
				<dt>备注：</dt>
				<dd>
					<textarea  name="wdDesc" cols="70" rows="2" maxlength="50"><c:out value="${requestScope.f.wdDesc}" /></textarea>
				</dd>
			</dl>
			<input type="hidden" name="id" value="${requestScope.f.id }"/>
			<input type="hidden" name="${param.reType }" value="${param.rel }"/>
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
										
						
					
		

	

