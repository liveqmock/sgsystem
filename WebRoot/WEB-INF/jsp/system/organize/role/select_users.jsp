<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--角色管理--分配角色
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="role/queryUsers.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<input type="hidden" name="roleId" value="${param.roleId }"/>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 100px">
					<tr >
						<td>
							部门：
							<a href="dept/lookUpPage.do?type=3" lookupGroup="dept" title="部门查询"><input type="text" readonly="readonly" name="deptName" size="25" toName="dept.name" value="${param.deptName }" class="required"/></a>
							<input type="hidden" name="deptId" size="25" toName="dept.id"  value="${param.deptId }"/>
						</td>
						<td>
							用户名：<input type="text" name="userName" value="<c:out value="${param.userName }" />"/>
						</td>
						<td >
							姓名：<input type="text" name="trueName" value="<c:out value="${param.trueName }" />"/>
						</td>
						<td><label style="width:40px">性别：</label>
							<select class="combox" name="userSex" sValue="${param.userSex }">
								<option value="">全部</option>
								<option value="1">男</option>
								<option value="0">女</option>
							</select>
						</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="role/roleAddUsers.do?roleId=${param.roleId }&navTabId=${param.rel}" target="selectedTodo" rel="ids"  warn="至少选择一个用户"><span>批量分配</span></a></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center" ><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th  align="center">部门</th>
				<th  align="center">用户名</th>
				<th align="center">姓名</th>
				<th width="30" align="center">性别</th>
				<th width="80" align="center">账号状态</th>
				
	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.users }" varStatus="status">
				
				<tr target="id" rel="${m.id }">
					<c:choose>
						<c:when test="${empty m.roleId}">
							<td title="用户名：${m.userName }"><input name="ids" value="${m.id }" type="checkbox" /></td>
						</c:when>
						<c:otherwise>
							<td title="已分配"><input   type="checkbox"  checked="checked" disabled="disabled" /></td>
						</c:otherwise>
					</c:choose>
					<td>${status.count }</td>
					<td title="<my:outDeptName id="${m.deptId }" />"><my:outDeptName id="${m.deptId }" /></td>
					<td title="${m.userName }"><c:out value="${m.userName }" /></td>
					<td title="${m.trueName }"><c:out value="${m.trueName }" /></td>
					<td>
						<c:choose><c:when test="${m.sex==1}">男</c:when><c:otherwise>女</c:otherwise></c:choose>
					</td>
					<td >
						<c:choose><c:when test="${m.status==1}">正常</c:when><c:otherwise>禁用</c:otherwise></c:choose>
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>



	

