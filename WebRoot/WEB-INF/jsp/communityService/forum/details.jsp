<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：社区服务--居民论坛--帖子详情查看
--%>

<div class="pageContent" layoutH="2">
	
			<div class="div_titlebold" ><c:out value="${requestScope.tbforum.subject}" /></div>
			<div class="div_sendUser">发布人：<my:outTrueName id="${tbforum.username }"/>&nbsp;&nbsp;<fmt:formatDate value="${requestScope.tbforum.publishTime }" pattern="yyyy-MM-dd HH:mm:ss" />	</div>	
			<div class="divider"></div>
				
			<div style="margin:10px;" >
				<my:scriptEscape value="${requestScope.tbforum.content}"/>
			</div>
		
</div>
										
						
	