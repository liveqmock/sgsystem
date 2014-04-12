<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公-内部邮件-草稿箱
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="email/loadDraft.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<input type="hidden" name="puGrouping" value="${param.peGrouping }"/>
			<div class="searchBar">
				<table class="searchContent" style="margin-left:50px">
					<tr >
						
						<td>
							标题：<input type="text" name="name"  value="<c:out value="${param.name }" />" />
						</td>
						
						<td>发送日期：
								<input type="text"  readonly="readonly" onFocus="WdatePicker()"  name="date1" value="${param.date1 }" />
								<span class="limit">-</span>
								<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="date2" value="${param.date2 }" />
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
			<my:validationAuthority url="email/deldraft.do">
				<li><a class="delete" href="email/deldraft.do" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一条信息"><span>批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th  align="center">标题</th>
				<th width="450" align="center">收件人</th>

				<th width="170" align="center">发送时间</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${values }" >
				
				<tr target="id" rel="${v.id }">
					<td ><input name="ids" value="${v.id }" type="checkbox"></td>
					<td title="${v.edName }">
					<a href="email/edit.do?id=${v.id}" target="navTab" rel="${param.rel}_find">
						<c:out value="${v.edName}" />
					</a>
					</td>
					<td title="<my:outTrueName id="${v.edInUid }"/>"><my:outTrueName id="${v.edInUid }"/></td>
				
					<td title="<fmt:formatDate value="${v.edDate}" pattern="yyyy-MM-dd HH:mm:ss" />"><fmt:formatDate value="${v.edDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value}, '${param.rel}')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination" rel="${param.rel}"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>

	</div>
	
</div>



	

