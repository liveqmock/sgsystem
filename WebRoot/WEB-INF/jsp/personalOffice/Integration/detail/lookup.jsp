<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--组织机构 -- 角色管理--查找带回(单选)
--%>
<div class="pageHeader" >
	<form id="pagerForm" onsubmit="return dialogSearch(this);" action="detail/lookup.do" method="get">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input type="hidden"  name="asGroup" value="${param.asGroup }"/>
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 200px">
				<tr >
					<td>
						姓名：
						<input type="text" size="10" name="trueName"
							value="<c:out value="${param.trueName }" />" />
					</td>
					<td>
						<label style="width: 40px">
							性别：
						</label>
						<select class="combox" name="userSex" sValue="${param.userSex }">
							<option value="">
								全部
							</option>
							<option value="1">
								男
							</option>
							<option value="0">
								女
							</option>
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
			
				<th width="120" align="center">
					部门
				</th>
				<th width="140" align="center">
					姓名
				</th>
				<th width="30" align="center">
					性别
				</th>
				<th width="130" align="center">
					月积分/年积分
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="u" items="${users }" >
				
				<tr>
			
				
				
					<td title="<my:outDeptName id="${u.deptId }"/>">
						<my:outDeptName id="${u.deptId }" />
					</td>
					<td title="${u.trueName }">
					<a  href="javascript:$.bringBack({id:'${u.id }', zh:'${u.userName }',name:'${u.trueName }',minute:'${u.monthMinute }/${u.yearMinute }'})" title="查找带回">
						<c:out value="${u.trueName }" />
						</a>
					</td>
					<td>
						<c:choose>
							<c:when test="${u.userSex==1}">男</c:when>
							<c:otherwise>女</c:otherwise>
						</c:choose>
					</td>
					<td>
					<c:choose>
							<c:when test="${ u.monthMinute!=null }">
								${u.monthMinute }/${u.yearMinute }
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
					
					
					
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_dialog.jsp" %>
	
</div>					
	

	

