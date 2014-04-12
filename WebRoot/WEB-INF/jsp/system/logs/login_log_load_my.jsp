<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--系统日志--登录日志
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="log/login/my.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 50px">
					<tr >
						<td>
							登录ip：<input type="text" name="loginIp" value="<c:out value="${param.loginIp }" />"/>
						</td>
						<td>登录时间：
								<input type="text"  readonly="readonly" onFocus="WdatePicker()"  name="startDate" value="${param.startDate }" />
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
	<table class="table" width="1100" layoutH="87">
		<thead>
			<tr>
				<th width="28" align="center">行号</th>
				<th width="150" align="center" orderField="loginTime"  class="${fromParam.orderDirection}">登录时间</th>
				<th width="210" align="center">登录IP</th>
				<th  align="center">IP来源</th>
				<th width="200" align="center">日志</th>
	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${requestScope.logs }" varStatus="status">
				
				<tr >
					<td>${status.count }</td>
					<td >
						<fmt:formatDate value="${l.loginTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td >${l.loginIp}</td>
					<td title="${l.ipInfoCountry } ${l.ipInfoRegion } ${l.ipInfoCity } ${l.ipInfoIsp }">
						${l.ipInfoCountry }
						${l.ipInfoRegion }
						${l.ipInfoCity }
						${l.ipInfoIsp }
					</td>
						
					<td title="<c:out value="${l.loginType }" />"><c:out value="${l.loginType }" /></td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>



	

