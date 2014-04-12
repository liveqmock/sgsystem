<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：协同办公--日志管理--详情
--%>

<div class="pageContent" >
						
	<div class="pageFormContent nowrap"   layoutH="56">
			<dl>
				<dt>日期：</dt>
				<dd>
					<fmt:formatDate value="${requestScope.j.journalTime }" pattern="yyyy-MM-dd HH:mm:ss" />
				</dd>
			</dl>
			<dl>
				<dt>日志类型：</dt>
				<dd>
					<my:outSelectValue id="${j.journalType }"/>
				</dd>
			</dl>
			<dl>
				<dt>主题：</dt>
				<dd >
					<c:out value="${requestScope.j.journalTitle }" />
				</dd>
			</dl>
			
			<div class="divider"></div>
			
			<div style="margin-left: 20px;"><my:scriptEscape value="${requestScope.j.journalContent }" /></div>
				


	</div>
		
</div>
										
						
	