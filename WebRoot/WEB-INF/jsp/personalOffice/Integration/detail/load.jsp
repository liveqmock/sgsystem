<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：人事管理--人员管理
--%>
<div class="pageContent" style="padding: 1px">
		<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul><my:validationAuthority url="detail/query.do">
					<li><a href="detail/query.do?rel=${param.rel }" target="ajax" rel="${param.rel }_un"><span>未审核</span></a></li>
					</my:validationAuthority>
					<my:validationAuthority url="detail/queryCH.do">
					<li><a href="detail/queryCH.do?rel=${param.rel }" target="ajax" rel="${param.rel }_an"><span>已审核</span></a></li>
					</my:validationAuthority>
					
				</ul>
			</div>
		</div>
		
			
		<div class="tabsContent">
			<my:validationAuthority url="detail/query.do">
			<div id="${param.rel }_un" class="unitBox">
				
				<%@ include file="/WEB-INF/jsp/personalOffice/Integration/detail/query.jsp" %>
			
			</div>
			</my:validationAuthority>
			<my:validationAuthority url="detail/queryCH.do">
			<div id="${param.rel }_an" class="unitBox">
				
				<%@ include file="/WEB-INF/jsp/personalOffice/Integration/detail/queryCH.jsp" %>
			
			</div>
			</my:validationAuthority>
			
		</div>
		
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
		
	</div>
	
</div>


