<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--即时消息--查看消息
--%>
<div class="pageContent">					
			
	<div   layoutH="2">
		<div style="margin-top: 10px;margin-left: 10px;">
			<c:choose>
				<c:when test="${param.type==1 }">
					<span style="font-weight: bold;">发件人:</span><my:outTrueName id="${requestScope.msg.sendUid}"/>
				</c:when>
				<c:otherwise>
					<span style="font-weight: bold;">收件人:</span><my:outTrueName id="${requestScope.msg.receiveUid}"/>
				</c:otherwise>
			</c:choose>
			<span style="font-weight: bold;">发送时间：</span><fmt:formatDate value="${requestScope.msg.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
			<my:validationAuthority url="instantMessage/add.do">
				<c:choose>
					<c:when test="${param.type==1 }">
						<a class="button" style="float: right;margin-right: 50px;" href="instantMessage/addPage.do?userId=${requestScope.msg.sendUid }&rel=${param.rel}" target="navTab"  rel="${param.rel}" title="回复消息"><span>回复</span></a>
					</c:when>
				</c:choose>
			</my:validationAuthority>
		</div>
		<div class="divider"></div>
		<div style="margin-left: 10px;margin-right: 10px;">
			<my:scriptEscape value="${requestScope.msg.messageContent}" />
		</div>
		
		
	</div>
	
</div>	
				