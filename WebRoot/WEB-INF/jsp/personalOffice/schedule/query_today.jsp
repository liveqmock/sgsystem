<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--日程安排
--%>

<div class="pageContent" style="border:1px #B8D0D6 solid;">
	
	<table class="table" width="1100" layoutH="65" rel="${param.rel}">
		<thead>
			<tr>
				<th width="28" align="center">行号</th>
				<th width="200" align="center">日程类型</th>
				<th  align="center">主题</th>
				<th width="170" align="center" >开始时间</th>
				<th width="170" align="center" >结束时间</th>
				<th width="170" align="center" >提醒时间</th>
	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.schs }" varStatus="status">
				
				<tr >
					
					
					<td>${status.count }</td>
					<td>
						<my:outSelectValue id="${m.schType }"/>
					</td>
					<td title="${m.schTitle }">
						<a  href="schedule/show.do?id=${m.id}" target="navTab"  rel="${param.rel}_show" title="日程安排详情">
						<c:out value="${m.schTitle }" />
					</td>
					
					<td >
						<fmt:formatDate value="${m.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td >
						<fmt:formatDate value="${m.endTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td >
						<fmt:formatDate value="${m.warnTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
</div>	