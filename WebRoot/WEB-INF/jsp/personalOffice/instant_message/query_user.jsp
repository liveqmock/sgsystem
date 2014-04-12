<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：个人办公--即时消息--全部用户--查询用户
--%>
<div class="pageHeader" style="border:1px #B8D0D6 solid;" >
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}');" action="instantMessage/queryUsers.do" method="post">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input type="hidden" name="deptId" value="${param.deptId }"/>
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 50px">
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
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">

	<table class="table" width="700" layoutH="130" rel="${param.rel}">
		<thead>
			<tr>
				<th width="28" align="center" >行号</th>
				<th width="140" >姓名</th>
				<th width="100"  align="center">最后登陆时间</th>
				<th width="30" align="center">发送信息</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="u" items="${requestScope.users }" varStatus="status">
				
				<tr >
					<td>${status.count }</td>
					<td>
							<c:choose>
								<c:when test="${u.userSex==1}">
									<img src="resource/images/user/U01.png" alt="男" style="vertical-align:middle;"/>
								</c:when>
							<c:otherwise>
								<img src="resource/images/user/U11.png" alt="女" style="vertical-align:middle;"/>
							</c:otherwise></c:choose>
							<c:out value="${u.trueName }" />
							
					</td>
					
					<td >
						<fmt:formatDate value="${u.lastLoginTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td>
						<a href="instantMessage/addPage.do?userId=${u.id }&rel=${param.rel}_add" target="navTab" rel="${param.rel}_add" title="发送消息">
							<img src="resource/images/reply.gif" alt="发送信息" title="发送信息" style="margin-top: 3px;"/>
						</a>
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab_div.jsp" %>
</div>					

