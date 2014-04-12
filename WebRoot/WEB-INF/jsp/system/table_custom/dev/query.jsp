<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：系统管理--导出打印自定义管理--查询
--%>
<div >
	<form id="pagerForm" onsubmit="return divSearch(this, '${param.rel}');" action="tableCustom/dev/query.do" method="get">
		<input type="hidden" name="rel" value="${param.rel }" />
		<input type="hidden" name="tbType" value="${param.tbType }"/>
	</form>
</div>
<div class="pageContent" style="border:1px #B8D0D6 solid;border-top:none;">
	<div class="panelBar">
		 <ul class="toolBar">
		 		<my:validationAuthority url="tableCustom/dev/addPage.do">
					<li><a class="add" href="tableCustom/dev/addPage.do?rel=${param.rel}&tbType=${param.tbType}" target="dialog" width="800" height="450" rel="${param.rel}_add"><span>添加</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="tableCustom/dev/updatePage.do">
					<li><a class="edit" href="tableCustom/dev/updatePage.do?id={id}&rel=${param.rel}" target="dialog" width="800" height="400" rel="${param.rel}_update" ><span>修改</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
				<my:validationAuthority url="tableCustom/dev/del.do">
					<li><a class="delete" href="tableCustom/dev/del.do?rel=${param.rel}" target="selectedTodo" rel="ids" title="请谨慎操作！确定要删除吗?" ><span>批量删除</span></a></li>
					<li class="line">|</li>
				</my:validationAuthority>
			</ul>
		</div>
	<table class="table" width="950" layoutH="95" rel="${param.rel}">
		<thead>
			<tr>
				<th width="22" align="center" ><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="32" align="center">序号</th>
				<th width="200" align="center">属性名</th>
				<th width="140"  align="center">显示名</th>
				<th width="140"  align="center">别名</th>
				<th width="180" align="center">属性类型</th>
				<th width="60"  align="center">导出</th>
				<th width="60"  align="center">打印</th>
				<th width="60"  align="center">显示</th>
			
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.ts }" >
				
				<tr target="id" rel="${m.id }" >
					<td ><input name="ids" value="${m.id }" type="checkbox"></td>
					<td>${m.fieldSort }</td>
					<td><c:out value="${m.fieldName }" /></td>
					<td><c:out value="${m.fieldTitle }" /></td>
					<td><c:out value="${m.fieldAnotherTitle }" /></td>
					<td>
						<c:choose>
							<c:when test="${m.fieldType==1}">文本</c:when>
							<c:when test="${m.fieldType==2}">数字</c:when>
							<c:when test="${m.fieldType==3}">日期(YYYY-MM-DD)</c:when>
							<c:when test="${m.fieldType==4}">日期时间(YYYY-MM-DD HH:MM:SS)</c:when>
							<c:when test="${m.fieldType==5}">用户id(转换用户姓名)</c:when>
							<c:when test="${m.fieldType==6}">部门id(转换部门名称)</c:when>
							<c:when test="${m.fieldType==7}">用户id(转换用户登录名)</c:when>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${m.isExport==1}">
								 <img src="resource/images/small/Check_16x16.png" alt="是" title="是"  style="margin-top: 2px;"/>
							</c:when>
							<c:otherwise>
								<img src="resource/images/small/Delete_16x16.png" alt="否" title="否" style="margin-top: 2px;"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${m.isPrint==1}">
								<img src="resource/images/small/Check_16x16.png" alt="是" title="是"  style="margin-top: 2px;"/>
							</c:when>
							<c:otherwise>
								<img src="resource/images/small/Delete_16x16.png" alt="否" title="否" style="margin-top: 2px;"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${m.isShow==1}">
								<img src="resource/images/small/Check_16x16.png" alt="是" title="是"  style="margin-top: 2px;"/>
							</c:when>
							<c:otherwise>
								<img src="resource/images/small/Delete_16x16.png" alt="否" title="否" style="margin-top: 2px;"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	
</div>					

