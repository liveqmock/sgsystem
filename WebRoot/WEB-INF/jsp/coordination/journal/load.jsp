
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：协同办公--日志管理
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="journal/load/my.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 150px">
					<tr >
						<td>
							主题：<input type="text" name="journalTitle" value="<c:out value="${param.journalTitle }" />"/>
						</td>
						<td>
							<select class="combox"   name="journalType"  sValue="${param.journalType}" >
								<option value="">全部类型</option>
								<my:outOptions type="5"/>
							</select>
						</td>
						<td>时间：
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
			<my:validationAuthority url="journal/addPage.do">
				<li><a class="add" href="journal/addPage.do?rel=${param.rel }" target="navTab" rel="${param.rel}_add"><span>新增</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="journal/updatePage.do">
				<li><a class="edit" href="journal/updatePage.do?id={id}&rel=${param.rel}" target="navTab" rel="${param.rel}_update" ><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="journal/del.do">
				<li><a class="delete" href="journal/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" ><span>批量删除</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			
			<my:validationAuthority url="journal/share.do">
				<li><a class="edit" href="journal/share.do?" target="navTab" rel="${param.rel}_gxrz" ><span>共享日志</span></a></li>
			</my:validationAuthority>
			
			
		</ul>
	</div>
	<table class="table" width="1000" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="170" align="center" orderField="journalTime"  class="${fromParam.orderDirection}">日期</th>
				<th width="140" align="center" >日志类型</th>
				<th  align="center">主题</th>
				
	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="j" items="${requestScope.journals }" varStatus="status">
				
				<tr target="id" rel="${j.id }">
					
					<td ><input name="ids" value="${j.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td ><fmt:formatDate value="${j.journalTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>
						<my:outSelectValue id="${j.journalType }"/>
					</td>
					<td title="<c:out value="${j.journalTitle }" />">
						<a href="journal/show.do?id=${j.id }" target="navTab" rel="${param.rel}_show"><c:out value="${j.journalTitle }" /></a>
					</td>
					
					
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>	
	

