<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：系统管理--系统日志--登录日志
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);"
		action="log/login.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp"%>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 100px">
					<tr>
						<td>用户： <a href="user/lookUpPage.do?type=1"
							lookupGroup="user" title="用户查询"> <input type="text"
								name="userName" value="${param.userName }" readonly="readonly"
								size="20" toName="user.name" /> </a> <input type="hidden"
							name="userId" class="clear_user" toName="user.id"
							value="${param.userId }" />
						</td>


						<td>登录ip：<input type="text" name="loginIp"
							value="<c:out value="${param.loginIp }" />" />
						</td>
						<td>登录时间： <input type="text" readonly="readonly"
							onFocus="WdatePicker()" name="startDate"
							value="${param.startDate }" /> <span class="limit">-</span> <input
							type="text" readonly="readonly" onFocus="WdatePicker()"
							name="endDate" value="${param.endDate }" />
						</td>

						<td><div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">查询</button>
								</div>
							</div></td>
						<td><div class="button">
								<div class="buttonContent">
									<button type="button" formreset="reset" resetClass="clear_user">重置</button>
								</div>
							</div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="log/login/del.do">
				<li><a class="delete" href="log/login/del.do"
					target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一条信息"><span>批量删除</span>
				</a></li>
			</my:validationAuthority>

			<my:validationAuthority url="log/export.do">
				<li><a class="icon" href="log/export.do" target="dwzExport"
					targetType="navTab" title="确实要导出这些记录吗?"><span>导出EXCEL</span> </a></li>
				<li class="line">line</li>
			</my:validationAuthority>
			<my:validationAuthority url="log/print.do">
				<li><a class="icon" href="log/print.do" target="dwzExport"
					targetType="navTab" ><span>打印</span>
				</a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox"
					group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="210" align="center">用户名</th>
				<th width="150" align="center" orderField="loginTime"
					class="${fromParam.orderDirection}">登录时间</th>
				<th width="210" align="center">登录IP</th>
				<th align="center">IP来源</th>
				<th width="200" align="center">日志</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${requestScope.logs }" varStatus="status">

				<tr target="user_id" rel="${l.id }">
					<td><input name="ids" value="${l.id }" type="checkbox">
					</td>
					<td>${status.count }</td>
					<td><my:outTrueName id="${l.userId }" /></td>
					<td><fmt:formatDate value="${l.loginTime }"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td>${l.loginIp}</td>
					<td
						title="${l.ipInfoCountry } ${l.ipInfoRegion } ${l.ipInfoCity } ${l.ipInfoIsp }">
						${l.ipInfoCountry } ${l.ipInfoRegion } ${l.ipInfoCity }
						${l.ipInfoIsp }</td>

					<td title="<c:out value="${l.loginType }" />"><c:out
							value="${l.loginType }" /></td>

				</tr>

			</c:forEach>

		</tbody>
	</table>

	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp"%>

</div>





