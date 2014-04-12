<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--日程安排
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<my:validationAuthority url="schedule/queryToday.do">
						<li><a href="schedule/queryToday.do?rel=${param.rel }" target="ajax" rel="${param.rel }"><span>今日日程</span></a></li>
					</my:validationAuthority>
					<my:validationAuthority url="schedule/query.do">
						<li><a href="schedule/query.do?rel=${param.rel }" target="ajax" rel="${param.rel }_gl"><span>日程管理</span></a></li>
					</my:validationAuthority>
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<my:validationAuthority url="schedule/queryToday.do">
				<div id="${param.rel }" class="unitBox" >
						<%@ include file="/WEB-INF/jsp/personalOffice/schedule/query_today.jsp" %>
				</div>
			</my:validationAuthority>
			<my:validationAuthority url="schedule/query.do">
				<div id="${param.rel }_gl" class="unitBox" >
					<%@ include file="/WEB-INF/jsp/personalOffice/schedule/query.jsp" %>
				</div>
			</my:validationAuthority>
		</div>
		
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
		
	</div>
	
</div>
