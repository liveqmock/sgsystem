<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：系统管理--字典管理
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);"
		action="list/load.do" method="get">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp"%>
			<div class="searchBar">
				<table class="searchContent" style="margin-left: 150px">
					<tr>
						<td>字典值：<input type="text" name="listValue"
							value="<c:out value="${param.listValue }" />" /></td>
						<td><select class="combox" name="listType"
							sValue="${param.listType}">
								<option value="">全部类型</option>
								<%@ include file="/WEB-INF/jsp/system/list_values/list.jsp"%>
						</select></td>
						<td><div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">查询</button>
								</div>
							</div>
						</td>
						<td><div class="button">
								<div class="buttonContent">
									<button type="button" formreset="reset">重置</button>
								</div>
							</div>
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
			<my:validationAuthority url="list/addPage.do">
				<li><a class="add"
					href="list/addPage.do?rel=${param.rel }&listType=${param.listType}"
					target="dialog" width="750" rel="${param.rel}_add"><span>新增</span>
				</a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="list/updatePage.do">
				<li><a class="edit"
					href="list/updatePage.do?id={id}&rel=${param.rel}" target="dialog"
					width="750" rel="${param.rel}_update" warn="请先选择一个字典值"><span>修改</span>
				</a>
				</li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="list/del.do">
				<li><a class="delete" href="list/del.do" target="selectedTodo"
					rel="ids" title="确定要删除吗?" warn="至少选择一条字典值"><span>批量删除</span>
				</a>
				</li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox"
					group="ids" class="checkboxCtrl">
				</th>
				<th width="28" align="center">行号</th>
				<th width="170" align="center">类型</th>
				<th width="500" align="center">字典值</th>
				<th align="center">备注</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${requestScope.values }" varStatus="status">

				<tr target="id" rel="${v.id }">

					<td><input name="ids" value="${v.id }" type="checkbox">
					</td>
					<td>${status.count }</td>
					<td><c:choose>
							<c:when test="${v.listType==1}">通知类型</c:when>
							<c:when test="${v.listType==2}">会议类型</c:when>
							<c:when test="${v.listType==3}">新闻类型</c:when>
							<c:when test="${v.listType==4}">通讯录分组</c:when>
							<c:when test="${v.listType==5}">日志类型</c:when>
							<c:when test="${v.listType==6}">日程类型</c:when>
							<c:when test="${v.listType==7}">公告类型</c:when>
							<c:when test="${v.listType==11}">员工类型</c:when>
							<c:when test="${v.listType==12}">职位</c:when>
							<c:when test="${v.listType==13}">学历</c:when>
							<c:when test="${v.listType==14}">离职原因</c:when>
							<c:when test="${v.listType==15}">退休原因</c:when>
							<c:when test="${v.listType==16}">办公用品类型</c:when>
							<c:when test="${v.listType==21}">所属社区</c:when>
							<c:otherwise></c:otherwise>
						</c:choose></td>
					<td title="${v.listValue }"><c:out value="${v.listValue }" />
					</td>

					<td title="${v.listDesc}"><c:out value="${v.listDesc}" />
					</td>

				</tr>

			</c:forEach>

		</tbody>
	</table>

	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp"%>

</div>