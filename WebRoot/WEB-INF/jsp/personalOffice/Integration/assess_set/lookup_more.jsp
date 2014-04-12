<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构 -- 角色管理--查找带回
--%>

<div class="pageContent" style=" border: solid 1px #CCC; ">
	
	<table class="table"  width="650px" layoutH="29" >
		<thead>
			<tr>
			
				<th width="30" align="center" ><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="280" align="center" >考核项名称</th>
				<th width="28"  align="center" >分值</th>
				<th width="440" align="center">描述</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${value }" varStatus="status" >
				
				<tr>
			
				
					<td >
						<input name="ids"  type="checkbox" value="{id:'${v.id }', name:'${v.asName }',minute:'${v.asMinute }'}" /></td>
					</td>
					<td title="<c:out value="${v.asName }" />"><c:out value="${v.asName }" /></td>
					
					<td title="<c:out value="${v.asMinute }" />"><c:out value="${v.asMinute }" /></td>
					
					<td title="<c:out value="${v.asRemark }" />"><c:out value="${v.asRemark}" /></td>
					
					
				</tr>
				
			</c:forEach>
					
			
					
			
		</tbody>
	</table>
	
	
	
</div>					
	

	

