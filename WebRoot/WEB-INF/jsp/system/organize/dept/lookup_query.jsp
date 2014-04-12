<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构 -- 部门管理--查找带回(单选)
--%>
<div class="pageHeader" >
	<form id="pagerForm" onsubmit="return divSearch(this, 'dept_lookup_box');" action="dept/lookUp.do" method="get">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input type="hidden"  name="type" value="${param.type }"/>
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 200px">
				<tr >
					<td>
						部门名称：<input type="text" name="deptName" value="<c:out value="${param.deptName }" />"/>
					</td>
					
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
					
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent" >
	
	<table class="table" width="99%" layoutH="133" >
		<thead>
			<tr>
				<th align="center">部门名称</th>
				<th align="center">电话</th>
				
				<th width="10%" align="center">备注</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${depts }" >

				<tr>
					<td title="${m.deptName}">
						<a  href="javascript:$.bringBack({id:'${m.id }', name:'${m.deptName }'})" title="选择">
							<c:out value="${m.deptName}" />
						</a>
					</td>
					<td title="${m.deptPhone }"><c:out value="${m.deptPhone }" /></td>
					
					<td title="${m.deptDesc }"><c:out value="${m.deptDesc }" /></td>
					
					
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="dialogPageBreak({numPerPage:this.value}, 'dept_lookup_box')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination" rel="dept_lookup_box" targetType="dialog" totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>

	</div>
	
</div>					
	

	

