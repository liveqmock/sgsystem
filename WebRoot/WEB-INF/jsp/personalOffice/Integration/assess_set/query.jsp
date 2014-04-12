<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：考核项管理--显示
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return divSearch(this,'${param.rel}');" action="assess/assessQuery.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 150px">
					<tr >
						<td><input type="hidden" name="asGroup" value="${group}">
							考核项名称：<input type="text" name="asName" value="<c:out value="${param.asName }" />"/>
						</td>
						<td>
							状态：
						</td>
						<td>
						<select name="asStatus" class="combox"  sValue="${param.asStatus}">
									<option value="">--请选择--</option>
									<option value="1">启用</option>
									<option value="0">未启用</option>
							    </select>
						</td>
						<td>
							分值：<input type="text" name="asMinute" value="${param.asMinute }">
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
			<my:validationAuthority url="assess/assessAddPage.do">
				<li><a class="add" href="assess/assessAddPage.do?group=${group}&rel=${param.rel }" target="dialog" width="800" height="400" rel="${param.rel}_add"><span>新增考核项</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="assess/assessUpdatePage.do">
				<li><a class="edit" href="assess/assessUpdatePage.do?id={id}&rel=${param.rel}" target="dialog" width="800" height="400" rel="${param.rel}_update" warn="请先选择一个考核项"><span>修改考核项</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="assess/assessDel.do">
				<li><a class="delete" href="assess/assessDel.do?rel=${param.rel }" target="selectedTodo" rel="ids" title="确定要删除吗?" warn="至少选择一个考核项"><span>批量删除</span></a></li>
			</my:validationAuthority>
			<my:validationAuthority url="assess/assessStatus.do">
				<li><a class="delete" href="assess/assessStatus.do?status=1&rel=${param.rel }" target="selectedTodo" rel="ids" title="确定要修改成启用状态吗?" warn="至少选择一个考核项"><span>批量启用</span></a></li>
			</my:validationAuthority>
			<my:validationAuthority url="assess/assessStatus.do">
				<li><a class="delete" href="assess/assessStatus.do?status=0&rel=${param.rel }" target="selectedTodo" rel="ids" title="确定要修改成未启用状态吗?" warn="至少选择一个考核项"><span>批量未启用</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="990" layoutH="154" rel="${param.rel}">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="56" align="center" orderField="asStatus"  class="${fromParam.orderDirection}">状态</th>
				<th width="100" align="center" orderField="asName"  class="${fromParam.orderDirection}">考核项名称</th>
				<th width="28"  align="center" orderField="asMinute"  class="${fromParam.orderDirection}">分值</th>
				<th width="140" align="center">描述</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${values }" varStatus="status">
				
				<tr target="id" rel="${v.id }">
				<td ><input name="ids" value="${v.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td>
					
						<c:choose>
							<c:when test="${ v.asStatus=='1' }">
<%--								 <img src="resource/images/email_close.gif" alt="未读"  style="margin-top: 3px;"/>--%>
								启用
							</c:when>
							<c:otherwise>
<%--								<img src="resource/images/email_open.gif" alt="已读" style="margin-top: 3px;"/>--%>
								未启用
							</c:otherwise>
						</c:choose>
					
					</td>
					<td title="<c:out value="${v.asName }" />"><c:out value="${v.asName }" /></td>
					
					<td title="<c:out value="${v.asMinute }" />"><c:out value="${v.asMinute }" /></td>
					
					<td title="<c:out value="${v.asRemark }" />"><c:out value="${v.asRemark}" /></td>
					
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



	

