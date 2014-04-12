<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<% request.setAttribute("user",request.getParameter("rel")); 
System.err.println("xxxx:"+request.getParameter("rel"));
%>
<%--
	模块：系统管理--用户管理--查询
--%>
<div class="pageHeader" style="border:1px #B8D0D6 solid;" >
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}');" action="user/queryUsers.do" method="get">
		
		<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
		<input type="hidden" name="deptId" value="${param.deptId }"/>
		<div class="searchBar">
			<table class="searchContent" style="margin-left: 50px">
				<tr >
					<td>
						账号：<input type="text" name="userName" value="<c:out value="${param.userName }" />"/>
					</td>
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
					<!-- <td >
						创建人：<input type="text" name="trueName" value="<c:out value="${param.trueName }" />"/>
					</td>-->
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
					<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
	<div class="panelBar">
		 <ul class="toolBar">
		 		<my:validationAuthority url="user/addPage.do">
					<li><a class="add" href="user/addPage.do?rel=${param.rel}&deptId=${param.deptId}" target="dialog" width="800" height="450" rel="${param.rel}_add"><span>新增用户</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="user/updatePage.do">
					<li><a class="edit" href="user/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="800" height="400" rel="${param.rel}_update" warn="请先选择一个用户"><span>修改</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="user/del.do">
					<li><a class="delete" href="user/del.do?rel=${param.rel}" target="selectedTodo" rel="ids" title="请谨慎操作！删除用户的同时也会删除跟用户相关的一些数据，如果想保留数据，可以设置禁止用户登录系统代替删除。确定要删除吗?" warn="至少选择一个用户"><span>批量删除</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="user/updateRolePage.do">
					<li><a class="edit" href="user/updateRolePage.do?id={id}" target="dialog" width="500" height="400" rel="${param.rel}_updaterole" warn="请先选择一个用户"><span>查看角色</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="user/updatePwPage.do">
					<li><a class="edit" href="user/updatePwPage.do?id={id}&rel=${param.rel}" target="dialog" width="750"  rel="${param.rel}_updatepw" warn="请先选择一个用户"><span>重置密码</span></a></li>
				</my:validationAuthority>
				<my:validationAuthority url="user/showPowersPage.do">
					<li><a class="edit" href="user/showPowersPage.do?id={id}" target="dialog" width="500" height="400" rel="${param.rel}_updaterole" warn="请先选择一个用户"><span>查看权限</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="user/excelPage.do">
					<li><a class="add" href="user/excelPage.do?rel=${param.rel }" target="dialog" width="500" height="300" rel="${param.rel}_imp"><span>Excel导入</span></a></li>
					<li class="line">|</li>	
				</my:validationAuthority>
				
			</ul>
		</div>
	<table class="table" width="1400" layoutH="160" rel="${param.rel}">
		<thead>
			<tr>
				<th width="22" align="center" ><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="250" align="center">部门</th>
				<th width="210" align="center">账号</th>
				<th width="140" align="center">姓名</th>
				<th width="30"  align="center">性别</th>
				<th width="32"  align="center">状态</th>
				<th width="210"  align="center">创建人</th>
				<th width="150" align="center" orderField="registerTime"  class="${fromParam.orderDirection}" >创建时间</th>
				<th width="250" align="center">备注</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="u" items="${requestScope.users }" varStatus="status">
				
				<tr target="id" rel="${u.id }" >
					<td ><input name="ids" value="${u.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td title="<my:outDeptName id="${u.deptId }"/>"><my:outDeptName id="${u.deptId }"/></td>
					<td >
						<a href="user/show.do?id=${u.id }" target="dialog" width="800" height="450" rel="${param.rel}_show" title="查看 <c:out value="${u.userName }" /> 详情"><c:out value="${u.userName }" /></a>
					</td>
					
					<td><c:out value="${u.trueName }" /></td>
					<td>
						<c:choose><c:when test="${u.userSex==1}">男</c:when><c:otherwise>女</c:otherwise></c:choose>
					</td>
					<td>
						<c:choose><c:when test="${u.userStatus==1}">正常</c:when><c:otherwise>禁用</c:otherwise></c:choose>
					</td>
					<td ><my:outTrueName id="${u.registerUid }"/></td>
					<td >
						<fmt:formatDate value="${u.registerTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td title="${u.userDesc }"><c:out value="${u.userDesc }" /></td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab_div.jsp" %>
	
	
</div>					

