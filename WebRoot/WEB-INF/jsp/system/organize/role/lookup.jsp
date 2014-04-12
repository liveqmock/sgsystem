<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构 -- 角色管理--查找带回(单选)
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
		</div>
	</form>
</div>
<div class="pageContent" >
	
	<table class="table" width="99%" layoutH="88" >
		<thead>
			<tr>
				<th  align="center">角色名称</th>
				<th  align="center">说明</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${roles }" >
				
				<tr>
					<td title="${r.roleName }">
						<a  href="javascript:$.bringBack({id:'${r.id }', name:'${r.roleName }'})" title="选择">
							<c:out value="${r.roleName }" />
						</a>
					</td>
					
					<td title="${r.roleDesc}"><c:out value="${r.roleDesc}" /></td>
					
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_dialog.jsp" %>
	
</div>					
	

	

