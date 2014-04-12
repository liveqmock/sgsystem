<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--地区管理
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="district/load.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<input type="hidden" name="superId" value="${param.superId }" />
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 100px">
					<tr>
						<c:if test="${!empty requestScope.spName}">
							<td>
								<span>所属上级：<font color='red'>[ <c:out value="${requestScope.spName }" /> ]</font></span>
								
							</td>
						</c:if>
						<td>
							名称：<input type="text" name="disName" value="<c:out value="${param.disName }" />"/>
						</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset">重置</button></div></div></td>
						<c:if test="${!empty requestScope.spId}">
							<td>
								<a class="button" href="district/load.do?superId=${requestScope.spId }&rel=${param.rel}" target="navTab" rel="${param.rel}" title="地区管理"><span>返回上级</span></a>
							</td>
						</c:if>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="district/addPage.do">
				<li><a class="add" href="district/addPage.do?rel=${param.rel }&id=${param.superId}" target="dialog" width="750"  rel="${param.rel}_add"><span>新增</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="district/updatePage.do">	
				<li><a class="edit" href="district/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="750"  rel="${param.rel}_update" ><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="district/del.do">	
				<li><a class="delete" href="district/del.do" target="selectedTodo" rel="ids" title="请谨慎操作！删除时会将所有下级地区一同删除，确定要删除吗?" ><span>批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="90" align="center">顺序号</th>
				<th width="300" align="center">名称</th>
				<th  align="center">备注</th>
				<th width="80" align="center">操作</th>
	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.dis }" varStatus="status">
				
				<tr target="id" rel="${m.id }"  <my:validationAuthority url="district/updatePage.do">	ondblclick="$.pdialog.open('district/updatePage.do?id=${m.id}&rel=${param.rel}', '${param.rel}_update', '修改', {width:750})" </my:validationAuthority> >
					
					<td><input name="ids" value="${m.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td ><c:out value="${m.disSort }" /></td>
					<td title="${m.disName }"><c:out value="${m.disName }" /></td>
					<td title="${m.disDesc }"><c:out value="${m.disDesc }" /></td>
					<td>
						<a href="district/load.do?superId=${m.id }&rel=${param.rel}" target="navTab" rel="${param.rel}" title="地区管理">维护下级</a>
					</td>
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>



	

