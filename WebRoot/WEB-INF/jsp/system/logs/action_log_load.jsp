<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--系统日志--重要操作日志
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="log/action.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 100px">
					<tr >
						<td>用户：
							<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户查询" width="1000" height="550">
								<input type="text" name="userName" value="${param.userName }"  readonly="readonly" size="20" toName="user.trueName"/>
							</a>
							<input type="hidden"  name="userId" class="clear_user" toName="user.id"  value="${param.userId }" />
						</td>
						<td>
							登录ip：<input type="text" name="loginIp" value="<c:out value="${param.loginIp }" />"/>
						</td>
						<td>登录时间：
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
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="log/action/del.do">
				<li><a class="delete" href="log/action/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一条信息"><span> 批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="210" align="center">用户名</th>
				<th width="130" align="center">登录IP</th>
				<th width="200" align="center">IP来源</th>
				<th width="150" align="center" orderField="actionTime"  class="${fromParam.orderDirection}">操作时间</th>
				<th width="140" align="center">操作内容</th>
				<th align="center">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${requestScope.logs }" varStatus="status">
				
				<tr target="id" rel="${l.id }">
					<td><input name="ids" value="${l.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td ><my:outTrueName id="${l.userId }"/></td>
					<td title="${l.actionIp}">${l.actionIp}</td>
					<td title="${l.actionIpInfo }">${l.actionIpInfo }</td>
					<td >
						<fmt:formatDate value="${l.actionTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td ><c:out value="${l.actionContent }" /></td>
					<td title="<c:out value="${l.actionDesc }" />"><c:out value="${l.actionDesc }" /></td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>



	

