<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：积分详情
--%>

<div class="pageContent">
	
	<table class="table" width="1165" layoutH="52"   >
		<thead>
			<tr>
				<th width="28" align="center">行号</th>
				<th width="100" align="center" >员工姓名</th>
				<th width="100" align="center">总积分</th>
				<th width="50"  align="center">打分月份</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${value }" varStatus="status">
				
				<tr target="id" rel="${v.id }">
				
					<td>${status.count }</td>
					<td title="<my:outTrueName id="${v.smStaff }"/>">
					<a href="scoringMonth/detail.do?id=${v.id }" target="navTab"  rel="${param.rel}_detail">
					<my:outTrueName id="${v.smStaff }"/>
					</a>
					</td>
					
					<td title="<c:out value="${v.smMinute }" />"><c:out value="${v.smMinute }" /></td>
					
					<td title="<c:out value="${v.smYear }年${v.smDate}月" />"><c:out value="${v.smYear }年${v.smDate}月" /></td>
					
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
		<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="navTabPageBreak({numPerPage:this.value})"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination"  totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>
	
	</div>
	
</div>



	

