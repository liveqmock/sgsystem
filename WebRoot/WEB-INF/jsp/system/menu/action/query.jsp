<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--菜单管理--action管理	查询
--%>
<div class="pageHeader" style="border:1px #B8D0D6 solid;" >
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}_action_box');" action="menu/action/query.do" method="get">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		
		<input type="hidden" name="menuId" value="${param.menuId }" />
		<input type="hidden" name="menuName" value="${param.menuName }" />
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 50px">
				<tr >
					<td>
						所属菜单：[&nbsp;<span style="color: red"><my:coded str='${param.menuName }'/></span>&nbsp;]
					</td>
					<td>
						名称：<input type="text" name="actionName" value="<c:out value="${param.actionName }" />"/>
					</td>
					<td >
						url：<input type="text" name="actionUrl" value="<c:out value="${param.actionUrl }" />"/>
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
					<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
	<div class="panelBar">
		 <ul class="toolBar">
	 			<li><a class="add" href="menu/action/addPage.do?id=${param.menuId}&rel=${param.rel}_action_box" target="dialog" width="800" height="300" rel="${param.rel}_add" title="为菜单 [<my:coded str='${param.menuName }'/>] 添加操作"><span>添加</span></a></li>
				<li class="line">|</li>
			
				<li><a class="edit" href="menu/action/updatePage.do?id={id}&rel=${param.rel}_action_box" target="dialog" width="800" height="300" rel="${param.rel}_update" warn="请先选择一个操作" ><span>修改</span></a></li>
				<li class="line">|</li>
				<li><a class="delete" href="menu/action/del.do?rel=${param.rel}_action_box" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一个用户"><span>删除</span></a></li>
			</ul>
		</div>
	<table class="table" width="850" layoutH="160" rel="${param.rel}_action_box">
		<thead>
			<tr>
				<th width="27" align="center" ><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="70"  align="center" orderField="actionSort"  class="${requestScope.fromParam.orderDirection}">操作序号</th>
				<th width="140" align="center">操作名称</th>
				<th   align="center">url</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="a" items="${requestScope.actions }" >
				
				<tr target="id" rel="${a.id }">
					<td title="操作名称：${a.actionName}&#10操作 url：${a.actionUrl }"><input name="ids" value="${a.id }" type="checkbox"></td>
					<td ><c:out value="${a.actionSort}" /></td>
					<td title="${a.actionName}"><c:out value="${a.actionName}" /></td>
					<td title="${a.actionUrl }"><c:out value="${a.actionUrl }" /></td>
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value}, '${param.rel}_action_box')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination" rel="${param.rel}_action_box"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>
	
	</div>
</div>					

