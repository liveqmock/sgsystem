<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：个人办公--人员评分
--%>
<div class="pageContent" style="padding: 1px">
		<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul><my:validationAuthority url="scoringMonth/query.do">
					<li><a href="scoringMonth/query.do?rel=${param.rel }_month&type=${type}" target="ajax" rel="${param.rel }_month"><span>月度积分排名</span></a></li>
					</my:validationAuthority>
					<my:validationAuthority url="scoringYear/query.do">
					<li><a href="scoringYear/query.do?rel=${param.rel }_years&type=${type}" target="ajax" rel="${param.rel }_years"><span>年度积分排名</span></a></li>
					</my:validationAuthority>
				
				</ul>
			</div>
		</div>
		
			
		<div class="tabsContent">
			<my:validationAuthority url="scoringMonth/query.do">
			<div id="${param.rel }_month" class="unitBox">
				
				<%@ include file="/WEB-INF/jsp/personalOffice/Integration/scoring/query.jsp" %>
			
			</div>
			</my:validationAuthority>
			<my:validationAuthority url="scoringYear/query.do">
			<div id="${param.rel }_years" class="unitBox">
				
				<%@ include file="/WEB-INF/jsp/personalOffice/Integration/scoring/year/query.jsp" %>
			
			</div>
			</my:validationAuthority>
			
		</div>
		
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
		
	</div>
	
</div>


