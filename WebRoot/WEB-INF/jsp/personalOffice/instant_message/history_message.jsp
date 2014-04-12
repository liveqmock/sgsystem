<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--即时消息--全部用户--查询用户
--%>
<div class="pageHeader" >
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}_history_message');" action="instantMessage/selectHistoryMessage.do" method="get">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input type="hidden" name="userId" value="${param.userId }"/>
		
	</form>
</div>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
	<div layoutH="82">
		<c:forEach var="m" items="${requestScope.msgs }" >
			
			<div style="margin-left: 5px;margin-top: 2px;margin-bottom: 2px;">
				
				<span style="color: blue;"><my:outTrueName id="${m.sendUid}"/>:</span>
					
			    <fmt:formatDate value="${m.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
				<my:validationAuthority url="instantMessage/add.do">
					<a href="instantMessage/addPage.do?userId=${param.userId }&rel=${param.rel}" target="navTab" rel="${param.rel}" title="回复消息">
					<img src="resource/images/reply.gif" alt="回复消息" title="回复消息" style="margin-top: 3px;"/></a>
				</my:validationAuthority>
			</div>	
			<div class="divider"></div>
				
			<div style="margin: 3px 10px 3px 10px;"><my:scriptEscape value="${m.messageContent}" /></div>	
				
			<div class="divider"></div>
				
		</c:forEach>
	</div>
	<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value}, '${param.rel }_history_message')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination" rel="${param.rel }_history_message"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>

	</div>
</div>					

