<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：人事管理--人员管理
--%>
<div class="pageContent" style="padding: 1px">
		<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul><my:validationAuthority url="scoringMonth/queryRank.do">
					<li><a href="scoringMonth/queryRank.do?rel=${param.rel }" target="ajax" rel="${param.rel }_an"><span>月积分排名</span></a></li>
					</my:validationAuthority>
					<my:validationAuthority url="scoringMonth/queryRankYear.do">
					<li><a href="scoringMonth/queryRankYear.do?rel=${param.rel }" target="ajax" rel="${param.rel }_un"><span>年积分排名</span></a></li>
					</my:validationAuthority>
					
				</ul>
			</div>
		</div>
		
			
		<div class="tabsContent">
			<my:validationAuthority url="scoringMonth/queryRank.do">
			<div id="${param.rel }_an" class="unitBox">
				
				<%@ include file="/WEB-INF/jsp/personalOffice/Integration/scoring/rank/query.jsp" %>
			
			</div>
			</my:validationAuthority>
			<my:validationAuthority url="scoringMonth/queryRankYear.do">
			<div id="${param.rel }_un" class="unitBox">
				
				<%@ include file="/WEB-INF/jsp/personalOffice/Integration/scoring/rank/queryYear.jsp" %>
			
			</div>
			</my:validationAuthority>
			
		</div>
		
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
		
	</div>
	
</div>


