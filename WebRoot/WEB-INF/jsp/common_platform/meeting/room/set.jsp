<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公共平台--会议设置
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="room/load.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 150px">
					<tr >
						<td>
							会议室：<input type="text" name="mrName" value="<c:out value="${param.mrName }" />"/>
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
			<my:validationAuthority url="room/addPage.do">
				<li><a class="add" href="room/addPage.do?rel=${param.rel }" target="dialog" width="800" height="400" rel="${param.rel}_add"><span>新增会议室</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="room/updatePage.do">
				<li><a class="edit" href="room/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="800" height="400" rel="${param.rel}_update" warn="请先选择一个会议室"><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="room/del.do">
				<li><a class="delete" href="room/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一条会议室"><span>批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="800" layoutH="114">
		<thead>
			<tr>
				<th align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th align="center">行号</th>
				<th align="center">编号</th>
				<th align="center">名称</th>
				<th align="center">容纳人数</th>
				<th align="center">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${values }" varStatus="status">
				
				<tr target="id" rel="${v.id }">
				
					<td ><input name="ids" value="${v.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title="${v.mrNo}"><c:out value="${v.mrNo }" /></td>
					
					<td title="${v.mrName }"><c:out value="${v.mrName }" /></td>
					
					<td title="${v.mrNum}"><c:out value="${v.mrNum}" /></td>
					<td title="${v.mrRemark}"><c:out value="${v.mrRemark}" /></td>
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>



	

