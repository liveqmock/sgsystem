<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--数据库备份
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="database/load.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 100px">
					<tr>
						<td>
							系统自动备份数据库，文件保存在服务器，为防止服务器意外数据丢失，建议定期导出备份的数据。
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="database/backupPage.do?rel=${param.rel}" target="dialog" width="800" height="300" rel="${param.rel}_addfile"><span>手动备份</span></a></li>
			<li class="line">|</li>
			<li><a class="add" href="database/uploadFilePage.do?rel=${param.rel}" target="dialog" width="800" height="300" rel="${param.rel}_addfile"><span>手动恢复</span></a></li>
			<li class="line">|</li>
			<li><a class="delete" href="database/del.do" target="selectedTodo" rel="names" title="确定要删除吗?" ><span>批量删除</span></a></li>
			
			
				
		</ul>
	</div>
	<table class="table" width="1100" layoutH="97">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="names" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th  align="center">文件名称</th>
				<th width="220" align="center" >文件大小</th>
				<th width="170" align="center" >创建时间</th>
				<th width="180" align="center">操作</th>
	
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.files }" varStatus="status">
				
				<tr >
					<td><input name="names" value="${m.name }" type="checkbox"></td>
					<td>${status.count }</td>
					<td>${m.name }</td>
					<td><my:fileSizeFormat value="${m.size }" /> </td>
					<td >
						<fmt:formatDate value="${m.time}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td>
						<c:url var="url_download" value="database/export.do" >
							<c:param name="name" value="${m.name }" />			
						</c:url>
						<a  href="${url_download }" target="_blank" >导出备份</a>
						|
						<a  href="database/restore.do?name=${m.name }"  target="ajaxTodo" title="确定恢复此版本数据吗?" >恢复数据</a>
						
					
					
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	
	
</div>



	

