<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--字典管理
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}');"  action="list/query.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<input type="hidden" name="listType" value="${param.listType }" />
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 150px">
					<tr >
						<td>
							字典值：<input type="text" name="listValue" value="<c:out value="${param.listValue }" />"/>
						</td>
						
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="list/addPage.do">
				<li><a class="add" href="list/addPage.do?rel=${param.rel }&listType=${param.listType}" target="dialog" width="750"  rel="${param.rel}_add"><span>新增</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="list/updatePage.do">	
				<li><a class="edit" href="list/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="750"  rel="${param.rel}_update" warn="请先选择一个字典值"><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="list/del.do">	
				<li><a class="delete" href="list/del.do?rel=${param.rel}" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一条字典值"><span>批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="800" layoutH="160" rel="${param.rel}">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				
				<th width="400"  align="center">字典值</th>
				<th  align="center">备注</th>
	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${requestScope.values }" varStatus="status">
				
				<tr target="id" rel="${v.id }">
					
					<td ><input name="ids" value="${v.id }" type="checkbox"></td>
					<td>${status.count }</td>
					
					<td title="${v.listValue }"><c:out value="${v.listValue }" /></td>
					
					<td title="${v.listDesc}"><c:out value="${v.listDesc}" /></td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab_div.jsp" %>
	
</div>