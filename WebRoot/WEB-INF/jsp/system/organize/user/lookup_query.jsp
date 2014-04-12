<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构 -- 用户管理--查找带回(单选)
--%>
<div class="pageHeader" >
	<form id="pagerForm" onsubmit="return divSearch(this, 'user_lookup_box');" action="user/lookUp.do" method="get">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input type="hidden"  name="deptId" value="${param.deptId }"/>
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 10px">
				<tr >
					<td >
						姓名：<input type="text" name="trueName" value="<c:out value="${param.trueName }" />"/>
					</td>
					<td><label style="width:40px">性别：</label>
						<select class="combox" name="userSex" sValue="${param.userSex }">
							<option value="">全部</option>
							<option value="1">男</option>
							<option value="0">女</option>
						</select>
					</td>
					
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
					<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent" >
	
	<table class="table" width="99%" layoutH="88" >
		<thead>
			<tr>
				<th width="220" align="center">部门</th>
				<th width="140" align="center">姓名</th>
				<th width="30" align="center">性别</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="u" items="${requestScope.users }" >
				
				<tr>
					<td title="<my:outDeptName id="${u.deptId }"/>"><my:outDeptName id="${u.deptId }"/></td>
					<td title="${u.trueName }">
						<a  href="javascript:$.bringBack({id:'${u.id }', zh:'${u.userName }',name:'${u.trueName }'})" title="选择">
							<c:out value="${u.trueName }" />
						</a>
					</td>
					<td>
						<c:choose><c:when test="${u.userSex==1}">男</c:when><c:otherwise>女</c:otherwise></c:choose>
					</td>
					
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<div class="panelBar">
		<div class="pages">
			<span>显示&nbsp;</span>
			<select class="combox"   name="numPerPage"  onchange="dialogPageBreak({numPerPage:this.value}, 'user_lookup_box')"  sValue="${requestScope.fromParam.numPerPage}" >
				<%@ include file="/WEB-INF/jsp/commons/page_select_nums.jsp" %>
			</select>
			<span>&nbsp;条&nbsp;&nbsp;共&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.pageCount }" default="0"/></font>&nbsp;页&nbsp;&nbsp;总计&nbsp;<font color="red"><c:out  value="${requestScope.fromParam.allCount }" default="0"/></font>&nbsp;条</span>
		</div>
		
		<div class="pagination" rel="user_lookup_box" targetType="dialog" totalCount="<c:out  value="${requestScope.fromParam.allCount }" default="0"/>" numPerPage="${requestScope.fromParam.numPerPage}" pageNumShown="${requestScope.fromParam.pageNumShown }" currentPage="${requestScope.fromParam.pageNum}"></div>

	</div>
	
</div>					
	

	

