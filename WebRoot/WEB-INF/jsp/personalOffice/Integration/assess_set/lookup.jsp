<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构 -- 角色管理--查找带回(单选)
--%>
<div class="pageHeader" >
	<form id="pagerForm" onsubmit="return dialogSearch(this);" action="assess/lookUpPage.do" method="get">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input type="hidden"  name="asGroup" value="${param.asGroup }"/>
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 200px">
				<tr >
					<td>
						打分项名称：<input type="text" name="asName" value="<c:out value="${param.asName }" />"/>
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
				
				<th width="28" align="center">行号</th>
				<th width="100" align="center" >考核项名称</th>
				<th width="28"  align="center" >分值</th>
				<th width="140" align="center">描述</th>
				<th width="60" align="center">带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${value }"  varStatus="status">
				
				<tr>
					
					<td>${status.count }</td>
				
					<td title="<c:out value="${v.asName }" />"><c:out value="${v.asName }" /></td>
					
					<td title="<c:out value="${v.asMinute }" />"><c:out value="${v.asMinute }" /></td>
					
					<td title="<c:out value="${v.asRemark }" />"><c:out value="${v.asRemark}" /></td>
					<td>
						<a class="btnSelect" href="javascript:$.bringBack({id:'${v.id }', name:'${v.asName }',minute:'${v.asMinute }'})" title="查找带回">选择</a>
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_dialog.jsp" %>
	
</div>					
	

	

