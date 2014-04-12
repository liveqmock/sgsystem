<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：社区服务--居民论坛 --发表新帖
--%>

<div class="pageContent" >
			
<form method="post" action="forum/addForum.do"  class="pageForm " onsubmit="return validateCallback(this,navTabAjaxDone)">
						
	<div class="pageFormContent nowrap"   layoutH="56">
			<dl>
				<dt>标题：</dt>
				<dd >
					<input type="text" name="subject" class="required"  maxlength="50"   size="45" />
					<label >&nbsp;&nbsp;&nbsp;置顶<input style="vertical-align:middle;" type="checkbox" name="isTop" value="1" /></label>
				</dd>
			</dl>
			
			<dl>
				<dt>内容：</dt>
				<dd>
					<textarea  name="content" cols="100" rows="15" class="editor" minlength="1" maxlength="65530"></textarea>
				</dd>
			</dl>

			<input type="hidden" name="navTabId" value="${param.rel}"/>
			<input type="hidden" name="callbackType" value="closeCurrent"/>
			
			
		
	</div>
		<div class="formBar">
			<ul style="float: left;margin-left: 30%;">
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">发布</button></div></div></li>
				<li><div class="button" ><div class="buttonContent"><button type="reset">清空</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	
</form>
</div>
										
						
					
		

	

