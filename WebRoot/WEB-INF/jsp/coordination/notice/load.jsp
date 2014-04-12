<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：协同办公--通知管理
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="notice/load.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 50px">
					<tr >
						<td>
							标题：<input type="text" name="noticeTitle" value="<c:out value="${param.noticeTitle }" />"/>
						</td>
						<td>
							<select class="combox"   name="noticeType"  sValue="${param.noticeType}" >
								<option value="">全部类型</option>
								<my:outOptions type="1"/>
							</select>
						</td>
						<td>发布时间：
								<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="startDate" value="${param.startDate }" />
								<span class="limit">-</span>
								<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="endDate" value="${param.endDate }" />
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
			<my:validationAuthority url="notice/addPage.do">
				<li><a class="add" href="notice/addPage.do?rel=${param.rel }" target="navTab" rel="${param.rel}_add"><span>新增</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="notice/updatePage.do">
				<li><a class="edit" href="notice/updatePage.do?id={id}&rel=${param.rel}" target="navTab" rel="${param.rel}_update" ><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="notice/del.do">
				<li><a class="delete" href="notice/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" ><span>批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="170"  align="center">通知类型</th>
				<th  align="center">标题</th>
				<th width="140"  align="center">发送人</th>
				<th width="150"  align="center" orderField="noticeCreateTime"  class="${fromParam.orderDirection}">发送时间</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.notices }" varStatus="status">
				
				<tr target="id" rel="${m.id }">
				
					<td ><input name="ids" value="${m.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td>
						<my:outSelectValue id="${m.noticeType }"/>
					</td>
					<td title="<c:out value="${m.noticeTitle }" />">
						<a href="notice/show.do?id=${m.id }" target="navTab" rel="${param.rel}_show"><c:out value="${m.noticeTitle }" /></a>
					</td>
					<td ><my:outTrueName id="${m.noticeSendId }"/></td>
					<td >
						<fmt:formatDate value="${m.noticeCreateTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>