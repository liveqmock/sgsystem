
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：协同办公--日志管理--共享日志查询
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="journal/share.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 50px">
					<tr >
						<td>
							用户：
							<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户查询">
								<input type="text" name="userName" value="${param.userName }"  readonly="readonly" size="20" toName="user.name"/>
							</a>
							<input type="hidden"  name="userId" class="clear_user" toName="user.id"  value="${param.userId }" />
						</td>
						<td>
							主题：<input type="text" name="journalTitle" value="<c:out value="${param.journalTitle }" />"/>
						</td>
						<td>
							<select class="combox"   name="journalType"  sValue="${param.journalType}" >
								<option value="">全部类型</option>
								<my:outOptions type="5"/>
							</select>
						</td>
						<td>时间：
								<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="startDate" value="${param.startDate }" />
								<span class="limit">-</span>
								<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="endDate" value="${param.endDate }" />
						</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset" resetClass="clear_user">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">

	<table class="table" width="1000" layoutH="87">
		<thead>
			<tr>
				<th width="28" align="center">行号</th>
				<th width="170" align="center" orderField="journalTime"  class="${fromParam.orderDirection}">日期</th>
				<th width="140" align="center" >日志类型</th>
				<th  align="center">主题</th>
				
	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="j" items="${requestScope.journals }" varStatus="status">
				
				<tr>
					<td>${status.count }</td>
					<td ><fmt:formatDate value="${j.journalTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>
						<my:outSelectValue id="${j.journalType }"/>
					</td>
					<td title="<c:out value="${j.journalTitle }" />">
						<a href="journal/show.do?id=${j.id }" target="navTab" rel="${param.rel}_show"><c:out value="${j.journalTitle }" /></a>
					</td>
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>	
	

