
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--菜单管理 --菜单图标查找带回
--%>

<div class="pageContent">
	<div class="pageFormContent" layoutH="58" style="padding-left: 20px;">
		
		<c:forEach var="i" items="${requestScope.icons }" >
			<a href="javascript:;" onclick="$.bringBack({url:'${i}'})" style="padding: 10px"><img src="<c:out value='${i}' />" /></a>
		</c:forEach>
		
		
	
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button">关闭</button></div></div></li>
		</ul>
	</div>
</div>
										
						
					
		

	

