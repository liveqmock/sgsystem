<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--日程安排
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}_gl');" action="schedule/query.do" method="post">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 20px">
					<tr >
						<td>
							主题：<input type="text" name="schTitle" value="<c:out value="${param.schTitle }" />"/>
						</td>
						<td>
							<select class="combox"   name="schType"  sValue="${param.schType}" >
								<option value="">全部类型</option>
								<my:outOptions type="6"/>
							</select>
						</td>
						<td>提醒时间：
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
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="schedule/addPage.do">
				<li><a class="add" href="schedule/addPage.do?rel=${param.rel }_gl" target="dialog" width="1000" height="550"  rel="${param.rel}_add" title="添加日程安排"><span>添加</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>	
			<my:validationAuthority url="schedule/updatePage.do">
				<li><a class="edit" href="schedule/updatePage.do?id={id}&rel=${param.rel}_gl" target="dialog" width="1000" height="550"  rel="${param.rel}_update" title="修改日程安排"><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="schedule/del.do">
				<li><a class="delete" href="schedule/del.do?rel=${param.rel}_gl" target="selectedTodo" rel="ids" title="确定要删除吗?" ><span>批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="155" rel="${param.rel}_gl">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="200" align="center">日程类型</th>
				<th  align="center">主题</th>
				<th width="170" align="center" orderField="startTime"  class="${fromParam.orderDirection}">开始时间</th>
				<th width="170" align="center" orderField="endTime"  class="${fromParam.orderDirection}">结束时间</th>
				<th width="170" align="center" orderField="warnTime"  class="${fromParam.orderDirection}">提醒时间</th>
	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.schs }" varStatus="status">
				
				<tr target="id" rel="${m.id }">
					
					<td ><input name="ids" value="${m.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td>
						<my:outSelectValue id="${m.schType }"/>
					</td>
					<td title="${m.schTitle }">
						<a  href="schedule/show.do?id=${m.id}" target="navTab"  rel="${param.rel}_show" title="日程安排详情">
						<c:out value="${m.schTitle }" />
					</td>
					
					<td >
						<fmt:formatDate value="${m.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td >
						<fmt:formatDate value="${m.endTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td >
						<fmt:formatDate value="${m.warnTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value}, '${param.rel}_gl')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
	
		<div class="pagination" rel="${param.rel}_gl"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>

	</div>
	
</div>	