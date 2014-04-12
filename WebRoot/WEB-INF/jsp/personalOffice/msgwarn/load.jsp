<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--消息提醒
--%>
<div class="pageContent" style="padding:1px">

	<div class="tabs">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<my:validationAuthority url="msgwarn/load/notread.do">
						<li><a href="msgwarn/load/notread.do?rel=${param.rel }" target="ajax" rel="${param.rel }_notread"><span>未读</span></a></li>
					</my:validationAuthority>
					<my:validationAuthority url="msgwarn/load/isread.do">
						<li><a href="msgwarn/load/isread.do?rel=${param.rel }" target="ajax" rel="${param.rel }_isread"><span>已读</span></a></li>
					</my:validationAuthority>
				</ul>
			</div>
		</div>
		<div class="tabsContent">
			<my:validationAuthority url="msgwarn/load/notread.do">
				<div id="${param.rel }_notread" class="unitBox">
					
					<%@ include file="/WEB-INF/jsp/personalOffice/msgwarn/query_notread.jsp" %>
				
				</div>
			</my:validationAuthority>
			<my:validationAuthority url="msgwarn/load/isread.do">
				<div id="${param.rel }_isread" class="unitBox">
					
					<%@ include file="/WEB-INF/jsp/personalOffice/msgwarn/query_isread.jsp" %>
				
				</div>
			</my:validationAuthority>
			
			
		</div>
		
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
		
	</div>
	
</div>