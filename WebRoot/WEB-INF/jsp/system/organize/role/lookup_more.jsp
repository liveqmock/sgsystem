<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构 -- 角色管理--查找带回(多选)
--%>
<div class="pageHeader" >
	<form id="pagerForm" onsubmit="return dialogSearch(this);" action="role/lookUpPage.do" method="get">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input type="hidden"  name="type" value="${param.type }"/>
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 200px">
				<tr >
					<td>
						角色名称：<input type="text" name="roleName" value="<c:out value="${param.roleName }" />"/>
					</td>
					
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
					<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
				</tr>
			</table>
			<div class="subBar">
				<ul>
					<li>
						<div class="button" ><div class="buttonContent"><button type="button" multLookup="ids" warn="请先选择用户">覆盖选择</button></div></div>
						<div class="button" style="margin-left: 5px;"><div class="buttonContent"><button type="button" appendMultLookup="ids" warn="请先选择用户">追加选择</button></div></div>
						
					</li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent" >
	
	<table class="table" width="99%" layoutH="88" >
		<thead>
			<tr>
				<th  align="center">角色名称</th>
				<th  align="center">说明</th>
				<th width="30" align="center" ><input type="checkbox" group="ids" class="checkboxCtrl"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${roles }" >
				<tr>
					<td title="${r.roleName }"><c:out value="${r.roleName }" /></td>
					<td title="${r.roleDesc}"><c:out value="${r.roleDesc}" /></td>
					<td title="角色：${r.roleName }"><input name="ids"  type="checkbox" value="{id:'${r.id }', name:'${r.roleName }'}"/></td>
					
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_dialog.jsp" %>
	
</div>					
	

	

