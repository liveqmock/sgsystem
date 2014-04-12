<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-通讯录-个人通讯录-分组设置
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="group/load.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 150px">
					<tr >
						<td>
							名称：<input type="text" name="grName" value="<c:out value="${param.grName }" />"/>
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
			<my:validationAuthority url="group/addPage.do">
				<li><a class="add" href="group/addPage.do?rel=${param.rel }" target="dialog" width="800" height="400" rel="${param.rel}_add"><span>新增分组</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="group/updatePage.do">
				<li><a class="edit" href="group/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="800" height="400" rel="${param.rel}_update" warn="请先选择一个分组"><span>修改分组</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="group/del.do">
				<li><a class="delete" href="group/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一条分组"><span>批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1000" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="150" align="center">编号</th>
				<th width="350" align="center">名称</th>
				<th  align="center">说明</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${values }" varStatus="status">
				
				<tr target="id" rel="${v.id }">
				
					<td ><input name="ids" value="${v.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td ><c:out value="${v.grNo }" /></td>
					
					<td title="<c:out value="${v.grName }" />"><c:out value="${v.grName }" /></td>
					
					<td title="<c:out value="${v.grName }" />"><c:out value="${v.grRemark}" /></td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>



	

