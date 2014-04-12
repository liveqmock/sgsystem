<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构--角色管理
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="role/load.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 150px">
					<tr >
						<td>
							角色名称：<input type="text" name="roleName" value="<c:out value="${param.roleName }" />"/>
						</td>
						
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="role/addPage.do">
				<li><a class="add" href="role/addPage.do?rel=${param.rel }" target="dialog" width="750"  rel="${param.rel}_add"><span>新增</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="role/updatePage.do">
				<li><a class="edit" href="role/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="750" rel="${param.rel}_update" warn="请先选择一个角色"><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="role/del.do">
				<li><a class="delete" href="role/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一个角色"><span>批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="300" align="center">角色名称</th>
				<th  align="center">说明</th>
				<th width="220" align="center">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${requestScope.roles }"  varStatus="status">
				
				<tr target="id" rel="${r.id }" >
				
					<td ><input name="ids" value="${r.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title="${r.roleName }"><c:out value="${r.roleName }" /></td>
					
					<td title="${r.roleDesc}"><c:out value="${r.roleDesc}" /></td>
					<td>
						<my:validationAuthority url="role/power/updatePage.do">
							<a href="role/power/updatePage.do?id=${r.id }" target="navTab"  rel="${param.rel}_roleaction" title="<c:out value="${r.roleName }" />_查看权限">查看权限</a>
							|
						</my:validationAuthority>
						<my:validationAuthority url="role/queryRoleUsers.do">
							<a href="role/queryRoleUsers.do?roleId=${r.id}&rel=${param.rel}_fpgl" target="navTab"  rel="${param.rel}_fpgl" title="<c:out value="${r.roleName }" />_查看用户">查看用户</a>
							|
						</my:validationAuthority>
						<my:validationAuthority url="role/queryUsers.do">
							<a href="role/queryUsers.do?roleId=${r.id}&rel=${param.rel}_fpjs" target="navTab"  rel="${param.rel}_fpjs" title="<c:out value="${r.roleName }" />_分配用户">分配用户</a>
							
						</my:validationAuthority>
						
					</td>
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>



	

