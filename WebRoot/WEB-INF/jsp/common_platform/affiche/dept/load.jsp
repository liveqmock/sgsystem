<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：公共平台--公告管理--部门公告
--%>
<div class="pageHeader">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="affiche/dept/load.do" method="post">
		<div class="searchBar">
			<%@ include file="/WEB-INF/jsp/commons/form_param.jsp" %>
			<div class="searchBar">
				<table class="searchContent" >
					<tr >
						<td>部门:
							<a href="dept/lookUpPage.do?type=1" lookupGroup="dept" title="部门查询" >
								<input class="clear_user" type="text" size="15" name="deptName"  readonly="readonly"  toName="dept.name" value="${param.deptName }"/>
							</a>
							<input type="hidden" class="clear_dept" name="deptId" toName="dept.id" value="${param.deptId }"/>
						</td>
						<td>
							标题:<input type="text" name="afficheTitle" value="<c:out value="${param.afficheTitle }" />"/>
						</td>
						<td>
							<select class="combox"   name="afficheType"  sValue="${param.afficheType}" >
								<option value="">全部类型</option>
								<my:outOptions type="7"/>
							</select>
						</td>
						<td>发布人:
							<a href="user/lookUpPage.do?type=1" lookupGroup="user" title="用户查询" >
								<input  type="text" name="userName" value="${param.userName }"  readonly="readonly" size="15" toName="user.name"/>
							</a>
							<input type="hidden"  name="userId" class="clear_user" toName="user.id"  value="${param.userId }" />
						</td>
						<td>发布时间:
								<input type="text" size="12" readonly="readonly" onFocus="WdatePicker()" name="startDate" value="${param.startDate }" />
								<span class="limit">-</span>
								<input type="text" size="12" readonly="readonly" onFocus="WdatePicker()" name="endDate" value="${param.endDate }" />
						</td>
						<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
						<td><div class="button"><div class="buttonContent"><button type="button" formreset="reset" resetClass="clear_user">重置</button></div></div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<my:validationAuthority url="affiche/dept/addPage.do">	
				<li><a class="add" href="affiche/dept/addPage.do?rel=${param.rel }" target="navTab" rel="${param.rel}_add"><span>添加</span></a></li>
				<li class="line">|</li>	
			</my:validationAuthority>
			<my:validationAuthority url="affiche/dept/updatePage.do">	
				<li><a class="edit" href="affiche/dept/updatePage.do?id={id}&rel=${param.rel}" target="navTab" rel="${param.rel}_update" ><span>修改</span></a></li>
				<li class="line">|</li>
			</my:validationAuthority>
			<my:validationAuthority url="affiche/dept/del.do">	
				<li><a class="delete" href="affiche/dept/del.do" target="selectedTodo" rel="ids" title="确定要删除吗?" ><span>批量删除</span></a></li>
			</my:validationAuthority>
		</ul>
	</div>
	<table class="table" width="1100" layoutH="114">
		<thead>
			<tr>
				<th width="22" align="center"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="28" align="center">行号</th>
				<th width="170"  align="center">公告类型</th>
				<th  align="center">标题</th>
				<th width="140"  align="center">发布人</th>
				<th width="150"  align="center" orderField="createTime"  class="${fromParam.orderDirection}">发送时间</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${requestScope.as }" varStatus="status">
				
				<tr target="id" rel="${m.id }">
				
					<td ><input name="ids" value="${m.id }" type="checkbox"></td>
					<td>${status.count }</td>
					<td>
						<my:outSelectValue id="${m.afficheType }"/>
					</td>
					<td title="${m.afficheTitle }">
						<a href="affiche/dept/show.do?id=${m.id }" target="navTab" rel="${param.rel}_show">
							<c:if test="${m.isTop==1}"><img src="resource/images/arrow_up.gif"  style="margin-top: 3px;"/></c:if>
							<c:out value="${m.afficheTitle }" /></a>
					</td>
					<td ><my:outTrueName id="${m.userId }"/></td>
					<td >
						<fmt:formatDate value="${m.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					
				</tr>
				
			</c:forEach>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/jsp/commons/panelBar_navTab.jsp" %>
	
</div>